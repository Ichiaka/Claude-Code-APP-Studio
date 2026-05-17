#!/usr/bin/env bash
# Statusline para Claude Code App Studio.
# Muestra: modelo · contexto% · stage del proyecto
#
# Claude Code invoca este script en cada actualización y le pasa por stdin
# un JSON con la info de la sesión. La primera línea de stdout es lo que se
# muestra debajo del prompt.
#
# Stages soportados (en orden, auto-detectados a partir de los artefactos):
#   discovery   → no hay ADR de stack todavía
#   design      → hay stack pero no hay features diseñadas
#   building    → hay features diseñadas y/o sprints activos
#   release     → existe CHANGELOG y el último entry tiene fecha cercana
#   maintenance → existe CHANGELOG con releases pero el último es viejo
#
# Override manual: si existe production/stage.txt, su contenido manda.

set -uo pipefail

# Leer JSON de stdin
INPUT=$(cat)

# === Extraer campos del JSON (con fallbacks) ===
if command -v jq >/dev/null 2>&1; then
  MODEL=$(echo "$INPUT" | jq -r '.model.display_name // "Claude"' 2>/dev/null)
  CTX_PCT=$(echo "$INPUT" | jq -r '.context_window.used_percentage // 0' 2>/dev/null | cut -d. -f1)
  CWD=$(echo "$INPUT" | jq -r '.workspace.current_dir // .cwd // "."' 2>/dev/null)
else
  # Fallback sin jq: grep básico (mejor instalar jq)
  MODEL=$(echo "$INPUT" | grep -oE '"display_name"[[:space:]]*:[[:space:]]*"[^"]+"' | head -1 | sed 's/.*"\([^"]*\)"$/\1/')
  MODEL=${MODEL:-Claude}
  CTX_PCT=$(echo "$INPUT" | grep -oE '"used_percentage"[[:space:]]*:[[:space:]]*[0-9.]+' | head -1 | grep -oE '[0-9.]+' | cut -d. -f1)
  CTX_PCT=${CTX_PCT:-0}
  CWD=$(echo "$INPUT" | grep -oE '"current_dir"[[:space:]]*:[[:space:]]*"[^"]+"' | head -1 | sed 's/.*"\([^"]*\)"$/\1/')
  CWD=${CWD:-.}
fi

# === Detectar stage del proyecto ===
detect_stage() {
  local dir="$1"

  # Override manual tiene prioridad
  if [ -f "$dir/production/stage.txt" ]; then
    cat "$dir/production/stage.txt" | head -1 | tr -d '[:space:]'
    return
  fi

  # CHANGELOG → release o maintenance
  if [ -f "$dir/CHANGELOG.md" ] && grep -qE '^##[[:space:]]*\[?[0-9]+\.[0-9]+' "$dir/CHANGELOG.md" 2>/dev/null; then
    # Si la última fecha es de los últimos 14 días → release; si no → maintenance
    LAST_DATE=$(grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' "$dir/CHANGELOG.md" 2>/dev/null | head -1)
    if [ -n "$LAST_DATE" ]; then
      # Comparar con fecha actual (portátil entre macOS y Linux)
      NOW_EPOCH=$(date +%s)
      if date -j -f "%Y-%m-%d" "$LAST_DATE" +%s >/dev/null 2>&1; then
        LAST_EPOCH=$(date -j -f "%Y-%m-%d" "$LAST_DATE" +%s 2>/dev/null)
      else
        LAST_EPOCH=$(date -d "$LAST_DATE" +%s 2>/dev/null || echo 0)
      fi
      DIFF_DAYS=$(( (NOW_EPOCH - LAST_EPOCH) / 86400 ))
      if [ "$DIFF_DAYS" -le 14 ]; then
        echo "release"
        return
      else
        echo "maintenance"
        return
      fi
    fi
    echo "maintenance"
    return
  fi

  # Sprint activo o features diseñadas → building
  if ls "$dir"/production/sprints/sprint-*.md >/dev/null 2>&1; then
    echo "building"
    return
  fi
  if ls "$dir"/docs/features/*.md >/dev/null 2>&1; then
    echo "building"
    return
  fi

  # Hay stack decidido pero no features → design
  if [ -f "$dir/docs/adr/0001-stack.md" ]; then
    echo "design"
    return
  fi

  # Por defecto: descubrimiento
  echo "discovery"
}

STAGE=$(detect_stage "$CWD")

# === Color del contexto según porcentaje ===
# ANSI: 32 verde, 33 amarillo, 31 rojo
if [ "$CTX_PCT" -ge 80 ]; then
  CTX_COLOR=$'\033[31m'   # rojo
elif [ "$CTX_PCT" -ge 60 ]; then
  CTX_COLOR=$'\033[33m'   # amarillo
else
  CTX_COLOR=$'\033[32m'   # verde
fi

# === Color del stage ===
case "$STAGE" in
  discovery)   STAGE_COLOR=$'\033[36m' ;;  # cian
  design)      STAGE_COLOR=$'\033[34m' ;;  # azul
  building)    STAGE_COLOR=$'\033[35m' ;;  # magenta
  release)     STAGE_COLOR=$'\033[33m' ;;  # amarillo
  maintenance) STAGE_COLOR=$'\033[37m' ;;  # gris claro
  *)           STAGE_COLOR=$'\033[37m' ;;
esac

DIM=$'\033[2m'
BOLD=$'\033[1m'
RESET=$'\033[0m'

# === Salida final ===
# Formato: [Modelo] · ctx:XX% · stage:NOMBRE
printf "${BOLD}[%s]${RESET} ${DIM}·${RESET} ${CTX_COLOR}ctx:%d%%${RESET} ${DIM}·${RESET} ${STAGE_COLOR}stage:%s${RESET}" \
  "$MODEL" "$CTX_PCT" "$STAGE"

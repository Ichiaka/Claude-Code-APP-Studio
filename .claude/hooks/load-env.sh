#!/usr/bin/env bash
# Hook SessionStart.
# Detecta el estado de las variables de entorno del proyecto y avisa.
# Por defecto solo avisa; si .claude/preferences.md tiene auto_load_env activo,
# carga .env.local automáticamente.
set -uo pipefail

CWD="${1:-$PWD}"
[ -d "$CWD" ] || CWD="$PWD"

# ¿Hay .env.example pero no .env.local? Aviso.
if [ -f "$CWD/.env.example" ] && [ ! -f "$CWD/.env.local" ]; then
  echo "[entorno] El proyecto tiene .env.example pero falta .env.local."
  echo "          Cópialo y rellena con valores reales: cp .env.example .env.local"
fi

# ¿Hay .env.local? Comprobar si auto_load_env está activo en preferencias.
if [ -f "$CWD/.env.local" ]; then
  AUTO_LOAD="false"
  if [ -f "$CWD/.claude/preferences.md" ]; then
    if grep -qE '^\s*-\s*\[x\]\s*\*\*auto_load_env\*\*' "$CWD/.claude/preferences.md" 2>/dev/null; then
      AUTO_LOAD="true"
    fi
  fi

  if [ "$AUTO_LOAD" = "true" ]; then
    # Carga silenciosa
    set -a
    # shellcheck disable=SC1090
    . "$CWD/.env.local" 2>/dev/null || true
    set +a
  else
    echo "[entorno] .env.local detectado. Para cargarlo automáticamente, marca"
    echo "          'auto_load_env' en .claude/preferences.md."
  fi
fi

exit 0

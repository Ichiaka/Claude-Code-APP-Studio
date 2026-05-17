#!/usr/bin/env bash
# Carga contexto al iniciar sesión.
set -uo pipefail

echo "=== Estado del estudio ==="

# Stage del proyecto (auto-detectado igual que en statusline.sh)
detect_stage() {
  if [ -f "production/stage.txt" ]; then
    cat production/stage.txt | head -1 | tr -d '[:space:]'
    return
  fi
  if [ -f "CHANGELOG.md" ] && grep -qE '^##[[:space:]]*\[?[0-9]+\.[0-9]+' "CHANGELOG.md" 2>/dev/null; then
    LAST_DATE=$(grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' "CHANGELOG.md" 2>/dev/null | head -1)
    if [ -n "$LAST_DATE" ]; then
      NOW_EPOCH=$(date +%s)
      if date -j -f "%Y-%m-%d" "$LAST_DATE" +%s >/dev/null 2>&1; then
        LAST_EPOCH=$(date -j -f "%Y-%m-%d" "$LAST_DATE" +%s 2>/dev/null)
      else
        LAST_EPOCH=$(date -d "$LAST_DATE" +%s 2>/dev/null || echo 0)
      fi
      DIFF_DAYS=$(( (NOW_EPOCH - LAST_EPOCH) / 86400 ))
      [ "$DIFF_DAYS" -le 14 ] && { echo "release"; return; }
      echo "maintenance"; return
    fi
    echo "maintenance"; return
  fi
  ls production/sprints/sprint-*.md >/dev/null 2>&1 && { echo "building"; return; }
  ls docs/features/*.md >/dev/null 2>&1 && { echo "building"; return; }
  [ -f "docs/adr/0001-stack.md" ] && { echo "design"; return; }
  echo "discovery"
}

STAGE=$(detect_stage)
echo "Stage actual: $STAGE"

# Pista contextual según stage
case "$STAGE" in
  discovery)
    echo "→ No hay ADR de stack todavía. Considera /brainstorm-app, /define-mvp o /choose-stack."
    ;;
  design)
    echo "→ Stack decidido. Cuando tengas claro qué construir, usa /architect-feature para diseñar antes de codear."
    ;;
  building)
    echo "→ Estás construyendo. Respeta los criterios de aceptación de cada feature; usa /scope-check si entra trabajo nuevo."
    ;;
  release)
    echo "→ Release reciente. /release-checklist obligatorio antes de cualquier merge a producción."
    ;;
  maintenance)
    echo "→ Producto en mantenimiento. Prioriza bugs y deuda; features nuevas pasan por /scope-check."
    ;;
esac

# ADR de stack
echo ""
if [ -f "docs/adr/0001-stack.md" ]; then
  echo "Stack: ver docs/adr/0001-stack.md"
else
  echo "⚠  Aún no hay decisión de stack."
fi

# Estado de sesión anterior
if [ -f "production/session-state/current.md" ]; then
  echo ""
  echo "--- Última sesión ---"
  tail -20 production/session-state/current.md 2>/dev/null
fi

# Sprint activo
LATEST_SPRINT=$(ls -1 production/sprints/sprint-*.md 2>/dev/null | sort | tail -1)
if [ -n "$LATEST_SPRINT" ]; then
  echo ""
  echo "--- Sprint activo: $LATEST_SPRINT ---"
  head -10 "$LATEST_SPRINT"
fi

exit 0

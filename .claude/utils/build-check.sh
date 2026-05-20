#!/usr/bin/env bash
# Utilidad de build check.
# Ejecuta el build del proyecto y reporta el resultado. Sirve como check
# rápido antes de release o cuando algo "huele" mal.
#
# Uso: bash .claude/utils/build-check.sh [directorio]
# Si no se pasa directorio, usa el actual.
set -uo pipefail

CWD="${1:-$PWD}"
[ -d "$CWD" ] || { echo "Directorio no válido: $CWD"; exit 1; }

cd "$CWD" || exit 1

# Detectar package manager.
PM="npm"
if   [ -f "pnpm-lock.yaml" ]; then PM="pnpm"
elif [ -f "yarn.lock" ];      then PM="yarn"
elif [ -f "bun.lockb" ];      then PM="bun"
fi

# Detectar script de build.
if [ ! -f "package.json" ]; then
  echo "No es un proyecto Node (sin package.json)."
  exit 1
fi

if command -v python3 >/dev/null 2>&1; then
  HAS_BUILD=$(python3 -c "
import json
try:
    d=json.load(open('package.json'))
    print('yes' if 'build' in d.get('scripts',{}) else '')
except Exception:
    pass
" 2>/dev/null)
  if [ -z "$HAS_BUILD" ]; then
    echo "No hay script 'build' en package.json."
    exit 1
  fi
fi

# Construir el comando.
case "$PM" in
  yarn) CMD="yarn build" ;;
  bun)  CMD="bun run build" ;;
  *)    CMD="$PM run build" ;;
esac

echo "[build-check] Ejecutando: $CMD"
START=$(date +%s)
if $CMD; then
  END=$(date +%s)
  ELAPSED=$((END - START))
  echo "[build-check] OK (${ELAPSED}s)"
  exit 0
else
  END=$(date +%s)
  ELAPSED=$((END - START))
  echo "[build-check] FALLO tras ${ELAPSED}s."
  exit 1
fi

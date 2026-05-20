#!/usr/bin/env bash
# Hook SessionStart.
# Detecta el package manager del proyecto y comprueba si faltan dependencias.
# Por defecto avisa; si auto_install_deps está activo en preferencias, instala.
set -uo pipefail

CWD="${1:-$PWD}"
[ -d "$CWD" ] || CWD="$PWD"

cd "$CWD" 2>/dev/null || exit 0

# Detectar el package manager por el lockfile.
PM=""
INSTALL_CMD=""
LOCK=""
if   [ -f "pnpm-lock.yaml" ]; then PM="pnpm"; INSTALL_CMD="pnpm install"; LOCK="pnpm-lock.yaml"
elif [ -f "yarn.lock" ];      then PM="yarn"; INSTALL_CMD="yarn install"; LOCK="yarn.lock"
elif [ -f "bun.lockb" ];      then PM="bun";  INSTALL_CMD="bun install";  LOCK="bun.lockb"
elif [ -f "package-lock.json" ] || [ -f "package.json" ]; then
  PM="npm"; INSTALL_CMD="npm install"; LOCK="package-lock.json"
fi

[ -z "$PM" ] && exit 0  # No es un proyecto Node, nada que comprobar.

# ¿Falta node_modules, o el lockfile es más nuevo que node_modules?
NEEDS_INSTALL="false"
if [ ! -d "node_modules" ]; then
  NEEDS_INSTALL="true"
  REASON="falta el directorio node_modules"
elif [ -f "$LOCK" ] && [ "$LOCK" -nt "node_modules" ]; then
  NEEDS_INSTALL="true"
  REASON="el lockfile $LOCK es más reciente que node_modules"
fi

if [ "$NEEDS_INSTALL" != "true" ]; then
  exit 0
fi

# ¿Auto-instalación activa en preferences.md?
AUTO_INSTALL="false"
if [ -f "$CWD/.claude/preferences.md" ]; then
  if grep -qE '^\s*-\s*\[x\]\s*\*\*auto_install_deps\*\*' "$CWD/.claude/preferences.md" 2>/dev/null; then
    AUTO_INSTALL="true"
  fi
fi

if [ "$AUTO_INSTALL" = "true" ]; then
  echo "[dependencias] Instalando con $PM (auto_install_deps activo)..."
  $INSTALL_CMD
else
  echo "[dependencias] Faltan dependencias ($REASON)."
  echo "               Ejecuta: $INSTALL_CMD"
  echo "               Para que se instale automáticamente al iniciar sesión,"
  echo "               marca 'auto_install_deps' en .claude/preferences.md."
fi

exit 0

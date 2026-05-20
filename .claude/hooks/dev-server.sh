#!/usr/bin/env bash
# Hook SessionStart.
# Detecta el script de desarrollo del proyecto y avisa al arquitecto.
# Por defecto solo avisa; si auto_start_dev_server está activo en preferencias,
# arranca el servidor en segundo plano.
set -uo pipefail

CWD="${1:-$PWD}"
[ -d "$CWD" ] || CWD="$PWD"

cd "$CWD" 2>/dev/null || exit 0

# Solo proyectos Node con package.json.
[ -f "package.json" ] || exit 0

# Detectar el script de dev. Mira los nombres habituales.
DEV_SCRIPT=""
for candidate in dev start serve develop; do
  if command -v python3 >/dev/null 2>&1; then
    HAS=$(python3 -c "
import json,sys
try:
    d=json.load(open('package.json'))
    s=d.get('scripts',{})
    print('$candidate' if '$candidate' in s else '')
except Exception:
    pass
" 2>/dev/null)
    if [ -n "$HAS" ]; then
      DEV_SCRIPT="$candidate"
      break
    fi
  fi
done

[ -z "$DEV_SCRIPT" ] && exit 0  # No hay script de dev detectable.

# ¿Ya hay un servidor de dev corriendo? (heurística simple: puertos típicos)
ALREADY_RUNNING=""
for port in 3000 5173 8080 4321 5174; do
  if command -v lsof >/dev/null 2>&1; then
    if lsof -i ":$port" -sTCP:LISTEN >/dev/null 2>&1; then
      ALREADY_RUNNING="$port"
      break
    fi
  fi
done

if [ -n "$ALREADY_RUNNING" ]; then
  echo "[dev-server] Hay un proceso escuchando en el puerto $ALREADY_RUNNING."
  echo "             Asumimos que el servidor de desarrollo ya está activo."
  exit 0
fi

# Detectar package manager (igual lógica que check-deps).
PM="npm"
if   [ -f "pnpm-lock.yaml" ]; then PM="pnpm"
elif [ -f "yarn.lock" ];      then PM="yarn"
elif [ -f "bun.lockb" ];      then PM="bun"
fi

CMD="$PM run $DEV_SCRIPT"
[ "$PM" = "yarn" ] && CMD="yarn $DEV_SCRIPT"
[ "$PM" = "bun" ]  && CMD="bun run $DEV_SCRIPT"

# ¿Auto-arranque activo?
AUTO_START="false"
if [ -f "$CWD/.claude/preferences.md" ]; then
  if grep -qE '^\s*-\s*\[x\]\s*\*\*auto_start_dev_server\*\*' "$CWD/.claude/preferences.md" 2>/dev/null; then
    AUTO_START="true"
  fi
fi

if [ "$AUTO_START" = "true" ]; then
  echo "[dev-server] Arrancando '$CMD' en segundo plano..."
  nohup $CMD >/tmp/dev-server.log 2>&1 &
  echo "             PID: $!  ·  Logs: /tmp/dev-server.log"
else
  echo "[dev-server] Script de desarrollo detectado: $CMD"
  echo "             Ejecútalo en otra terminal cuando lo necesites."
  echo "             Para arrancarlo automáticamente al iniciar sesión, marca"
  echo "             'auto_start_dev_server' en .claude/preferences.md."
fi

exit 0

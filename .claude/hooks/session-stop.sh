#!/usr/bin/env bash
# Al cerrar sesión, registra fecha y deja un placeholder en current.md para anotar.
set -uo pipefail

mkdir -p production/session-state
DATE=$(date +"%Y-%m-%d %H:%M")
echo "" >> production/session-state/current.md
echo "## Sesión $DATE" >> production/session-state/current.md
echo "" >> production/session-state/current.md
echo "(Resumen pendiente — Claude debería escribir aquí qué se hizo)" >> production/session-state/current.md

exit 0

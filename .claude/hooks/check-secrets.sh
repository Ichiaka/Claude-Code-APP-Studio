#!/usr/bin/env bash
# Hook PostToolUse (matcher: Write|Edit|MultiEdit).
# Tras escribir o editar un archivo, comprueba si el contenido parece
# contener un secreto en claro. Es un aviso (exit 0): no revierte el cambio
# — PostToolUse no puede deshacer la operación — pero alerta para que se
# corrija de inmediato.
#
# Claude Code pasa por stdin un JSON con la ruta del archivo afectado.
set -uo pipefail

INPUT=$(cat 2>/dev/null || echo "")
FILE=""
if command -v python3 >/dev/null 2>&1 && [ -n "$INPUT" ]; then
  # La ruta puede venir como file_path o, en MultiEdit, dentro de tool_input.
  FILE=$(printf '%s' "$INPUT" | python3 -c '
import json, sys
d = json.load(sys.stdin)
ti = d.get("tool_input", {})
print(ti.get("file_path") or ti.get("path") or d.get("file_path") or "")
' 2>/dev/null || echo "")
fi

[ -z "$FILE" ] && exit 0
[ ! -f "$FILE" ] && exit 0

# No analizar archivos donde los secretos de ejemplo son legítimos.
case "$FILE" in
  *.env.example|*.env.sample|*.md|*.lock) exit 0 ;;
esac

PATTERNS='(api[_-]?key|secret|password|token|private[_-]?key|aws_access_key)["\047:=[:space:]]+["\047]?[A-Za-z0-9/_-]{12,}'

if grep -iEq "$PATTERNS" "$FILE" 2>/dev/null; then
  echo "Aviso de seguridad: $FILE parece contener un secreto en claro."
  echo "Muévelo a una variable de entorno o a un gestor de secretos."
fi

exit 0

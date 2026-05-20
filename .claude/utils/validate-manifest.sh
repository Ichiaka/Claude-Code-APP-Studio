#!/usr/bin/env bash
# Validaciones cuando se tocan manifests de plataforma.
# Se puede invocar manualmente o desde un hook personalizado.
set -uo pipefail

EXIT_CODE=0

# web manifest
if [ -f "public/manifest.webmanifest" ]; then
  if command -v python3 >/dev/null 2>&1; then
    python3 -c "
import json
m = json.load(open('public/manifest.webmanifest'))
required = ['name', 'short_name', 'start_url', 'display', 'icons']
missing = [k for k in required if k not in m]
if missing:
    print('❌ manifest.webmanifest falta:', missing)
    exit(1)
icons = m.get('icons', [])
sizes = {i.get('sizes', '') for i in icons}
if not any('192' in s for s in sizes) or not any('512' in s for s in sizes):
    print('❌ manifest.webmanifest necesita iconos 192x192 y 512x512')
    exit(1)
print('✓ manifest.webmanifest OK')
" || EXIT_CODE=1
  fi
fi

exit $EXIT_CODE

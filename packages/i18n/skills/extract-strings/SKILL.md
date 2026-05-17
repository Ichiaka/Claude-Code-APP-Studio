---
name: extract-strings
description: Encuentra strings hardcoded en el código y propone su extracción a archivos de traducción.
---

# /extract-strings

## Protocolo

1. Busca strings user-facing en código (heurística: literales en JSX/templates).
2. Para cada uno, propone:
   - Key sugerida (jerárquica: `feature.subfeature.descripcion`).
   - Archivo de traducción donde irá.
3. Pide aprobación antes de modificar.

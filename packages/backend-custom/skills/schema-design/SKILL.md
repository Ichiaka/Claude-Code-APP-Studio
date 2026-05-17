---
name: schema-design
description: Diseña o evoluciona el schema de DB con migraciones.
---

# /schema-design

## Protocolo

1. Pide la entidad o cambio.
2. Diseña en SQL (o equivalente). Considera índices y constraints.
3. Genera migración up + down.
4. Verifica que la migración es reversible o documenta por qué no.

---
name: api-contract
description: Genera o actualiza el contrato OpenAPI/GraphQL de la API.
---

# /api-contract

## Protocolo

1. Pregunta qué endpoint/operación añadir o modificar.
2. Define: método, path, params, body, responses (todos los códigos), errores.
3. Actualiza `docs/api/openapi.yaml` o `docs/api/schema.graphql`.
4. Genera tipos de cliente.
5. No implementes el handler en este skill — solo el contrato.

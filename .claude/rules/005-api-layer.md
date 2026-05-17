---
name: api-layer-rules
paths: ["src/lib/api/**", "src/api/**"]
---

# Reglas para cliente de API

- **Tipado fuerte**. Si tienes OpenAPI, genera tipos desde el schema.
- **Sin `any`**. Si no sabes el tipo, modela el desconocido explícitamente (`unknown`).
- **Manejo de errores explícito**: distingue red, 4xx, 5xx, timeout.
- **Retries solo para errores transitorios** y solo para operaciones idempotentes.
- **Sin secretos** en este código (van por backend o variable de entorno cliente-safe).

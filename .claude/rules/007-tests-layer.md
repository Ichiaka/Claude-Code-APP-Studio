---
name: tests-layer-rules
paths: ["tests/**", "**/*.test.*", "**/*.spec.*"]
---

# Reglas para tests

- **Naming descriptivo**: `it("should X when Y", ...)`.
- **Sin `sleep(N)`**: espera condiciones, no tiempos.
- **Page Object pattern** para e2e.
- **Fixtures isolated**: cada test crea y limpia sus datos.
- **No tests skipped** sin issue asociado. Skip permanente = borrar.

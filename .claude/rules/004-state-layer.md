---
name: state-layer-rules
paths: ["src/state/**", "src/store/**"]
---

# Reglas para estado

- **Selectores puros**. Sin side effects.
- **Reducers/actions puros**. Side effects en thunks/sagas/efectos dedicados.
- **Distingue UI state, server state, domain state**. No todo en el mismo store.
- **Server state**: usa una librería de cache (React Query, SWR, similar) en lugar de gestionarlo manualmente en el store global.

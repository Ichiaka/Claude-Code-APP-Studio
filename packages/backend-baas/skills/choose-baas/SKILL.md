---
name: choose-baas
description: Decide qué BaaS usar (Supabase, Firebase, Appwrite, Convex, etc.). Genera ADR.
---

# /choose-baas

## Protocolo

1. Pregunta:
   - ¿SQL o NoSQL preferido?
   - ¿Necesitas realtime?
   - ¿Self-hostable es importante?
   - ¿Hay restricciones legales (datos en EU, etc.)?
2. Presenta 2-3 opciones con pros/contras:
   - **Supabase** (Postgres, open source, realtime, self-hostable).
   - **Firebase** (NoSQL, maduro, ecosistema Google, mejor para móvil clásico).
   - **Appwrite** (open source, self-hostable, multi-DB).
   - **Convex** (TS-first, reactivo, propietario).
3. El arquitecto decide. Genera ADR-NNNN.

## Output

`docs/adr/NNNN-baas.md`.

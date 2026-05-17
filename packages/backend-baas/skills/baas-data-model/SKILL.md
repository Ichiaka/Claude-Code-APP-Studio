---
name: baas-data-model
description: Diseña el modelo de datos en el BaaS elegido, con security rules incluidas.
---

# /baas-data-model

## Protocolo

1. Lee `docs/adr/NNNN-baas.md` para saber qué BaaS hay.
2. Pide las entidades del dominio.
3. Para cada entidad:
   - Campos y tipos.
   - Relaciones.
   - Index necesarios.
   - **Security rules / RLS** explícitas (quién puede leer, quién escribir).
4. Genera SQL/JSON de migración aplicable.

## Anti-patrones

- Saltarse RLS porque "lo controla el cliente".
- Diseñar el modelo sin pensar en las queries que harás.

---
name: event-plan
description: Diseña el plan de eventos analytics: qué eventos, propiedades, para qué decisiones.
---

# /event-plan

## Protocolo

1. Por cada flujo crítico, define eventos:
   - **start**, **complete**, **abandon**, **error**.
2. Para cada evento, define propiedades (qué contexto se captura).
3. **Para cada evento, escribe la pregunta que ayudará a responder.** Si no hay pregunta, no hay evento.
4. Output: `docs/analytics/events.md`.

## Heurística

Un evento sin pregunta asociada es ruido.

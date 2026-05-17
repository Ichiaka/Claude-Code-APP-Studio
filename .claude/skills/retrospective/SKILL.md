---
name: retrospective
description: Retrospectiva al cerrar un sprint — qué se entregó, qué fue bien, qué no, y qué cambiar de forma concreta. Cierra cada ciclo de la fase de construcción.
---

# /retrospective

**Fase del workflow:** Building (paso 11, cierra el ciclo de sprint).
**Agente que lo lleva:** `delivery-manager`.

Cierras un sprint con una mirada honesta a cómo fue, y sales con cambios
concretos para el siguiente. Una retrospectiva sin acciones accionables es solo
desahogo.

## Estructura

1. **Lo entregado frente a lo planeado.** Compara el objetivo del sprint
   (`production/sprints/sprint-NN.md`) con lo que de verdad se completó. Sin
   adornos: qué se cumplió y qué no.

2. **Lo que fue bien.** Qué funcionó y conviene mantener. Reconocer lo que salió
   bien importa — un arquitecto en solitario no tiene quien se lo reconozca.

3. **Lo que no fue bien.** Qué frenó, qué se subestimó, qué se repitió de sprints
   anteriores.

4. **Cambios concretos para el próximo sprint.** Máximo 2-3, y todos accionables:
   algo que se pueda *hacer*, no una buena intención.

## Output

`production/sprints/sprint-NN-retro.md`.

## Siguiente paso

- Si quedan features del MVP por construir → el siguiente ciclo empieza con
  `/sprint-plan`, aplicando los cambios que salieron de esta retrospectiva.
- Si el MVP está completo → el proyecto pasa a la fase de **release**: empieza
  por `/security-review` y luego `/release-checklist`.

## Heurística

- "Comunicar mejor" no es accionable. "Hacer 15 minutos de planificación al
  inicio de cada día" sí lo es. Un cambio que no se puede ejecutar no es un
  cambio.
- Más de 2-3 cambios por retrospectiva es no cambiar ninguno: no se sostienen.

## Anti-patrones

- Una retrospectiva que solo lista quejas sin convertirlas en acciones.
- Cambios vagos imposibles de ejecutar o de verificar.
- Saltarse el reconocimiento de lo que fue bien.

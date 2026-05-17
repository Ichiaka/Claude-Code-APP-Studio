---
name: sprint-plan
description: Planifica un sprint — objetivo, trabajo seleccionado, capacidad realista con buffer, riesgos. Abre cada ciclo de la fase de construcción.
---

# /sprint-plan

**Fase del workflow:** Building (paso 6, abre el ciclo de sprint).
**Agente que lo lleva:** `delivery-manager`.

Planificas un sprint: defines su objetivo y seleccionas el trabajo que cabe de
verdad. Un sprint bien planificado tiene un foco claro y un alcance honesto.

## Inputs necesarios

- La duración del sprint (típicamente 1-2 semanas).
- La capacidad real disponible: cuántos días de trabajo efectivos, descontando
  interrupciones previsibles.
- El backlog priorizado (lo prioriza `product-director`).

## Protocolo

1. **Define el objetivo del sprint primero**, antes de mirar tareas. Un objetivo
   es un resultado observable en una frase ("un usuario nuevo puede registrarse y
   completar el onboarding sin ayuda"), no una lista de tareas.

2. **Calcula la capacidad real** y **resta un 20% de buffer.** El buffer no es
   opcional: es la provisión para lo imprevisto. Un sprint planificado al 100% ya
   está fallando el primer día.

3. **Selecciona trabajo del backlog priorizado** hasta llenar el 80% restante.

4. **Verifica que cada ítem tiene criterios de aceptación** y una estimación de
   talla (XS/S/M/L/XL). Si algo es L o XL, descomponlo hasta que las piezas sean
   S o M. Si un ítem no tiene criterios de aceptación, no entra: vuelve a
   `product-director`.

5. **Identifica los riesgos y las dependencias** del sprint.

## Output

`production/sprints/sprint-NN.md` con: el objetivo, las features incluidas con
sus criterios de aceptación, los riesgos identificados, y el buffer del 20%
explícito.

## Siguiente paso

Con el sprint planificado, empieza la construcción. Por cada feature del sprint:
`/scaffold-feature` para crear el esqueleto, luego la implementación, y
`/code-review` al terminarla. Si entra trabajo nuevo a mitad de sprint, pásalo
por `/scope-check`. Al cerrar el sprint, `/retrospective`.

## Anti-patrones

- Un objetivo de sprint que es una lista de tareas en vez de un resultado.
- Planificar al 100% de la capacidad, sin buffer.
- Meter en el sprint ítems sin criterios de aceptación o sin estimar.
- Dejar un L o XL sin descomponer: casi siempre esconde más trabajo del que
  aparenta.

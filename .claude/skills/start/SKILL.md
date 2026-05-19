---
name: start
description: Punto de entrada al estudio. Te ayuda a elegir entre el modo prototipo (rápido) y el modo completo, y te sitúa en el paso correcto. No asume nada.
---

# /start

Eres el punto de entrada del estudio. Tu trabajo es **no asumir nada**: ayudar al
arquitecto a elegir el modo de trabajo y situarlo en el paso correcto. Nunca
generas código ni tomas decisiones aquí — solo orientas.

El estudio tiene dos modos de trabajo. El mapa completo está en
`docs/workflow.md`; tú eres la puerta de entrada.

## Los dos modos

- **Modo prototipo** (rápido) — el primer entregable es una app que funciona, y
  se itera sobre ella. Sin fases ni ceremonia. Ideal para prototipos, pruebas de
  concepto y apps pequeñas, o cuando quieres ver algo funcionando cuanto antes.

- **Modo completo** — el workflow de cinco fases (discovery → design → building →
  release → maintenance). Diseña antes de construir. Ideal para proyectos que
  sabes grandes o complejos desde el inicio, o que tendrán recorrido largo.

Un prototipo puede pasar al modo completo en cualquier momento con `/consolidate`.

## Protocolo

1. Saluda brevemente.

2. **Pregunta si es un proyecto nuevo o uno existente:**

   > ¿Empezamos un proyecto nuevo, o ya hay trabajo hecho?

3. **Si es un proyecto existente**, diagnostica antes de orientar:
   - ¿Hay `production/prototype.md`? → es un proyecto en modo prototipo. Para
     seguir iterando, continúa con `/prototype`; si va en serio, sugiere
     `/consolidate`.
   - ¿Hay `docs/adr/0001-stack.md` y `docs/features/`? → es un proyecto en modo
     completo. Lee `production/session-state/current.md` y mira si hay un sprint
     activo en `production/sprints/`. Pregunta qué quiere hacer hoy.
   - Si no está claro, pregunta.

4. **Si es un proyecto nuevo**, ayuda a elegir modo:

   > ¿Cómo quieres trabajar este proyecto?
   >
   > **A.** Rápido: quiero ver la app funcionando cuanto antes e ir iterando.
   > **B.** Con proceso: es un proyecto serio, prefiero diseñar bien antes de
   >        construir.
   > **C.** No estoy seguro.

   - **A** → modo prototipo. Deriva a `/prototype`.
   - **B** → modo completo. Empieza por `/brainstorm-app` si la idea aún es
     difusa, o por `/define-mvp` si ya tiene el concepto.
   - **C** → ayúdale a decidir con dos o tres preguntas: ¿el proyecto es un
     experimento o un producto con recorrido? ¿es pequeño o sabes que será
     grande? ¿quieres validar rápido una idea, o construir algo para durar?
     Recomienda en consecuencia — prototipo para validar y para apps pequeñas,
     completo para productos serios y complejos — pero la decisión es suya.

5. Si nada encaja con claridad, sigue preguntando. **Nunca** generes código ni
   archivos desde `/start`.

## Siguiente paso

`/start` siempre desemboca en un modo y un skill. Deja claro al arquitecto cuál
es y por qué. Para ver los dos modos en detalle, remítelo a `docs/workflow.md`.

## Anti-patrones

- Asumir el modo sin preguntar.
- Empujar siempre al modo completo "porque es más riguroso": para muchos
  proyectos, el prototipo es la elección correcta.
- Empujar siempre al prototipo "porque es más rápido": un proyecto grande sin
  diseño previo acumula deuda cara.
- Empezar a generar archivos sin saber qué app es ni en qué modo.

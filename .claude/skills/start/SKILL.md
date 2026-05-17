---
name: start
description: Punto de entrada al estudio. Detecta en qué fase del workflow estás (idea vaga, concepto claro, código existente) y te guía al skill adecuado. No asume nada.
---

# /start

Eres el punto de entrada del estudio. Tu trabajo es **no asumir nada**: situar al
arquitecto en el workflow de producción y mandarlo al skill correcto. Nunca
generas código ni tomas decisiones aquí — solo orientas.

El workflow completo está en `docs/workflow.md`; tú eres la puerta de entrada a
ese mapa.

## Protocolo

1. Saluda brevemente.

2. Pregunta dónde está el arquitecto:

   > ¿Dónde estás ahora mismo con este proyecto?
   >
   > **A.** No tengo idea todavía, solo quiero explorar.
   > **B.** Tengo un concepto vago: sé qué problema quiero resolver, nada más.
   > **C.** Tengo el concepto claro, me falta el diseño y la arquitectura.
   > **D.** Ya hay código y diseño; quiero continuar, arreglar o añadir features.

3. Según la respuesta, sitúalo en su fase y mándalo al primer skill:
   - **A** → fase DISCOVERY. Empieza por `/brainstorm-app`.
   - **B** → fase DISCOVERY, casi en DESIGN. Empieza por `/define-mvp` para
     recortar el alcance, y después `/choose-stack`.
   - **C** → fase DESIGN. Empieza por `/choose-stack`, y luego `/architect-feature`
     por cada feature grande.
   - **D** → fase BUILDING o MAINTENANCE. Diagnostica primero el estado del
     proyecto:
     - Lee `docs/adr/0001-stack.md` si existe (sabrás qué stack hay).
     - Lee `production/session-state/current.md` (estado de la última sesión).
     - Revisa `design/` y `docs/features/` para ver qué está diseñado.
     - Mira si hay un sprint activo en `production/sprints/`.
     - Pregunta entonces qué quiere hacer hoy.

4. Si nada encaja con claridad, sigue preguntando. **Nunca** generes código ni
   archivos desde `/start`.

## Siguiente paso

`/start` siempre desemboca en otro skill. Deja claro al arquitecto cuál es ese
siguiente skill y por qué. Si quiere ver el flujo completo de principio a fin,
remítelo a `docs/workflow.md`.

## Anti-patrones

- Asumir el stack "porque es lo más popular".
- Empezar a generar archivos sin saber qué app es.
- Saltarte el diagnóstico inicial en el caso D.
- Tratar de resolver el proyecto desde `/start` en vez de derivar al skill que
  toca.

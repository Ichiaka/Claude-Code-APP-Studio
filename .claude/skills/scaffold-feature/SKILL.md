---
name: scaffold-feature
description: Genera la estructura inicial de archivos de una feature ya diseñada — stubs y TODOs, no implementación. Primer paso de construcción de cada feature dentro de un sprint.
---

# /scaffold-feature

**Fase del workflow:** Building (paso 7, dentro de un sprint).
**Agente que lo lleva:** `frontend-lead`.

Generas el esqueleto de archivos de una feature: la estructura sobre la que
después los specialists escribirán la implementación. Stubs y TODOs, no lógica
todavía.

## Requisito previo

La feature debe estar diseñada: `docs/features/<nombre>.md` debe existir. Si no,
ejecuta antes `/architect-feature`.

## Protocolo

1. **Lee el documento de diseño** de la feature en `docs/features/<nombre>.md`.

2. **Verifica el stack** en `docs/adr/0001-stack.md`, para usar las convenciones
   correctas. Si el proyecto tiene convenciones de estructura documentadas,
   respétalas; no las inventes.

3. **Propón el árbol de archivos a crear:** cada ruta con el propósito de ese
   archivo. Espera la aprobación del arquitecto antes de crear nada.

4. **Crea solo los archivos aprobados**, con:
   - Stubs (firmas, estructura) y TODOs claros que marquen qué falta implementar.
   - Nada de lógica real — eso es el paso siguiente.

5. **Crea también los archivos de test**, vacíos pero con la estructura de los
   casos (los `describe`/`it` o equivalente) que el plan de tests del diseño
   contempla.

6. **Reporta lo creado** y cuál es el siguiente paso.

## Siguiente paso

Con el esqueleto creado, empieza la **implementación**: los specialists
(`component-engineer` para la UI, `state-engineer` para el estado, y los de cada
área) rellenan los stubs con código real. No hay un skill único para implementar;
es el trabajo de construcción de la feature.

Cuando la feature esté implementada, revísala con `/code-review`.

## Anti-patrones

- Implementar lógica en este skill: scaffold es estructura, no implementación.
- Crear archivos que el arquitecto no ha aprobado.
- Asumir una convención de proyecto que no está documentada.

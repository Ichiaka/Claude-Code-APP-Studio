---
name: consolidate
description: Convierte un prototipo en una base sólida. Revisa la deuda acumulada, propone la estructura que falta y lleva el proyecto al estándar del modo completo. Se invoca cuando el arquitecto decide que el prototipo va en serio.
---

# /consolidate

**Modo del estudio:** puente entre Prototipo y Completo.
**Agente que lo orquesta:** `technical-director`, con `delivery-manager`.

Eres el paso que convierte un prototipo en una base sólida sobre la que seguir
construyendo en serio. El modo prototipo es rápido porque omite el diseño previo;
ese atajo deja deuda. `/consolidate` es donde esa deuda se paga, de forma
ordenada y **cuando el arquitecto lo decide** — nunca automáticamente.

No es un castigo ni un "lo hiciste mal": es una transición prevista. Prototipar
primero y consolidar después es una forma legítima y eficiente de trabajar.

## Cuándo se usa

El arquitecto invoca `/consolidate` cuando decide que el prototipo deja de ser un
experimento y pasa a ser un producto que va a crecer y a mantenerse. Señales
típicas de que ese momento llegó:
- Cada cambio nuevo cuesta más que el anterior.
- Aparecen bugs repetidos en las mismas zonas.
- El prototipo va a tener usuarios reales, no solo ser una demo.
- Se va a sumar trabajo de más gente o de más tiempo.

El estudio puede mencionar que ve estas señales, pero **no fuerza** la
consolidación: la decisión es del arquitecto.

## Workflow

### Paso 1 — Auditoría del prototipo

`technical-director` revisa el prototipo y produce un diagnóstico honesto de su
deuda, mirando:
- **Estructura**: ¿el código tiene capas claras, o todo está mezclado?
- **Estado**: ¿UI, server y domain state están separados, o hay un cajón único?
- **Contratos**: ¿los límites entre módulos están definidos?
- **Tests**: ¿hay cobertura, o el prototipo no tiene red?
- **Decisiones sin registrar**: ¿qué se decidió deprisa y nadie documentó?
- **Seguridad y accesibilidad**: lo que el modo prototipo dejó pendiente.

El resultado es una lista priorizada de deuda, de lo más urgente a lo más
cosmético.

### Paso 2 — Plan de consolidación

`technical-director` y `delivery-manager` proponen al arquitecto un plan: qué se
arregla, en qué orden, y con qué esfuerzo. El plan distingue:
- **Lo que hay que arreglar ya** — deuda que de verdad frena o pone en riesgo.
- **Lo que puede esperar** — deuda real pero no urgente.
- **Lo que se acepta** — deuda menor que no compensa arreglar.

El arquitecto decide el alcance. No hace falta consolidarlo todo de golpe.

### Paso 3 — Generar lo que el modo completo da por hecho

Consolidar incluye crear los artefactos que el modo prototipo se saltó:
- `docs/adr/0001-stack.md` — registrar la decisión de stack que se tomó deprisa.
- `docs/adr/` — un ADR por cada decisión estructural relevante que estaba sin
  registrar.
- `docs/features/<nombre>.md` — documentar las features que ya existen, para que
  tengan un diseño escrito de referencia.
- Tests donde falten, empezando por los flujos críticos.

### Paso 4 — Ejecutar

El trabajo de consolidación se organiza ya con el modo completo: entra en sprints
(`/sprint-plan`), pasa por revisión (`/code-review`), etc. A partir de aquí, el
proyecto vive en el modo completo.

## Output

- `docs/consolidation-report.md` — la auditoría y el plan.
- Los ADRs y documentos de feature generados.
- El proyecto, listo para continuar en modo completo.

## Siguiente paso

Tras consolidar, el proyecto está en el modo completo. El trabajo continúa con
`/sprint-plan` para el siguiente ciclo, y todo el workflow descrito en
`docs/workflow.md` aplica con normalidad.

## Anti-patrones

- Tratar `/consolidate` como una reescritura total: es pagar la deuda que estorba,
  no rehacer lo que funciona.
- Consolidar un prototipo que todavía es un experimento: si aún estás validando
  si la idea sirve, sigue en modo prototipo.
- Forzar la consolidación porque "toca": se consolida cuando el proyecto lo pide,
  y esa lectura la hace el arquitecto.

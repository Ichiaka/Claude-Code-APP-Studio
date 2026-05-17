---
name: perf-audit
description: Audita el rendimiento — bundle, render, red, memoria. Mide un baseline antes de proponer nada. Sin medición no hay auditoría.
---

# /perf-audit

**Fase del workflow:** Building y Maintenance (verificación de calidad).
**Agente que lo lleva:** `perf-engineer`.

Auditas el rendimiento de la app midiendo, no intuyendo. La mayoría de los
problemas de rendimiento que se "saben" no existen, y los que existen suelen
estar donde nadie miraba.

## Protocolo

1. **Determina el alcance:** qué se audita (la carga inicial, una pantalla, una
   interacción), en qué plataforma, sobre un build de producción.

2. **Mide el baseline y anótalo.** Sin una medición de partida no hay auditoría,
   hay opiniones. Usa las herramientas adecuadas: Lighthouse y Web Vitals para la
   web, un analizador de bundle para el peso, los profilers de render y de
   memoria. Mide en condiciones realistas — CPU y red estranguladas a las de un
   dispositivo real, no a las de la máquina de desarrollo.

3. **Identifica los 3-5 cuellos de botella reales**, ordenados por impacto, con
   la evidencia de la medición.

4. **Propón las optimizaciones priorizadas** por ratio impacto/coste. Aplica una
   cada vez y vuelve a medir.

## Output

`docs/perf/audit-<fecha>.md` con el baseline, los hallazgos y las propuestas
priorizadas. Incluye también lo que se probó y no funcionó.

## Siguiente paso

- Las optimizaciones aprobadas se implementan y se vuelve a medir.
- El resultado alimenta el `/release-checklist` (sin regresiones de rendimiento).
- En mantenimiento, repite `/perf-audit` periódicamente para que la calidad no se
  erosione.

## Heurística

- Sin baseline no hay auditoría: es opinión. La medición es el primer paso, no
  uno opcional.
- Optimizar sin medir añade complejidad real a cambio de una mejora imaginaria.

## Anti-patrones

- Proponer optimizaciones sin haber medido.
- Medir en la máquina de desarrollo (CPU rápida, red buena) en vez de en
  condiciones de usuario real.
- Aplicar varias optimizaciones a la vez sin poder saber cuál ayudó.

---
name: a11y-audit
description: Audita la accesibilidad de la app o de una pantalla concreta. WCAG 2.2 AA como mínimo. Combina herramientas automáticas con pruebas reales de teclado y lector de pantalla.
---

# /a11y-audit

**Fase del workflow:** Building y Maintenance (verificación de calidad).
**Agente que lo lleva:** `a11y-auditor`.

Auditas la accesibilidad para garantizar que la app es usable por todas las
personas — incluidas las que navegan con teclado, con lector de pantalla, las
que no distinguen ciertos colores o necesitan texto grande.

## Protocolo

1. **Determina el alcance:** toda la app, una pantalla, un flujo concreto.

2. **Fase automática.** Pasa axe-core y la auditoría de accesibilidad de
   Lighthouse. Detecta lo evidente (contraste, etiquetas, ARIA mal formado), que
   es aproximadamente un tercio de los problemas reales.

3. **Fase de teclado.** Recorre el flujo usando solo el teclado: que se llega a
   todo, que el foco es visible, que el orden es lógico, que no hay trampas de
   foco.

4. **Fase de lector de pantalla.** Recorre el flujo con un lector real
   (VoiceOver, NVDA, TalkBack): que lo que se anuncia tiene sentido sin ver la
   pantalla.

5. **Reporta por severidad** (bloqueante / importante / menor), cada hallazgo con
   el criterio WCAG que incumple y una corrección concreta.

## Output

`design/reviews/a11y-<fecha>.md` con hallazgos, criterios WCAG y correcciones
propuestas.

## Siguiente paso

- Hallazgos bloqueantes → se corrigen antes de seguir; en fase de release,
  bloquean el release.
- El resultado alimenta el `/release-checklist` (sin regresiones de
  accesibilidad es uno de sus checks).

## Heurística

- Las herramientas automáticas detectan solo una fracción de los problemas. Una
  auditoría que es solo automática no es una auditoría.
- Si no puedes completar el flujo con el teclado, no es accesible. Es un punto de
  partida, no un detalle final.

## Anti-patrones

- Quedarse solo en axe-core/Lighthouse y saltarse las fases manuales.
- Reportar hallazgos sin el criterio WCAG ni una corrección concreta.

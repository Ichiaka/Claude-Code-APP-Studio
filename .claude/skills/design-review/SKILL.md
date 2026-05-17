---
name: design-review
description: Revisa una pieza de diseño (flujo, pantalla, design system) buscando incoherencias, estados sin cubrir y problemas de UX y accesibilidad.
---

# /design-review

**Fase del workflow:** Design y Building (cuando hay diseño que revisar).
**Agente que lo lleva:** `ux-lead`, con apoyo de `a11y-auditor`.

Revisas una pieza de diseño —un flujo, una pantalla, una parte del design
system— antes de que se construya o se dé por buena. El objetivo es detectar lo
que falla cuando el diseño se enfrenta a la realidad: contenido inesperado,
errores, usuarios que no usan ratón ni vista.

## Protocolo

1. **Determina qué se revisa:** un flujo completo, una pantalla concreta, un
   componente del design system.

2. **Recorre la pieza como el usuario arquetipo**, y pásala por estos checks:
   - ¿Están cubiertos todos los estados — vacío, cargando, error, éxito?
   - ¿Funciona usando solo el teclado? ¿Y con un lector de pantalla?
   - ¿El contraste es suficiente?
   - ¿Funciona con una sola mano en un móvil?
   - ¿Es coherente con el resto del design system, o inventa?
   - ¿Qué pasa si el contenido es muy largo, muy corto o no hay?
   - ¿Qué pasa en modo oscuro?
   - ¿Qué pasa sin conexión?

3. **Delega la auditoría fina de accesibilidad** en `a11y-auditor` (o sugiere
   ejecutar `/a11y-audit` aparte para un análisis a fondo).

4. **Reporta los hallazgos priorizados:** bloqueante / importante / sugerencia.

## Output

`design/reviews/<fecha>-<pieza>.md` con el reporte priorizado.

## Siguiente paso

- Si hay hallazgos bloqueantes → se corrige el diseño y se vuelve a revisar.
- Si la pieza pasa → puede construirse (`/scaffold-feature` si es una feature) o
  darse por buena.
- Para una auditoría de accesibilidad a fondo → `/a11y-audit`.

## Anti-patrones

- Revisar solo el estado "con datos" e ignorar vacío, error y carga.
- Aprobar un diseño que no funciona con teclado: eso es un bloqueante, no un
  detalle para después.
- Pasar por alto que la pieza inventa componentes en lugar de usar el design
  system.

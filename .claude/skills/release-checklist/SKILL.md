---
name: release-checklist
description: El checklist completo antes de publicar una versión. Verifica calidad, seguridad, versionado y artefactos. Si algo crítico falla, bloquea el release.
---

# /release-checklist

**Fase del workflow:** Release (paso 13).
**Agente que lo lleva:** `qa-lead`.

Verificas que todo está en orden antes de publicar una versión. Si algún punto
crítico falla, **bloqueas** el release hasta que se resuelva — no hay "lo
arreglamos después de publicar" para un check crítico.

## Checklist general

- [ ] El registro de cambios (`CHANGELOG.md`) está actualizado: la sección "sin
      liberar" se ha convertido en la versión que se publica.
- [ ] La versión está incrementada y **sincronizada en todos los manifiestos**
      (package.json, configuración de Capacitor/Tauri, manifiestos de móvil).
- [ ] Todos los tests pasan: unitarios, de integración y e2e.
- [ ] Lint y typecheck sin errores.
- [ ] `/security-review` pasada sin hallazgos bloqueantes.
- [ ] `/a11y-audit` pasada sin regresiones de accesibilidad.
- [ ] `/perf-audit` con resultado aceptable, sin regresiones.
- [ ] Smoke test manual de los flujos principales de la app.
- [ ] Plan de rollback documentado: cómo se vuelve atrás y en cuánto tiempo.
- [ ] Artefactos de build generados y firmados.

## Checks por plataforma

### Web
- [ ] El tamaño del bundle está dentro del presupuesto.
- [ ] Lighthouse: Performance ≥ 90, Accessibility ≥ 95.
- [ ] Sitemap, robots.txt y etiquetas Open Graph al día.

### Móvil
- [ ] Privacy nutrition labels actualizadas (iOS).
- [ ] Formulario de Data Safety al día (Android).
- [ ] Capturas de pantalla en todos los tamaños de dispositivo requeridos.
- [ ] Texto de las notas de versión en cada idioma soportado.

### Desktop
- [ ] Firma de código verificada en Windows, macOS y Linux.
- [ ] Build de macOS notarizado.
- [ ] El auto-update apunta a la versión correcta.

## Output

El resultado del checklist. Si algo crítico falla, el release queda **bloqueado**
y se comunica a `delivery-manager` con la lista concreta de lo que falta.

## Siguiente paso

- Si el checklist se pasa entero → continúa con `/changelog` (si no estaba ya
  hecho) y la publicación, que lleva `release-engineer`.
- Si algo falla → se corrige y se vuelve a pasar el checklist.

## Anti-patrones

- Saltarse un check crítico "porque hay prisa".
- Dar por bueno el release con tests en rojo o una regresión de accesibilidad.
- Publicar sin un plan de rollback escrito.

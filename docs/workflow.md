# El workflow de producción

Esta es la guía de principio a fin para llevar una app desde una idea hasta una
versión publicada y mantenida, usando el estudio. No es teoría: es la secuencia
concreta de pasos, qué skill ejecutar en cada uno, qué agente lo lleva y qué
archivo produce.

Si no sabes por dónde empezar, ejecuta **`/start`** y te situará. Si quieres ver
el mapa completo, sigue leyendo.

---

## Visión general: las cinco fases

El desarrollo de una app atraviesa cinco fases. El estudio detecta en cuál estás
(lo verás en la statusline como `stage:NOMBRE`) y te orienta en consecuencia.

```
  DISCOVERY  →  DESIGN  →  BUILDING  →  RELEASE  →  MAINTENANCE
   (idea)      (plano)    (construir)  (publicar)   (mantener)
                                ↑__________________________|
                                   (cada ciclo vuelve aquí)
```

Las tres primeras fases se recorren una vez al arrancar el proyecto. Las dos
últimas —y la vuelta a building— se repiten en cada ciclo de mejora.

---

## Fase 1 — DISCOVERY: de la idea al concepto

**Objetivo:** salir con un concepto claro: qué app, para quién, para resolver qué.

**Pasos:**

1. **Explora ideas** (si aún no tienes una clara) → `/brainstorm-app`
   Genera y critica conceptos. Produce un concepto con su usuario arquetipo y su
   problema. Lo lleva `product-director`.

2. **Recorta al mínimo viable** → `/define-mvp`
   Separa lo imprescindible de lo que puede esperar. Produce `design/mvp.md` con
   tres listas (MVP / v1 / más adelante) y **una métrica de éxito**. Lo lleva
   `product-director`.

**Sales de esta fase cuando:** tienes `design/mvp.md` y puedes decir en una frase
qué hace la app, para quién y cómo sabrás si funciona.

---

## Fase 2 — DESIGN: del concepto al plano

**Objetivo:** decidir con qué se construye y cómo será cada feature, antes de
escribir código.

**Pasos:**

3. **Decide la tecnología** → `/choose-stack`
   Elige el stack según los targets (web, móvil, desktop) y las restricciones.
   Produce `docs/adr/0001-stack.md`. Lo lleva `technical-director`.
   *Este paso es obligatorio: nada se construye sin stack decidido.*

4. **Activa los paquetes que necesites** → `/package-add`
   Si la app necesita backend, pagos, push, multi-idioma o analítica, actívalo
   ahora. Para el backend, decide entre `backend-baas` y `backend-custom`.

5. **Diseña cada feature grande** → `/architect-feature` (una vez por feature)
   Para cada feature del MVP, diseña su arquitectura: capas, contrato de datos,
   estados, plan de tests. Produce `docs/features/<nombre>.md`. Lo lleva el
   agente `architect`.
   *No se escribe código en esta fase. Es solo diseño.*

   En paralelo, el diseño de UX y visual de cada feature lo trabajan `ux-lead`
   e `ui-designer`; puedes revisarlo con `/design-review`.

**Sales de esta fase cuando:** existe `docs/adr/0001-stack.md` y cada feature del
MVP tiene su documento de diseño en `docs/features/`.

---

## Fase 3 — BUILDING: construir el MVP

**Objetivo:** convertir los diseños en una app que funciona. Esta fase es
iterativa: se trabaja por sprints.

**El ciclo de cada sprint:**

6. **Planifica el sprint** → `/sprint-plan`
   Define el objetivo del sprint y selecciona el trabajo que cabe de verdad
   (capacidad real menos un 20% de buffer). Produce
   `production/sprints/sprint-NN.md`. Lo lleva `delivery-manager`.

7. **Crea el esqueleto de cada feature** → `/scaffold-feature`
   A partir del documento de diseño, genera la estructura de archivos (stubs, no
   implementación todavía). Lo lleva `frontend-lead`.

8. **Implementa.** Aquí trabajan los specialists: `component-engineer` (UI),
   `state-engineer` (estado), y los de cada área. No hay un skill único para
   esto: es el trabajo de construcción, feature a feature.

9. **Revisa lo construido** → `/code-review`
   Revisa el código de una feature terminada antes de darla por buena. Lo lleva
   `qa-lead` con los specialists.

10. **Si entra trabajo nuevo a mitad de sprint** → `/scope-check`
    Antes de aceptar cualquier añadido, comprueba el coste y qué desplaza. Lo
    lleva `delivery-manager`.

11. **Cierra el sprint** → `/retrospective`
    Qué se entregó, qué fue bien, qué cambiar. Produce
    `production/sprints/sprint-NN-retro.md`.

**Repite los pasos 6-11 por cada sprint** hasta tener el MVP completo.

Durante esta fase, según lo que construyas, usa también:
- `/a11y-audit` — verifica la accesibilidad de una pantalla o flujo.
- `/perf-audit` — mide y mejora el rendimiento.
- `/pwa-checklist` — si la app es una PWA, verifica que es instalable y funciona
  offline.
- `/bug-report` — documenta cualquier bug que encuentres de forma reproducible.
- `/adr-new` — registra cualquier decisión técnica importante que tomes.

**Sales de esta fase cuando:** el MVP está construido y todas sus features pasan
sus criterios de aceptación.

---

## Fase 4 — RELEASE: publicar

**Objetivo:** llevar la app a los usuarios de forma segura y reversible.

**Pasos:**

12. **Revisa la seguridad** → `/security-review`
    Antes de publicar, una pasada de seguridad y privacidad. Lo lleva
    `security-privacy-lead`.

13. **Pasa el checklist de release** → `/release-checklist`
    La verificación completa antes de publicar. Si algo crítico falla, **bloquea**
    el release hasta que se resuelva. Lo lleva `qa-lead`.

14. **Escribe el registro de cambios** → `/changelog`
    Documenta qué cambia esta versión, en lenguaje de usuario. Lo lleva
    `release-engineer`.

15. **Publica.** `release-engineer` versiona, genera los artefactos firmados y
    completa la publicación; en móvil, `ios-release-specialist` y
    `android-release-specialist` llevan cada tienda.

**Sales de esta fase cuando:** la versión está publicada y verificada.

---

## Fase 5 — MAINTENANCE: mantener y mejorar

**Objetivo:** mantener la app sana y hacerla crecer.

En mantenimiento, el trabajo es:
- **Corregir bugs** — documéntalos con `/bug-report`, y tras un incidente serio
  escribe un postmortem en `docs/postmortems/`.
- **Mejorar y añadir features** — cada mejora vuelve a la fase de building: se
  diseña (`/architect-feature`), se planifica en un sprint (`/sprint-plan`) y se
  construye. Toda feature nueva pasa por `/scope-check`.
- **Vigilar la salud** — `/perf-audit` y `/a11y-audit` periódicos evitan que la
  calidad se erosione.

Cada mejora significativa termina en un nuevo ciclo de RELEASE (fase 4).

---

## Resumen: el flujo en una tabla

| Fase | Skill | Produce |
|---|---|---|
| Discovery | `/brainstorm-app` | un concepto |
| Discovery | `/define-mvp` | `design/mvp.md` |
| Design | `/choose-stack` | `docs/adr/0001-stack.md` |
| Design | `/package-add` | paquetes activados |
| Design | `/architect-feature` | `docs/features/<nombre>.md` |
| Building | `/sprint-plan` | `production/sprints/sprint-NN.md` |
| Building | `/scaffold-feature` | esqueleto de archivos |
| Building | `/code-review` | revisión de código |
| Building | `/scope-check` | decisión sobre alcance |
| Building | `/retrospective` | `sprint-NN-retro.md` |
| Release | `/security-review` | `docs/security/review-<fecha>.md` |
| Release | `/release-checklist` | verificación (bloquea si falla) |
| Release | `/changelog` | `CHANGELOG.md` actualizado |
| Cualquiera | `/a11y-audit`, `/perf-audit`, `/design-review` | informes de calidad |
| Cualquiera | `/bug-report` | `docs/bugs/<id>.md` |
| Cualquiera | `/adr-new` | `docs/adr/NNNN-*.md` |

---

## Principio que atraviesa todo el workflow

En cada fase y cada skill, el protocolo es el mismo: **los agentes proponen, el
arquitecto decide.** Ningún skill genera código o toma decisiones importantes sin
mostrarte antes las opciones y esperar tu aprobación. El workflow te guía; no te
sustituye.

# El workflow de producción

El estudio tiene **dos modos de trabajo**. No hay un único camino: eliges el que
encaja con tu proyecto, y puedes pasar de uno a otro.

Si no sabes por dónde empezar, ejecuta **`/start`** y te ayuda a elegir.

---

## Los dos modos de un vistazo

| | **Modo prototipo** | **Modo completo** |
|---|---|---|
| Primer entregable | Una app que funciona | Un plan de diseño |
| Cómo avanza | Bucle: mirar → pedir cambio → repetir | Cinco fases ordenadas |
| Ceremonia | Mínima | Sprints, gates, documentos |
| Ideal para | Prototipos, apps pequeñas, validar rápido | Productos serios, apps grandes o complejas |
| Velocidad | Alta | Media, pero más segura a largo plazo |
| Deuda | Asume deuda, se paga con `/consolidate` | Baja desde el principio |

Un prototipo puede convertirse en un proyecto de modo completo cuando quieras,
con `/consolidate`. No es una decisión irreversible.

---

# Modo prototipo — el camino rápido

**Para cuando quieres ver la app funcionando cuanto antes.**

El modo prototipo invierte el orden habitual: en vez de diseñar y luego
construir, construye primero algo que funciona y se itera sobre ello. El diseño
emerge de tocar la app, no de planificarla en abstracto.

## Cómo funciona

```
  /prototype
      │
      ▼
  definir la idea (rápido)  →  elegir stack (rápido)  →  primer prototipo
      │
      ▼
  ┌─────────────────────────────────────┐
  │  BUCLE:  miras → pides un cambio →   │
  │          se aplica → vuelves a mirar │
  └─────────────────────────────────────┘
      │
      ▼
  (cuando el prototipo va en serio)  →  /consolidate
```

## Los pasos

1. **`/prototype`** arranca el modo. `product-director` te hace unas pocas
   preguntas rápidas para entender la idea (no un proceso largo).
2. **`technical-director` recomienda un stack** y te lo pregunta — rápido, pero
   tú confirmas.
3. **Se construye un primer prototipo** que funciona, centrado en la acción
   principal de la app.
4. **Iteras**: miras lo que hay, pides el siguiente cambio, se aplica. Sin
   sprints, sin documentos por feature, sin gates formales.

Durante todo el bucle, `qa-lead`, `a11y-auditor` y `security-privacy-lead` siguen
vigilando como red de seguridad: no bloquean con procedimiento, pero **avisan**
si hay un problema serio.

## Cuando el prototipo crece

El modo prototipo es rápido porque omite el diseño previo, y eso deja deuda. Para
un prototipo o una app pequeña, es un buen trato. Cuando decidas que el proyecto
va en serio y quieres una base sólida, ejecuta **`/consolidate`**: audita la
deuda, propone la estructura que falta y lleva el proyecto al modo completo. Es
tu decisión, cuando tú lo veas — el estudio no te fuerza.

---

# Modo completo — el camino con proceso

**Para proyectos que sabes serios, grandes o complejos desde el inicio.**

El modo completo recorre cinco fases. Diseña antes de construir, lo que cuesta
algo más al principio pero evita reescrituras después.

## Las cinco fases

```
  DISCOVERY  →  DESIGN  →  BUILDING  →  RELEASE  →  MAINTENANCE
   (idea)      (plano)    (construir)  (publicar)   (mantener)
                                ↑__________________________|
                                   (cada ciclo vuelve aquí)
```

### Fase 1 — DISCOVERY: de la idea al concepto

| Skill | Produce |
|---|---|
| `/brainstorm-app` | un concepto con usuario y problema |
| `/define-mvp` | `design/mvp.md` con MVP/v1/después y métrica de éxito |

### Fase 2 — DESIGN: del concepto al plano

| Skill | Produce |
|---|---|
| `/choose-stack` | `docs/adr/0001-stack.md` |
| `/package-add` | paquetes opcionales activados |
| `/architect-feature` | `docs/features/<nombre>.md` (uno por feature) |

*No se escribe código en esta fase. Solo diseño.*

### Fase 3 — BUILDING: construir el MVP

Iterativa, por sprints. El ciclo de cada sprint:

| Skill | Para qué |
|---|---|
| `/sprint-plan` | planificar el objetivo y el trabajo del sprint |
| `/scaffold-feature` | crear el esqueleto de archivos de una feature |
| *(implementación)* | los specialists construyen |
| `/code-review` | revisar una feature terminada |
| `/scope-check` | si entra trabajo nuevo a mitad de sprint |
| `/retrospective` | cerrar el sprint |

Se repite por cada sprint hasta completar el MVP. Apoyo durante la fase:
`/a11y-audit`, `/perf-audit`, `/pwa-checklist`, `/bug-report`, `/adr-new`.

### Fase 4 — RELEASE: publicar

| Skill | Para qué |
|---|---|
| `/security-review` | revisión de seguridad y privacidad |
| `/release-checklist` | verificación completa; bloquea si algo crítico falla |
| `/changelog` | registro de cambios en lenguaje de usuario |

Luego `release-engineer` versiona, genera los artefactos y publica.

### Fase 5 — MAINTENANCE: mantener y mejorar

Corrección de bugs (`/bug-report`, postmortems) y nuevas mejoras, que vuelven a
la fase de building. Cada mejora pasa por `/scope-check`.

---

## Cómo elegir

- **Empieza en modo prototipo si:** quieres validar una idea, el proyecto es
  pequeño, o prefieres descubrir construyendo. Es la opción por defecto para la
  mayoría de proyectos pequeños y medianos.
- **Empieza en modo completo si:** el proyecto es grande o complejo desde el
  inicio, tendrá muchos usuarios, o sabes que tendrá un recorrido largo y quieres
  la base bien puesta desde el primer día.
- **¿Dudas?** Empieza en prototipo. Si crece, `/consolidate` lo lleva al modo
  completo sin perder lo hecho. Es más fácil subir de prototipo a completo que
  descubrir a mitad de camino que el proceso completo era innecesario.

---

## Principio común a los dos modos

En ambos modos, el protocolo es el mismo: **los agentes proponen, el arquitecto
decide.** Ningún modo genera decisiones importantes sin consultarte. La diferencia
entre prototipo y completo no es cuánto controlas — es cuánto procedimiento hay
alrededor de ese control.

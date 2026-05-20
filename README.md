# Claude Code App Studio

> Convierte una sesión de Claude Code en un estudio de desarrollo de apps multiplataforma.
> Agentes especializados, skills, hooks y reglas — todo coordinado, tú decides.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Built for Claude Code](https://img.shields.io/badge/Built%20for-Claude%20Code-CC785C)](https://docs.claude.com/en/docs/claude-code/overview)
[![Status](https://img.shields.io/badge/status-early%20release-orange)]()

---

## Qué es esto

Construir una app en solitario con IA es potente — pero una sesión de Claude Code,
por sí sola, no tiene estructura. Nadie te frena de cablear valores mágicos, saltarte
el diseño antes de codear, o tomar decisiones de stack sin documentarlas. No hay
revisión de UX, ni pase de QA, ni alguien preguntando *"¿esto encaja con la visión
del producto?"*.

**Claude Code App Studio** convierte la sesión en un estudio: directores que cuidan
la visión, leads que son dueños de su dominio, y especialistas que ejecutan. Cada
agente tiene responsabilidades claras, rutas de escalado y gates de calidad. Tú
sigues tomando todas las decisiones, pero ahora tienes un equipo que pregunta lo
correcto, detecta errores pronto y mantiene el proyecto ordenado desde el primer
brainstorm hasta el release.

## Para qué tipo de proyecto

Para apps multiplataforma: **web (PWA), móvil (iOS/Android), desktop (Windows/macOS/Linux)**,
o cualquier combinación. Pensado para **un arquitecto humano en solitario** dirigiendo
agentes; no para pair programming clásico.

---

## Cómo funciona

```
┌─────────────────────── arquitecto humano ───────────────────────┐
│                                                                 │
│   Tier 1: Directores      ←  visión, prioridades, arquitectura  │
│   ↓                                                             │
│   Tier 2: Leads           ←  dueños de área                     │
│   ↓                                                             │
│   Tier 3: Especialistas   ←  ejecución hands-on                 │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

- **Vertical**: directores delegan en leads, leads en especialistas.
- **Horizontal**: agentes del mismo tier se consultan, pero no deciden por el otro.
- **Conflictos**: escalan al padre común.
- **Cross-departamento**: lo coordina `delivery-manager`.

### Protocolo de colaboración (no-negociable)

Cada acción significativa sigue: **Pregunta → Opciones → Decisión → Borrador → Aprobación**.
Los agentes nunca escriben archivos relevantes sin tu OK explícito. No es
auto-piloto: es un equipo a tus órdenes.

---

## Stack-agnóstico y modular

El template **no impone tecnología**. El skill `/choose-stack` te ayuda a decidir
al arrancar (PWA+Capacitor+Tauri, React Native, Flutter, nativo...) y deja la
decisión registrada en un ADR.

El núcleo cubre cliente, calidad, releases y diseño. El resto vive en `packages/`
y se activa cuando lo necesitas:

| Paquete           | Cuándo activarlo                                          |
| ----------------- | --------------------------------------------------------- |
| `backend-baas`    | Backend con poca lógica custom (Supabase, Firebase, etc.) |
| `backend-custom`  | Backend propio (Node, Python, Go, Rust...)                |
| `payments`        | Stripe, IAP de stores, suscripciones                      |
| `push`            | Notificaciones push (FCM, APNs)                           |
| `i18n`            | Multi-idioma                                              |
| `analytics`       | Telemetría y métricas de producto                         |

---

## Multiplataforma desde el día 1

Aunque tu MVP entregue solo un target, las decisiones se toman pensando en web +
móvil + desktop:

- **Lógica de negocio agnóstica** a la plataforma.
- **APIs de plataforma abstraídas** (storage, push, file system, cámara).
- **Offline-first** por defecto, salvo decisión explícita en contra.
- **WCAG 2.2 AA mínimo** desde el primer componente.

---

## Instalación y primer comando

```bash
# Obtén el template en la carpeta de tu proyecto. Por ejemplo:
git clone https://github.com/Ichiaka/claude-code-app-studio.git mi-app
cd mi-app
claude                  # abre Claude Code
```

El estudio no depende de git ni lo gestiona: usa el control de versiones que
prefieras (o ninguno). Si tu app usa git, lo manejas tú con normalidad.

Y dentro de Claude Code:

```
/start
```

`/start` te ayuda a elegir el modo de trabajo y te sitúa en el paso adecuado.

### Dos modos de trabajo

El estudio no impone un único camino. Eliges según el proyecto.

#### Modo prototipo — la opción rápida de desarrollar

El camino rápido sigue un flujo de tres pasos:

```
   PROTOTIPAR  →  DESARROLLAR  →  CONSOLIDAR
   (algo que      (iterar sobre    (cuando va en serio,
    funciona)      lo que hay)      darle base sólida)
```

1. **Prototipar** (`/prototype`) — describes la app y el primer entregable es
   algo que funciona. Definición rápida de la idea, stack elegido en una
   conversación, sin fases ni documentos.
2. **Desarrollar** — el bucle de iteración: miras lo que hay, pides el siguiente
   cambio, se aplica, vuelves a mirar. Sin sprints ni ceremonia.
3. **Consolidar** (`/consolidate`) — cuando el prototipo deja de ser un
   experimento y va en serio, este paso audita la deuda acumulada y lleva el
   proyecto al estándar del modo completo. Lo invocas tú, cuando lo decidas.

Es la vía recomendada para prototipos, apps pequeñas o para validar una idea
cuanto antes — sin renunciar a poder darle estructura sólida más adelante.

#### Modo completo — el camino con proceso

Cinco fases ordenadas (discovery → design → building → release → maintenance):
diseña antes de construir. Algo más lento al principio, pero más seguro a largo
plazo. Ideal para proyectos que sabes serios, grandes o complejos desde el
inicio. Se arranca con `/start` → completo.

El recorrido detallado de ambos modos está en
[`docs/workflow.md`](docs/workflow.md).

---

## Qué hay dentro

```
CLAUDE.md                       # Configuración maestra
.claude/
  settings.json                 # Permisos y registro de hooks
  statusline.sh                 # Statusline (modelo · contexto% · stage)
  agents/
    directors/                  # 3 agentes Tier 1 (Opus)
    leads/                      # 7 agentes Tier 2 (Sonnet)
    specialists/                # 19 agentes Tier 3 (Sonnet)
      core/  mobile/  desktop/  pwa/  design/
  skills/                       # 22 slash commands del núcleo
  hooks/                        # 7 hooks automáticos (bash)
  utils/                        # 3 utilidades (build, manifest, version)
  rules/                        # 11 estándares con scope por path
  templates/                    # 17 plantillas (PRD, ADR, sprint, privacy...)
  preferences.md                # Preferencias persistentes del arquitecto
packages/                       # Paquetes opcionales
  backend-baas/  backend-custom/  payments/  push/  i18n/  analytics/  ai-features/
design/                         # PRDs, especificaciones de features (vacío)
docs/                           # ADRs, runbooks, API contracts (vacío)
production/                     # Sprints, retrospectivas, estado de sesión
```

### Agentes (29 base + opcionales)

**Directores (3)** — `product-director`, `technical-director`, `delivery-manager`

**Leads (7)** — `ux-lead`, `frontend-lead`, `mobile-lead`, `desktop-lead`,
`qa-lead`, `devops-lead`, `security-privacy-lead`

**Especialistas (19)** — agrupados en core (architect, component-engineer,
state-engineer, perf-engineer, a11y-auditor, e2e-engineer, release-engineer,
docs-writer), mobile (iOS/Android release, native bridges), desktop (OS
integration, auto-update), pwa (service worker, offline sync, install UX) y
diseño (UI, design system, iconos).

**Opcionales vía paquetes** — `backend-lead`, `baas-specialist`, `api-designer`,
`db-engineer`, `auth-engineer`, `payments-engineer`, `push-engineer`,
`i18n-engineer`, `analytics-engineer`, `ai-features-engineer`.

### Skills del núcleo (22)

`/start` `/prototype` `/consolidate` `/brainstorm-app` `/define-mvp`
`/choose-stack` `/package-add` `/architect-feature` `/scaffold-feature`
`/code-review` `/design-review` `/a11y-audit` `/perf-audit` `/security-review`
`/release-checklist` `/pwa-checklist` `/changelog` `/sprint-plan`
`/retrospective` `/adr-new` `/scope-check` `/bug-report`

`/prototype` y `/consolidate` son el modo rápido y su puente al modo completo.
El resto pertenecen al modo completo o sirven a ambos.

Cada skill indica su lugar en el workflow y cuál es el siguiente paso, de modo
que el flujo de producción queda encadenado de principio a fin. Ver
[`docs/workflow.md`](docs/workflow.md).

### Hooks automáticos (7) y utilidades (3)

**Hooks** — se ejecutan solos en eventos de Claude Code, en modo *detectar y
avisar*:

`session-start.sh` / `session-stop.sh` (contexto entre sesiones) ·
`load-env.sh` (avisa si falta `.env.local`) ·
`check-deps.sh` (avisa si faltan dependencias) ·
`dev-server.sh` (avisa cómo arrancar el servidor de desarrollo) ·
`check-secrets.sh` (avisa si se escribe un secreto en claro) ·
`log-agent.sh` (traza de subagentes invocados).

**Utilidades** — scripts que invoca un skill o el arquitecto a mano:
`validate-manifest.sh` (manifest de PWA correcto) ·
`version-sync.sh` (versión sincronizada entre web/móvil/desktop) ·
`build-check.sh` (build de prueba para verificar que compila).

**Preferencias** (`.claude/preferences.md`) — declaras una vez tus elecciones
persistentes (idioma, stack favorito, BaaS preferido, paquetes a activar por
defecto, convenciones) y los agentes las respetan sin volver a preguntar.
También permite activar acciones automáticas opt-in como instalar dependencias
o arrancar el servidor de desarrollo solas.

El estudio no incluye hooks de git ni integración con plataformas de
repositorio: git, si lo usas, lo gestionas tú.

### Statusline

`.claude/statusline.sh` muestra debajo del prompt de Claude Code:

```
[Sonnet] · ctx:42% · stage:building
```

- **Modelo** activo.
- **Contexto%** (verde / amarillo / rojo según consumo).
- **Stage** del proyecto auto-detectado (`discovery`, `design`, `building`,
  `release`, `maintenance`), que corresponde a las fases del workflow.

Ver [`docs/statusline.md`](docs/statusline.md) para personalizar o cambiar el
formato.

---

## Personalización

Todo es modificable. Ver [`docs/customizing.md`](docs/customizing.md). Patrones
comunes:

- **Quitar lo que no uses** — borra agentes/skills que no apliquen a tu app.
- **Cambiar el tono** — cada agente vive en un único archivo markdown.
- **Añadir reglas custom** — un archivo nuevo en `.claude/rules/` con frontmatter
  declarando el path scope.
- **Añadir agentes/skills** — copia uno existente como plantilla.

---

## Roadmap

- [ ] Ejemplos de proyectos arrancados con el template (prototipo y completo,
      cada uno con el modo correspondiente).
- [ ] Más paquetes opcionales según vayan apareciendo casos de uso reales.

Hecho recientemente:
- ✓ Modo prototipo (`/prototype` + `/consolidate`) — el camino rápido.
- ✓ Paquete `ai-features` para apps que integran IA en el producto final.
- ✓ Plantillas adicionales: política de privacidad completa, términos de
      servicio, modelo de costes, respuesta a incidentes, checklist de
      onboarding.

## Contribuir

Pull requests bienvenidos. Lee [CONTRIBUTING.md](CONTRIBUTING.md) y el
[código de conducta](CODE_OF_CONDUCT.md) antes de abrir uno. Reglas mínimas:

- Una mejora por PR (no acoples cosas).
- Si tocas la jerarquía de agentes o añades un paquete, abre primero una discussion.
- Mantén la filosofía: **el humano decide, los agentes proponen**.

Para reportar bugs o proponer mejoras, usa las plantillas de issue del repo.

## Historial de cambios

Ver [CHANGELOG.md](CHANGELOG.md).

## Licencia

[MIT](LICENSE). Eres libre de usarlo, modificarlo y redistribuirlo.

## Créditos

Este proyecto está basado e inspirado en
[Claude-Code-Game-Studios](https://github.com/Donchitos/Claude-Code-Game-Studios)
de [@Donchitos](https://github.com/Donchitos), que aplica el patrón "studio
hierarchy + collaborative design + path-scoped rules" al desarrollo de
videojuegos. App Studio adapta ese mismo patrón a apps multiplataforma de
propósito general. Si lo tuyo son los videojuegos, usa el original. Crédito al
diseño y la filosofía originales a Donchitos.

- **Diseño original** y filosofía del studio: [Donchitos/Claude-Code-Game-Studios](https://github.com/Donchitos/Claude-Code-Game-Studios).
- **Adaptación para apps multiplataforma**: este repositorio.
- **Built for** [Claude Code](https://docs.claude.com/en/docs/claude-code/overview).

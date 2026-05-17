# Changelog

Todos los cambios destacables de este proyecto se documentan aquí.

El formato sigue [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/) y
este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

## [Sin liberar]

### Añadido
- `docs/workflow.md`: guía maestra del flujo de producción de una app, de la idea
  al mantenimiento, en cinco fases.
- `docs/glossary.md`: glosario de los términos recurrentes del estudio.
- Skill `/package-add`: activa los paquetes opcionales en el sitio correcto y
  evita activaciones incompatibles.
- Cada skill incluye ahora una sección "Siguiente paso" que encadena el workflow.

### Cambiado
- Los 39 agentes (29 del núcleo + 10 de paquetes) reescritos a profundidad
  completa: workflows, criterios de decisión, ejemplos de interacción y handoff.
- Los 19 skills del núcleo reescritos con estructura uniforme.
- `settings.json`: hooks corregidos al formato válido de Claude Code.

### Eliminado
- Toda la integración de git del estudio: el hook de validación de commits/push,
  la rama de git en la statusline y los permisos de git. El estudio ya no se
  acopla a git; las apps que se construyan con él pueden usar git con normalidad,
  gestionado por el desarrollador.

## [0.1.0] — 2026-05-15

Primer release público. Adaptación del patrón "studio hierarchy" de
[Claude-Code-Game-Studios](https://github.com/Donchitos/claude-code-game-studios)
al desarrollo de apps multiplataforma.

### Añadido

#### Estructura del estudio
- **3 agentes Tier 1 (Directores, Opus)**: `product-director`, `technical-director`, `delivery-manager`.
- **7 agentes Tier 2 (Leads, Sonnet)**: `ux-lead`, `frontend-lead`, `mobile-lead`, `desktop-lead`, `qa-lead`, `devops-lead`, `security-privacy-lead`.
- **19 agentes Tier 3 (Especialistas)** organizados en 5 áreas: core (8), mobile (3), desktop (2), pwa (3), design (3).

#### Skills
- **19 slash commands del núcleo**: `/start`, `/brainstorm-app`, `/choose-stack`, `/define-mvp`, `/architect-feature`, `/scaffold-feature`, `/code-review`, `/design-review`, `/a11y-audit`, `/perf-audit`, `/security-review`, `/release-checklist`, `/pwa-checklist`, `/changelog`, `/sprint-plan`, `/retrospective`, `/adr-new`, `/scope-check`, `/bug-report`.

#### Validación automática
- **8 hooks bash**: detección de secretos, validación de commits y manifests, sincronización de versiones entre plataformas, contexto entre sesiones, audit trail de subagentes.

#### Estándares
- **11 rules con scope por path** cubriendo UI, features, plataforma, estado, API, PWA, tests, diseño, secretos, multiplataforma y accesibilidad.

#### Documentación y plantillas
- **12 plantillas**: PRD, feature-spec, ADR, sprint-plan, retrospective, risk-register, bug-report, release-notes, store-listing, runbook, threat-model, privacy-notice.
- **6 docs guía**: README, CLAUDE.md, quick-start, customizing, agent-roster, agent-coordination-map, statusline.

#### Paquetes opcionales
- `backend-baas` (Supabase, Firebase, Appwrite, Convex) — 2 agentes, 3 skills.
- `backend-custom` (backend propio en cualquier stack) — 4 agentes, 3 skills.
- `payments` (Stripe, IAP, RevenueCat) — 1 agente, 1 skill.
- `push` (FCM, APNs) — 1 agente, 1 skill.
- `i18n` (multi-idioma) — 1 agente, 2 skills.
- `analytics` (telemetría de producto) — 1 agente, 1 skill.

#### Statusline
- `.claude/statusline.sh` muestra modelo, contexto%, stage del proyecto y branch de git debajo del prompt de Claude Code.
- Stages auto-detectados a partir de los artefactos del repo: `discovery`, `design`, `building`, `release`, `maintenance`.
- Override manual vía `production/stage.txt`.

### Diseño

- **Filosofía colaborativa**: pregunta → opciones → decisión → borrador → aprobación. Sin auto-piloto.
- **Stack-agnóstico**: el template no impone tecnología; `/choose-stack` decide al arrancar.
- **Modular**: núcleo lean + paquetes opcionales activables con `cp`.
- **Multiplataforma desde el día 1**: lógica de negocio agnóstica, APIs de plataforma abstraídas, offline-first por defecto, WCAG 2.2 AA mínimo.

### Notas

Esta es una versión inicial. La API de agentes, skills y la estructura de
paquetes pueden cambiar en versiones próximas según feedback de la comunidad.
Esperamos romper compatibilidad antes de `1.0.0` si encontramos diseños mejores.

[0.1.0]: https://github.com/Ichiaka/claude-code-app-studio/releases/tag/v0.1.0

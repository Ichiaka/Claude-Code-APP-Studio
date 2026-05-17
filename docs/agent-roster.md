# Roster de agentes

## Tier 1 — Directores (3)
| Agente | Modelo | Dominio |
|--------|--------|---------|
| product-director | opus | Visión, prioridades, criterios de aceptación |
| technical-director | opus | Arquitectura, decisiones cross-cutting |
| delivery-manager | opus | Sprints, releases, scope, riesgos |

## Tier 2 — Leads (7 + 1 opcional)
| Agente | Modelo | Dominio |
|--------|--------|---------|
| ux-lead | sonnet | UX, design system, accesibilidad |
| frontend-lead | sonnet | UI, estado, performance del cliente |
| mobile-lead | sonnet | iOS, Android, stores, permisos |
| desktop-lead | sonnet | Windows/macOS/Linux, integración OS |
| qa-lead | sonnet | Estrategia de testing, gates |
| devops-lead | sonnet | CI/CD, entornos, observabilidad |
| security-privacy-lead | sonnet | RGPD, OWASP, secretos |
| backend-lead | sonnet | (opcional, vía paquete backend-*) |

## Tier 3 — Especialistas del núcleo (19 base)

**Core (8)**: architect, component-engineer, state-engineer, perf-engineer,
a11y-auditor, e2e-engineer, release-engineer, docs-writer.

**Mobile (3)**: ios-release-specialist, android-release-specialist, native-bridge-engineer.

**Desktop (2)**: os-integration-engineer, auto-update-engineer.

**PWA (3)**: service-worker-engineer, offline-sync-engineer, install-ux-engineer.

**Design (3)**: ui-designer, design-system-engineer, icon-asset-engineer.

## Especialistas vía paquetes opcionales

Se activan con el skill `/package-add`. Sus agentes de tier 3 se copian a
`.claude/agents/specialists/packages/` (separados del núcleo); los `backend-lead`
van a `.claude/agents/leads/`.

| Paquete | Aporta |
|---------|--------|
| backend-baas | backend-lead, baas-specialist |
| backend-custom | backend-lead, api-designer, db-engineer, auth-engineer |
| payments | payments-engineer |
| push | push-engineer |
| i18n | i18n-engineer |
| analytics | analytics-engineer |

> `backend-baas` y `backend-custom` son mutuamente excluyentes: ambos aportan un
> `backend-lead`. Activa solo uno.

## Modelo por tier

Los 3 directores usan **opus** (decisiones de mayor alcance e impacto). Todos los
leads y specialists usan **sonnet**. Todos los agentes de paquetes son tier 2
(sonnet) o tier 3 (sonnet).

## Profundidad de los agentes

Cada agente está definido en profundidad (~130-165 líneas): identidad,
responsabilidades, lo que no hace, workflows paso a paso, criterios de decisión,
un ejemplo de interacción extenso, heurísticas y protocolo de handoff. Al
crear un agente nuevo, sigue esa misma estructura para mantener la coherencia.

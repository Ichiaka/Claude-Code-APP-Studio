---
name: package-add
description: Activa un paquete opcional del estudio (backend-baas, backend-custom, payments, push, i18n, analytics). Copia sus agentes y skills al sitio correcto, registra la decisión y evita activaciones incoherentes.
---

# /package-add

Eres el encargado de activar un paquete opcional del estudio. Un paquete añade
agentes y skills especializados para una capacidad concreta (backend, pagos,
push, i18n, analítica). Tu trabajo es activarlo bien: en el sitio correcto, sin
duplicar, y dejando constancia de la decisión.

## Paquetes disponibles

| Paquete | Para qué | Aporta |
|---|---|---|
| `backend-baas` | Backend gestionado (Supabase, Firebase…) | backend-lead, baas-specialist |
| `backend-custom` | Backend propio (Node, Python, Go…) | backend-lead, api-designer, db-engineer, auth-engineer |
| `payments` | Cobros, suscripciones, IAP | payments-engineer |
| `push` | Notificaciones push | push-engineer |
| `i18n` | Multi-idioma | i18n-engineer |
| `analytics` | Telemetría de producto | analytics-engineer |

## Protocolo

1. **Confirma qué paquete** quiere activar el arquitecto. Si no lo dice, muéstrale
   la tabla y pregunta.

2. **Comprueba incompatibilidades y precondiciones**:
   - `backend-baas` y `backend-custom` son **mutuamente excluyentes**: ambos
     aportan un `backend-lead`. Si uno ya está activo, no actives el otro sin que
     el arquitecto confirme que quiere reemplazarlo. Activar los dos deja dos
     agentes con el mismo nombre y rompe la coherencia.
   - Si el paquete ya está activo (sus agentes ya existen en `.claude/agents/`),
     dilo y no lo dupliques.

3. **Comprueba si el paquete encaja con el momento del proyecto.** Por ejemplo,
   activar `backend-*` tiene sentido cuando ya se sabe que el producto necesita
   backend (normalmente tras `/define-mvp`). Si parece prematuro, dilo — pero la
   decisión es del arquitecto.

4. **Copia los archivos al sitio correcto**:
   - Los agentes de tier 3 (specialists) van a `.claude/agents/specialists/packages/`.
   - Los agentes de tier 2 (leads, como `backend-lead`) van a `.claude/agents/leads/`.
   - Los skills van a `.claude/skills/`.

   Crea `.claude/agents/specialists/packages/` si no existe. Mantener los agentes
   de paquete en su propia carpeta —y no mezclados con los del núcleo en
   `specialists/core/`— hace evidente qué es base y qué se añadió.

5. **Registra la activación.** Para los paquetes que son una decisión de
   arquitectura (`backend-baas`, `backend-custom`), genera un ADR con `/adr-new`.
   Para el resto, basta con anotarlo en `production/session-state/current.md`.

6. **Indica el siguiente paso.** Algunos paquetes tienen un skill de arranque:
   - `backend-baas` → ejecutar `/choose-baas`.
   - `i18n` → ejecutar `/i18n-setup`.
   - `analytics` → ejecutar `/event-plan`.
   - `payments` → ejecutar `/payments-design`.
   - `push` → ejecutar `/push-setup`.

## Ejemplo de activación

```bash
# Ejemplo: activar el paquete payments
mkdir -p .claude/agents/specialists/packages
cp packages/payments/agents/*.md .claude/agents/specialists/packages/
cp -r packages/payments/skills/* .claude/skills/
```

Para un paquete con lead (backend-*), el lead va aparte:

```bash
# Ejemplo: activar backend-custom
mkdir -p .claude/agents/specialists/packages
cp packages/backend-custom/agents/backend-lead.md .claude/agents/leads/
cp packages/backend-custom/agents/api-designer.md   .claude/agents/specialists/packages/
cp packages/backend-custom/agents/db-engineer.md    .claude/agents/specialists/packages/
cp packages/backend-custom/agents/auth-engineer.md  .claude/agents/specialists/packages/
cp -r packages/backend-custom/skills/* .claude/skills/
```

## Anti-patrones

- Activar `backend-baas` y `backend-custom` a la vez: dos `backend-lead`,
  incoherencia garantizada.
- Copiar los agentes de paquete a `specialists/core/`, mezclándolos con el
  núcleo: se pierde de vista qué es base y qué es añadido.
- Activar un paquete "por si acaso" antes de saber que el producto lo necesita:
  agentes y skills de más que solo añaden ruido.
- Activar un paquete y no registrar la decisión: dentro de un mes nadie recuerda
  por qué está ahí.

# Paquete: backend-custom

Activa este paquete si vas a programar tu propio backend (Node, Python, Go,
Rust, etc.).

Aporta los agentes `backend-lead` (modo custom), `api-designer`, `db-engineer` y
`auth-engineer`, más los skills `api-contract`, `schema-design` y `auth-flow`.

## Cuándo elegirlo

- Lógica de servidor compleja.
- Control total sobre datos e infraestructura.
- Performance crítico.
- El vendor lock-in es un blocker.

## Cuándo NO elegirlo

- Eres una sola persona y no quieres mantener un servidor.
- La complejidad real es sencilla — un BaaS te haría ir más rápido.

> Incompatible con `backend-baas`: ambos aportan un `backend-lead`. Activa solo
> uno.

## Activación

La forma recomendada es el skill `/package-add backend-custom`, que copia los
archivos al sitio correcto y registra el ADR. Activación manual equivalente:

```bash
mkdir -p .claude/agents/specialists/packages
cp packages/backend-custom/agents/backend-lead.md  .claude/agents/leads/
cp packages/backend-custom/agents/api-designer.md  .claude/agents/specialists/packages/
cp packages/backend-custom/agents/db-engineer.md   .claude/agents/specialists/packages/
cp packages/backend-custom/agents/auth-engineer.md .claude/agents/specialists/packages/
cp -r packages/backend-custom/skills/* .claude/skills/
```

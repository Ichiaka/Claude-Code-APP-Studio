# Paquete: backend-baas

Activa este paquete si vas a usar un **Backend-as-a-Service** (Supabase,
Firebase, Appwrite, Convex, etc.) en lugar de programar tu propio backend.

Aporta los agentes `backend-lead` (modo BaaS) y `baas-specialist`, más los
skills `choose-baas`, `baas-data-model` y `baas-auth-flow`.

## Cuándo elegirlo

- Necesitas login, base de datos y APIs sencillas.
- Eres una sola persona y no quieres mantener un servidor.
- La lógica de negocio compleja es pequeña o nula.

## Cuándo NO elegirlo

- Necesitas lógica de servidor compleja o crítica.
- Tienes requisitos legales que requieren control total sobre los datos.
- El vendor lock-in es un blocker.

> Incompatible con `backend-custom`: ambos aportan un `backend-lead`. Activa solo
> uno.

## Activación

La forma recomendada es el skill `/package-add backend-baas`, que copia los
archivos al sitio correcto y registra el ADR. Activación manual equivalente:

```bash
mkdir -p .claude/agents/specialists/packages
cp packages/backend-baas/agents/backend-lead.md   .claude/agents/leads/
cp packages/backend-baas/agents/baas-specialist.md .claude/agents/specialists/packages/
cp -r packages/backend-baas/skills/* .claude/skills/
```

Después, ejecuta `/choose-baas` para decidir cuál usar y registrar el ADR.

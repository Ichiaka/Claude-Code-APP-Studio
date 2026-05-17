# Paquete: analytics

Actívalo si necesitas telemetría de uso: eventos, funnels, métricas de producto.

Aporta el agente `analytics-engineer` y el skill `event-plan`.

> La analítica recoge datos de personas. Este paquete asume que el consentimiento
> y la minimización de datos se respetan desde el primer evento — revísalo con el
> agente `security-privacy-lead`.

## Activación

La forma recomendada es el skill `/package-add analytics`. Activación manual
equivalente:

```bash
mkdir -p .claude/agents/specialists/packages
cp packages/analytics/agents/analytics-engineer.md .claude/agents/specialists/packages/
cp -r packages/analytics/skills/* .claude/skills/
```

Después, ejecuta `/event-plan` para definir qué medir.

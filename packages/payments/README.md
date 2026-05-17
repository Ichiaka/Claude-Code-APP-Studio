# Paquete: payments

Actívalo si tu app cobra: suscripciones, compras puntuales, compras in-app de las
stores.

Aporta el agente `payments-engineer` y el skill `payments-design`.

## Activación

La forma recomendada es el skill `/package-add payments`. Activación manual
equivalente:

```bash
mkdir -p .claude/agents/specialists/packages
cp packages/payments/agents/payments-engineer.md .claude/agents/specialists/packages/
cp -r packages/payments/skills/* .claude/skills/
```

Después, ejecuta `/payments-design` para diseñar la integración de pagos.

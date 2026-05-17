# Paquete: push

Actívalo si necesitas notificaciones push (FCM en Android y web, APNs en iOS).

Aporta el agente `push-engineer` y el skill `push-setup`.

## Activación

La forma recomendada es el skill `/package-add push`. Activación manual
equivalente:

```bash
mkdir -p .claude/agents/specialists/packages
cp packages/push/agents/push-engineer.md .claude/agents/specialists/packages/
cp -r packages/push/skills/* .claude/skills/
```

Después, ejecuta `/push-setup` para configurar la integración.

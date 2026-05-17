---
name: push-setup
description: Configura push notifications en todas las plataformas elegidas.
---

# /push-setup

## Protocolo

1. Identifica targets (web, iOS, Android).
2. Para cada uno:
   - Servicio (FCM unifica, o nativo).
   - Credenciales.
   - Registro y storage de tokens.
3. Diseña el flujo de permiso (cuándo lo pides, con qué contexto).
4. Define tipos de notificación y su prioridad.
5. Documenta en `docs/features/push.md`.

## Checklist

- [ ] Permiso pedido en contexto, no al arrancar.
- [ ] Tokens renovados periódicamente.
- [ ] Opt-out fácil en la app (no solo en el SO).
- [ ] Test de delivery en cada plataforma.

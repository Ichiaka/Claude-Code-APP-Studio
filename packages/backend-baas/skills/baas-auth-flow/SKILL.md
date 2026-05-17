---
name: baas-auth-flow
description: Configura el flujo de autenticación en el BaaS: providers, sesiones, recuperación.
---

# /baas-auth-flow

## Protocolo

1. Pregunta qué providers (email/password, magic link, Google, Apple, GitHub, etc.).
2. Define sesión: duración, refresh, dispositivos múltiples.
3. Define flow de recuperación de contraseña.
4. Configura emails transaccionales (verificación, reset).
5. Documenta el flow completo en `docs/features/auth.md`.

## Checklist mínimo

- [ ] Email verificado obligatorio.
- [ ] Rate limit en login (contra fuerza bruta).
- [ ] Sesiones revocables.
- [ ] Logout invalida sesión en servidor (no solo cliente).
- [ ] Recuperación de contraseña con token de un solo uso y expirable.

---
name: pwa-checklist
description: Verifica que la app cumple los requisitos de una PWA instalable y funcional — manifest, iconos, service worker, comportamiento offline.
---

# /pwa-checklist

**Fase del workflow:** Building y Release (si la app es una PWA).
**Agentes que lo llevan:** `service-worker-engineer` e `install-ux-engineer`.

Verificas que la app cumple lo necesario para ser una PWA de verdad: que se puede
instalar y que funciona sin conexión. Aplica solo si el stack elegido incluye una
PWA.

## Checklist

### Manifest
- [ ] El manifest de la aplicación web incluye: nombre, nombre corto, URL de
      inicio, scope, modo de visualización, color de tema y color de fondo.

### Iconos
- [ ] Iconos de al menos 192×192 y 512×512.
- [ ] Un icono *maskable* (con margen de seguridad para el recorte del sistema).
- [ ] iOS: `apple-touch-icon` de 180×180 y las meta etiquetas específicas.

### Service worker
- [ ] El service worker está registrado y sus caches versionadas.
- [ ] La estrategia de cacheo de cada tipo de recurso está documentada y
      justificada (ver el agente `service-worker-engineer`).
- [ ] Se maneja la actualización del service worker (no sirve versiones
      obsoletas indefinidamente).

### Funcionamiento
- [ ] La app funciona sin conexión para sus flujos principales.
- [ ] El prompt de instalación aparece en buen momento — nunca al arrancar.
- [ ] La app se sirve siempre por HTTPS.
- [ ] La auditoría PWA de Lighthouse pasa.

## Output

El resultado del checklist, con los puntos que fallan y cómo corregirlos.

## Siguiente paso

- Puntos que fallan → se corrigen con `service-worker-engineer` (cacheo, offline)
  o `install-ux-engineer` (manifest, instalación).
- En fase de release, este checklist forma parte de la verificación previa a
  publicar.

## Anti-patrones

- Un manifest incompleto: la PWA no será instalable o se verá rota instalada.
- Una estrategia de cacheo "cache first" para contenido dinámico: sirve versiones
  obsoletas.
- Dar por bueno el comportamiento offline sin probarlo cortando la red de verdad.

---
name: pwa-layer-rules
paths: ["src/pwa/**", "public/sw.js", "public/service-worker.*"]
---

# Reglas para PWA / Service Worker

- **Versionado del SW**: nombre de cache incluye versión.
- **Estrategia por endpoint** documentada (cache-first / network-first / SWR).
- **Update flow**: detectar nuevo SW y avisar al usuario (no `skipWaiting` ciego).
- **Precache** solo lo crítico, no la app entera.
- **Fallback offline** explícito por ruta.

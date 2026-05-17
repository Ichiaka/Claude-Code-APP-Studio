---
name: multiplatform-rules
paths: ["src/**"]
---

# Reglas multiplataforma

- **Lógica de negocio agnóstica**. No debe saber si corre en web, móvil o desktop.
- **APIs de plataforma** (storage, push, file system, cámara) **siempre abstraídas** en `src/platform/`.
- **Sin `if (window) ...`** salpicado por toda la app. Eso es señal de que falta abstracción.
- **Detección de plataforma** centralizada (un solo módulo que dice qué es qué).

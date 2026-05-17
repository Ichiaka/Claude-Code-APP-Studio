---
name: ui-layer-rules
paths: ["src/ui/**", "src/components/**"]
---

# Reglas para UI

- **Sin lógica de negocio**. La UI recibe datos y emite eventos.
- **Sin llamadas a API directas**. Usa el cliente del dominio (`src/lib/api/*` o hook equivalente).
- **i18n-ready**: ningún string hardcoded user-facing en código. Usa el mecanismo de i18n elegido o un wrapper que permita migrar después.
- **Accesibilidad**: roles ARIA correctos, alt en imágenes, labels en inputs, focus management.
- **Sin acceso directo a storage**. Usa la abstracción de storage del proyecto.
- **Estados visuales obligatorios**: loading, error, empty cuando apliquen.

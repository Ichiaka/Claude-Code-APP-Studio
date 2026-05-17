---
name: platform-layer-rules
paths: ["src/native/**", "src/platform/**"]
---

# Reglas para capa de plataforma

- **Wrappers tipados** sobre APIs nativas (Capacitor, Tauri, etc.).
- **No invoques APIs nativas directamente desde la UI**. Pasa por aquí.
- **Fallback documentado** para cuando la API no está disponible (p. ej. en web).
- **Threading**: nunca bloquear el hilo principal con operaciones síncronas largas.

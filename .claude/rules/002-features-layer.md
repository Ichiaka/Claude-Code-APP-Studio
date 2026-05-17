---
name: features-layer-rules
paths: ["src/features/**"]
---

# Reglas para features

- **Feature folders**: cada feature autocontenida. No importes entre features directamente.
- **Lo compartido vive en `src/shared/`** o `src/lib/`. Si dos features necesitan lo mismo, súbelo.
- **Contratos tipados**: types/interfaces explícitos para entrada y salida de cada feature.
- **Side effects encapsulados**: separa funciones puras de funciones con side effects.

---
name: accessibility-rules
paths: ["src/**"]
---

# Reglas de accesibilidad (WCAG 2.2 AA mínimo)

- **Contraste**: AA mínimo (4.5:1 texto normal, 3:1 texto grande).
- **Teclado**: todo flujo debe ser completable solo con teclado.
- **Focus visible**: no quitar el outline sin reemplazarlo.
- **Labels**: todo input asociado con su label.
- **Alt text**: imágenes informativas con alt descriptivo; decorativas con `alt=""`.
- **Color no es la única señal**: errores también con texto/iconos.
- **`prefers-reduced-motion`**: respetar para animaciones largas.

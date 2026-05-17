---
name: secrets-rules
paths: ["**/*"]
---

# Reglas de secretos (aplican a TODO el código)

- **Cero secretos en el código fuente**. Ni en el código actual ni en el
  histórico de versiones (si un secreto llegó a versionarse alguna vez, se
  considera comprometido: rótalo).
- **Cero secretos en el cliente** (móvil, desktop, web). El binario es público y
  cualquiera puede extraer lo que lleve dentro.
- **Variables de entorno** para la configuración sensible: un archivo local de
  entorno (excluido del control de versiones) en desarrollo, y un gestor de
  secretos en producción.
- **Los archivos de entorno locales nunca se versionan.** El repositorio incluye
  solo un archivo de ejemplo (`.env.example`) con las claves esperadas y sin
  valores reales.
- **Lockfiles bajo control de versiones.** Si cambian sin una razón clara,
  sospecha.

---
name: security-review
description: Revisa una feature o un release por riesgos de seguridad y privacidad antes de darlo por bueno. Detecta secretos, validación, auth, datos personales y dependencias vulnerables.
---

# /security-review

**Fase del workflow:** Building (antes de dar una feature por buena) y Release
(paso 12, antes de publicar).
**Agente que lo lleva:** `security-privacy-lead`.

Revisas una feature o un release candidato buscando riesgos de seguridad y de
privacidad — antes de que los encuentre un atacante, un regulador o un usuario
afectado.

## Protocolo

1. **Determina el alcance:** una feature concreta, o el release completo.

2. **Recorre el checklist mínimo:**
   - **Secretos** — ningún secreto en el código ni en el histórico de versiones;
     ninguna clave en el cliente (móvil, desktop, web), donde cualquiera puede
     extraerla.
   - **Entrada** — toda entrada de usuario se valida en el servidor, no solo en
     el cliente.
   - **Autenticación** — las sesiones expiran; los tokens se pueden revocar; el
     logout invalida la sesión donde el servidor manda.
   - **Autorización** — cada operación comprueba en el servidor que el usuario
     puede hacerla, sobre el recurso concreto.
   - **Transporte** — todo viaja cifrado (TLS).
   - **Datos personales** — hay base legal para recogerlos, política de
     retención, y se pueden borrar a petición.
   - **Dependencias** — ninguna con vulnerabilidades conocidas (CVE) graves.
   - **Logs** — no contienen datos personales ni secretos.

3. **Para una feature que toca datos sensibles, auth o dinero**, haz además
   threat modeling (recorre STRIDE — ver el agente `security-privacy-lead`).

4. **Reporta los hallazgos** distinguiendo lo bloqueante (un secreto expuesto,
   una vulnerabilidad explotable, datos sin base legal) de lo mejorable.

## Output

`docs/security/review-<fecha>.md` con los hallazgos y las acciones. Si hubo
threat modeling, `docs/security/threat-model-<feature>.md`.

## Siguiente paso

- Hallazgos bloqueantes → se corrigen antes de continuar; en fase de release,
  bloquean el release.
- Si la revisión se pasa como parte de un release → continúa con
  `/release-checklist`.

## Anti-patrones

- Disfrazar un hallazgo bloqueante de simple sugerencia.
- Revisar solo el código nuevo e ignorar las dependencias que arrastra.
- Dar por buena una comprobación de permisos que vive solo en el cliente.

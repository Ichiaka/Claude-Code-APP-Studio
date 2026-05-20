---
name: ai-feature-design
description: Diseña una feature de IA dentro del producto — elige modo, proveedor, modelo, prompts, modos de fallo y presupuesto de coste. Para apps que integran IA como parte de su producto final.
---

# /ai-feature-design

**Fase del workflow:** Design (cuando una feature usa IA).
**Agente que lo lleva:** `ai-features-engineer`.

Diseñas una feature que usa IA dentro del producto final del usuario, antes de
implementarla. Es la pieza de `ai-features` equivalente a `/architect-feature`,
pero centrada en las decisiones específicas de IA.

## Requisito previo

El paquete `ai-features` debe estar activado. Si no, ejecuta antes
`/package-add ai-features`. El stack del proyecto debe estar decidido
(`docs/adr/0001-stack.md` existe).

## Protocolo

1. **Empieza por el caso de uso**, en una frase: "el usuario hace X y la IA
   produce Y". Si no sale en una frase, la feature no está madura — vuelve a
   discusión con el arquitecto.

2. **Decide el modo de la feature.** Pregunta y clasifica:
   - *Asistencia* — la IA sugiere, el usuario decide.
   - *Transformación* — la IA transforma una entrada (resumir, traducir, extraer).
   - *Generación* — la IA produce algo nuevo (texto, imagen, código).
   - *Agente* — la IA actúa por el usuario (más cuidado, más límites).

3. **Decide qué parte es IA y qué es código clásico.** No todo lo que "podría"
   hacer una IA debería: para una validación de email basta una regex. Apunta la
   IA a lo que el código clásico no resuelve bien.

4. **Elige proveedor y modelo.** El paquete es agnóstico — Anthropic, OpenAI,
   Google, modelos locales (Ollama). Para cada opción evalúa: coste por token,
   latencia, capacidad para esta tarea, soporte de streaming, disponibilidad en
   la región del proyecto.

5. **Diseña el prompt como un contrato:**
   - **Rol** del modelo: qué hace y qué no hace.
   - **Formato** de salida esperado (texto, JSON, markdown). Si es JSON, define
     el esquema.
   - **Restricciones explícitas** — qué no debe hacer el modelo aunque el usuario
     se lo pida.
   - **Ejemplos** (few-shot) si la tarea es ambigua o si el formato es delicado.

6. **Diseña los modos de fallo.** No son raros, son normales:
   - Sin red, proveedor caído, rate limit, timeout.
   - Respuesta vacía, malformada o que no cumple el esquema.
   - Contenido inapropiado de salida.
   - Prompt injection (el usuario intenta manipular el comportamiento).

   Para cada uno: qué pasa, qué ve el usuario, cómo se recupera.

7. **Define el presupuesto de coste.** ¿Cuánto cuesta una invocación? ¿Cuántas
   invocaciones por usuario al mes? Coste por usuario × usuarios esperados =
   coste total mensual. Si el número incomoda, replantea ahora (modelo más
   pequeño, caché, limitar uso).

8. **Decide dónde viven la clave y la llamada al proveedor.** La regla, no
   negociable: **nunca en el cliente.** En el servidor, en una function del BaaS,
   en una edge function. Coordínalo con el paquete `backend-*` si está activo.

9. **Si la feature maneja datos personales**, revísalo con `security-privacy-lead`
   antes de elegir proveedor: el DPA, la región y la base legal importan.

10. **Documenta** la feature en `docs/features/<nombre>.md`, con las secciones
    específicas de IA. Registra la elección de proveedor en un ADR.

## Output

- `docs/features/<nombre>.md` con el diseño de la feature.
- `docs/adr/NNNN-proveedor-ia-<feature>.md` con la elección de proveedor.

## Siguiente paso

Con el diseño aprobado, la feature pasa a implementación dentro del bucle normal
del modo en el que estés (prototipo o completo). En modo completo:
`/scaffold-feature` para crear el esqueleto y luego implementación. En modo
prototipo: directamente al bucle de construcción.

## Anti-patrones

- Una feature de IA sin diseño de modos de fallo: la app se romperá delante de
  un usuario el día que el proveedor falle.
- "Pongamos IA aquí" sin un caso de uso concreto: la IA es la solución, no el
  problema.
- Elegir el modelo más capaz por defecto: muchas veces uno más pequeño cumple
  por una fracción del coste.
- Acoplarse al SDK de un proveedor en toda la app: el día que cambies, lo
  reescribes entero. Usa la abstracción de proveedor.
- Una clave de proveedor en el cliente: regalas cuota a quien la extraiga.
- Mostrar la salida del modelo sin validar cuando entra en lógica del producto:
  el día que devuelva un JSON malformado, algo se rompe en silencio.
- Pedir consentimiento de datos al usuario *después* de haberlos enviado al
  proveedor.

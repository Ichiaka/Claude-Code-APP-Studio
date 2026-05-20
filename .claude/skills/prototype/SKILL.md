---
name: prototype
description: Modo rápido del estudio. El primer entregable es un prototipo que funciona; a partir de ahí se itera en un bucle de mirar, pedir un cambio y aplicarlo. Sin fases ni ceremonia de sprints.
---

# /prototype

**Modo del estudio:** Prototipo (el camino rápido).
**Agente que lo orquesta:** `technical-director`, con `product-director` al inicio.

Eres el modo rápido del estudio. Mientras el modo completo recorre cinco fases
antes de tener algo que tocar, el modo prototipo invierte el orden: **lo primero
que produce es una app que funciona**, y todo lo demás es iterar sobre ella.

Esto encaja con cómo trabaja mucha gente: es más rápido y más motivador iterar
sobre algo real que ya puedes ver, que rellenar documentos sobre algo que aún no
existe. El "diseño" emerge de tocar el prototipo, no de planificarlo en abstracto.

## Cuándo se usa este modo

- Quieres ver la app funcionando cuanto antes.
- El proyecto es un prototipo, una prueba de concepto, o una app pequeña.
- Tienes la idea y prefieres descubrir los detalles construyendo, no planificando.

Cuando un proyecto es claramente grande desde el inicio, o sabes que tendrá
mucha complejidad, el modo completo (`/start` → completo) sigue siendo mejor.

## El bucle del prototipo

El modo prototipo no tiene fases. Tiene un bucle que se repite:

```
   describir  →  construir  →  mirar  →  pedir un cambio
                     ↑________________________|
```

## Workflow

### Paso 0 — Definir la idea (rápido)

`product-director` hace unas pocas preguntas directas, no un proceso largo:
- ¿Qué hace la app, en una o dos frases?
- ¿Quién la usa y para qué?
- ¿Cuál es la acción principal — lo único que la app tiene que hacer bien sí o sí?

Con eso basta para arrancar. No se genera PRD ni documento de MVP; la idea vive
en `production/prototype.md`, un archivo breve que se va actualizando.

### Paso 1 — Elegir el stack (rápido, con default)

En modo prototipo, el stack no se delibera: se asume un default razonable y se
confirma con una sola pregunta cerrada.

**El default del estudio:** PWA + Capacitor + Tauri, con TypeScript y React. Es
el más versátil para un desarrollador en solitario — una sola base de código
cubre web, móvil (iOS/Android vía Capacitor) y desktop (vía Tauri), con
herramientas maduras y comunidad amplia.

**Si el arquitecto tiene preferencia en `.claude/preferences.md`**, esa gana
sobre el default del estudio. `technical-director` lee las preferencias al
arrancar y, si hay un `stack favorito` declarado, lo propone como
recomendación.

**El protocolo:** `technical-director` muestra el stack propuesto en una frase
con su razón, y pregunta una sola cosa: *"¿Sigo con este stack, o prefieres
otro?"*. Si el arquitecto dice que sí, se anota en `production/prototype.md` y
adelante. Si dice que no, se abre una conversación corta para elegir otro —
nunca el proceso completo de `/choose-stack`.

Solo si la app tiene targets muy particulares (juego, vídeo pesado, hardware
específico) el `technical-director` levanta la mano para pedir más
deliberación: el default no encaja con todo.

### Paso 2 — Construir el primer prototipo

`technical-director` orquesta a los specialists (`component-engineer`,
`state-engineer`, y los que apliquen) para construir una primera versión que
funcione de la acción principal. No se diseña cada feature en un documento
aparte: se construye.

El objetivo de esta primera versión es que **funcione y se pueda tocar**, no que
esté completa ni pulida.

### Paso 3 — El bucle de iteración

A partir de aquí, el trabajo es un bucle simple:
1. Miras el prototipo.
2. Dices qué quieres cambiar o añadir.
3. Los specialists lo aplican.
4. Vuelves a mirar.

Sin sprints, sin retros, sin gates formales. El estudio te pregunta solo cuando
hay una decisión real que tomar.

## La red de seguridad sigue activa

El modo prototipo es rápido, no descuidado. Aunque no haya ceremonia:
- `qa-lead` vigila que lo construido funcione; los bugs se arreglan, no se
  acumulan en silencio.
- `a11y-auditor` y `security-privacy-lead` siguen presentes. No bloquean con
  gates formales, pero **sí avisan** si algo es un problema serio — un secreto
  expuesto, una pantalla inservible con teclado. Un aviso así no se ignora.
- El hook `check-secrets` sigue funcionando.

La diferencia con el modo completo no es "menos calidad": es "menos
procedimiento". La red está; lo que se quita es la burocracia.

## La deuda que este modo asume

Construir rápido sin diseño previo tiene un coste conocido: el prototipo acumula
deuda — estructura que no se pensó, decisiones que se tomaron deprisa. Para un
prototipo o una app pequeña es un trato que merece la pena.

Cuando el prototipo crezca y quieras llevarlo en serio, **tú decides** invocar
`/consolidate`: el paso que revisa el prototipo, detecta esa deuda y lo lleva al
estándar del modo completo. No es automático y el estudio no te dará la lata con
ello — es una decisión tuya, cuando tú veas que toca.

## Output

- `production/prototype.md` — la idea, el stack elegido y el registro de lo que
  se va construyendo. Un archivo vivo, breve.
- El código del prototipo, funcionando.

## Siguiente paso

- Para seguir iterando → simplemente pide el siguiente cambio.
- Cuando el prototipo vaya en serio y quieras estructura de verdad →
  `/consolidate`.
- Si en algún momento quieres pasar al proceso completo → `/start` y elige el
  modo completo.

## Anti-patrones

- Convertir el modo prototipo en el modo completo con otro nombre: si te
  encuentras generando PRDs y documentos de feature, estás en el modo
  equivocado.
- Ignorar un aviso de `security-privacy-lead` o `a11y-auditor` "porque es solo
  un prototipo": los avisos serios se atienden igual.
- Quedarse para siempre en modo prototipo con una app que ya es grande y
  compleja: para eso está `/consolidate`.

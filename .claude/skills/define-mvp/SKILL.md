---
name: define-mvp
description: Recorta el alcance al mínimo viable. Separa lo imprescindible para validar el concepto de lo que puede esperar. Segundo paso de la fase de discovery.
---

# /define-mvp

**Fase del workflow:** Discovery (paso 2).
**Agente que lo lleva:** `product-director`.

Ayudas al arquitecto a separar el MVP —el mínimo viable— del v1 y de lo que
vendrá más adelante. El MVP es la versión más pequeña que permite validar la
hipótesis central del producto; todo lo que no sirva a esa validación, sale.

## Protocolo

1. **Pide la lista de features** que el arquitecto tiene en mente para la app.

2. **Pasa cada feature por tres preguntas:**
   - ¿Sin esto, la app es directamente inútil? Si no → no es MVP.
   - ¿Sin esto, no podemos validar la hipótesis central del producto? Si no →
     no es MVP.
   - ¿Es barato y obvio de incluir? Si sí → puede entrar aunque no sea esencial.

3. **Reorganiza en tres listas:**
   - **MVP** — lo imprescindible para validar el concepto.
   - **v1** — lo que entra justo después de validar el MVP.
   - **Más adelante / quizá nunca** — el resto.

4. **Cuestiona el MVP otra vez.** Mira la lista de MVP y pregunta, feature a
   feature: ¿esto se puede recortar todavía más? El MVP casi siempre puede ser
   más pequeño de lo que parece.

5. **Define una métrica de éxito.** Una sola, concreta y observable, que dirá si
   el MVP funcionó. Sin métrica, el MVP es una apuesta sin forma de saber si se
   ganó.

## Output

`design/mvp.md` con las tres listas y la métrica de éxito.

## Siguiente paso

Con el MVP definido, el proyecto entra en la fase de **diseño**. El siguiente
skill es `/choose-stack`, para decidir con qué tecnología se construye.
Indícaselo al arquitecto.

## Heurística

- Si el MVP no incomoda por incompleto, no es un MVP: has metido de más.
- Toda feature que entra es código que alguien mantiene para siempre. El coste de
  una feature no termina cuando se entrega.

## Anti-patrones

- Un "MVP" que en realidad es el producto completo con otro nombre.
- Definir el MVP sin una métrica de éxito.
- Justificar una feature en el MVP con "los competidores la tienen" en vez de con
  "sin ella no validamos la hipótesis".

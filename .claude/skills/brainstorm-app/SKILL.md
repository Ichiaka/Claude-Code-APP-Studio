---
name: brainstorm-app
description: Explora ideas de apps desde cero. Genera y critica varios conceptos antes de comprometerse con uno. Primer paso de la fase de discovery.
---

# /brainstorm-app

**Fase del workflow:** Discovery (paso 1).
**Agente que lo lleva:** `product-director`.

Ayudas al arquitecto a generar y filtrar ideas de app **antes** de comprometerse
con ninguna. El objetivo es salir con un concepto que merezca la pena construir,
no con el primero que sonó bien.

## Protocolo

1. **Entiende el punto de partida.** Pregunta:
   - ¿En qué dominio te interesa trabajar? (productividad, salud, finanzas,
     social, herramientas para desarrolladores, etc.)
   - ¿Qué frustración concreta has tenido tú con el software que usas?
   - ¿Tienes alguna restricción dura? (solo móvil, debe funcionar offline, sin
     backend, etc.)

2. **Genera 5-8 ideas variadas.** Para cada una, en formato breve:
   - El concepto en **una frase**.
   - El **usuario arquetipo** — concreto, una persona nombrable, no "todos".
   - El **problema** que resuelve, descrito en el lenguaje del usuario.
   - El **"por qué ahora"** — qué ha cambiado para que esta app sea posible o
     necesaria hoy.

3. **Pide al arquitecto que descarte** y se quede con 1 o 2 finalistas.

4. **Analiza las finalistas en profundidad:**
   - Competidores: qué existe ya y por qué esta app sería distinta. (Que algo
     exista no es una razón para no hacerlo; copiarlo sin entender por qué
     funciona, sí es un error.)
   - Riesgos: técnicos, legales, de adopción.
   - El mínimo absoluto: ¿qué es lo menos que se puede construir y que aún sea
     útil?

## Siguiente paso

Cuando el arquitecto tenga **un** concepto claro, el siguiente paso es
`/define-mvp` para recortarlo al mínimo viable. Indícaselo explícitamente.

## Anti-patrones

- Ideas tipo "el Uber de X" sin pensar por qué Uber funcionó realmente.
- Soluciones en busca de un problema: una idea técnica atractiva que no resuelve
  nada que duela.
- Empezar a hablar de tecnología y stack antes de tener el concepto claro.
- Quedarse con la primera idea sin generar alternativas que la pongan a prueba.

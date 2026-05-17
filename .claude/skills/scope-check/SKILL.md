---
name: scope-check
description: Comprueba si una propuesta de feature está dentro del alcance acordado del sprint, el release o el MVP, y hace visible su coste. Se usa cada vez que aparece trabajo nuevo.
---

# /scope-check

**Fase del workflow:** Building y Maintenance (cada vez que aparece trabajo
nuevo).
**Agente que lo lleva:** `delivery-manager`, con consulta a `product-director`.

Compruebas si una idea o feature nueva encaja en el alcance acordado, y haces
visible su coste antes de que se cuele sin que nadie lo haya decidido. El scope
creep no se combate diciendo "no" a todo: se combate mostrando el trade.

## Cuándo se usa

Cada vez que, a mitad de un sprito o de un ciclo, aparece trabajo que no estaba
planificado: "ya que estamos, añade también...", "sería rápido meter...".

## Protocolo

1. **Cuantifica la propuesta primero.** Antes de decir sí o no, dale una talla
   (XS/S/M/L/XL). Lo que parece "rapidito" a menudo es una M cuando se piensa
   entero (validaciones, errores, estados, tests).

2. **Sitúa la propuesta:**
   - ¿Está dentro del objetivo del sprint actual?
   - ¿Está en el MVP definido en `design/mvp.md`?
   - ¿O es trabajo para un ciclo posterior?

3. **Si no encaja en el alcance actual, haz visible el trade.** El sprint está
   lleno. Meter algo nuevo significa una de tres: sacar otra cosa de tamaño
   parecido, extender el plazo, o posponer la propuesta. Presenta las tres
   opciones al arquitecto con su coste.

4. **La única excepción** es un incidente real en producción: entra sin discusión,
   pero igualmente se anota qué desplazó.

5. **Anota la decisión** en el archivo del sprint, para que la retrospectiva sea
   honesta.

## Siguiente paso

- Si la propuesta entra → se actualiza el sprint y se anota qué salió a cambio.
- Si se pospone → va al backlog con la razón, para no volver a discutirla.

## Heurística

- "Solo añade un pequeño X" — los pequeños X, sumados, son lo que mata los
  releases. Ninguno es gratis.
- Toda feature que se acepta es mantenimiento para siempre, no solo trabajo de
  hoy.

## Anti-patrones

- Aceptar trabajo nuevo sin cuantificarlo.
- Decir que sí sin hacer visible qué se desplaza.
- Tratar `/scope-check` como un "no" automático: el trabajo es mostrar el coste,
  no bloquear.

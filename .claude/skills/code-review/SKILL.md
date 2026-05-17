---
name: code-review
description: Revisa código de una feature o un archivo de forma rigurosa y útil. Identifica problemas por severidad y propone mejoras, sin aplicarlas sin permiso.
---

# /code-review

**Fase del workflow:** Building (paso 9, al terminar una feature).
**Agente que lo lleva:** `qa-lead` con los specialists del dominio.

Revisas código de forma rigurosa pero constructiva. El objetivo es detectar
problemas antes de que lleguen a producción, no acumular comentarios para
demostrar que has mirado.

## Protocolo

1. **Pregunta qué revisar.** Puede ser una feature completa recién terminada, un
   archivo, un módulo o una función concreta.

2. **Lee el código y su contexto:** los tests asociados, los archivos
   relacionados, el documento de diseño de la feature si existe en
   `docs/features/`.

3. **Reporta los hallazgos en orden de severidad:**
   - **Bloqueantes** — bugs, fallos de seguridad, código que rompe un contrato.
     No se da por buena la feature con esto.
   - **Importantes** — problemas de mantenibilidad, de rendimiento o de
     accesibilidad. Se corrigen pronto.
   - **Sugerencias** — estilo, claridad, nombres.

4. **Para cada hallazgo, di tres cosas:**
   - **Qué** está mal.
   - **Por qué** importa (la consecuencia concreta).
   - **Cómo** se corrige, con código si aplica.

5. **No apliques los cambios.** El skill reporta y espera la decisión del
   arquitecto.

## Siguiente paso

- Si hay hallazgos bloqueantes → se corrigen y se vuelve a revisar.
- Si la feature pasa la revisión → continúa con la siguiente feature del sprint.
- Cuando el sprint termina → `/retrospective`.

## Heurística

- Una revisión de código no es "encuentra fallos para que parezca que has
  revisado". Si el código está bien, dilo y para — no inventes problemas.
- Ataca el código, defiende a la persona. El tono es sobre el trabajo, nunca
  sobre quien lo hizo.

## Anti-patrones

- Inventar problemas para que la revisión "tenga sustancia".
- Mezclar las tres severidades sin distinguirlas: un problema de estilo y un bug
  de seguridad no pesan igual.
- Aplicar cambios sin aprobación.

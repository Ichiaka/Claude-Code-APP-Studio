---
name: bug-report
description: Genera un informe de bug estructurado y reproducible. Un bug bien documentado es la mitad de su solución.
---

# /bug-report

**Fase del workflow:** Building y Maintenance (cuando aparece un bug).
**Agente que lo lleva:** `qa-lead`.

Documentas un bug de forma estructurada y reproducible. Un bug que no se puede
reproducir no se puede arreglar con garantías; un informe claro es la mitad del
camino hacia la solución.

## Protocolo

1. **Reúne la información** con el arquitecto, rellenando la plantilla de abajo.
   Lo más importante son los **pasos para reproducir**: sin ellos, el bug es un
   rumor.

2. **Determina la severidad y la frecuencia.** La severidad orienta la prioridad;
   la frecuencia ("siempre" frente a "a veces") es una pista de la causa — un bug
   intermitente suele ser una condición de carrera.

3. **Genera el informe** en `docs/bugs/<id>-<slug>.md`.

## Plantilla

```
**Resumen**: una frase.

**Pasos para reproducir**:
1. ...
2. ...
3. ...

**Resultado esperado**: ...
**Resultado actual**: ...

**Entorno**:
- Plataforma: web / iOS / Android / desktop
- Versión de la app:
- SO / navegador:
- Dispositivo:

**Severidad**: crítica / alta / media / baja
**Frecuencia**: siempre / a veces / rara

**Notas adicionales**:
**Logs / capturas**:
```

## Output

`docs/bugs/<id>-<slug>.md` con el informe completo.

## Siguiente paso

- El bug se corrige siguiendo el workflow de `qa-lead`: primero un test que falla
  y captura el bug, luego el arreglo, y el test se queda como test de
  no-regresión.
- Si el bug es un incidente serio en producción → tras resolverlo, escribe un
  postmortem en `docs/postmortems/`.

## Anti-patrones

- Un informe sin pasos para reproducir: no es un bug report, es una queja.
- Arreglar un bug a ciegas sin haberlo reproducido antes.
- Marcar un bug intermitente como "cosas que pasan" en lugar de buscar la causa.

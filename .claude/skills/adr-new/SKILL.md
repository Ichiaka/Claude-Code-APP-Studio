---
name: adr-new
description: Crea un nuevo ADR (Architecture Decision Record) para registrar una decisión técnica, sus alternativas y sus consecuencias.
---

# /adr-new

**Fase del workflow:** cualquiera (cada vez que se toma una decisión técnica
relevante).
**Agente que lo lleva:** `docs-writer`, con `technical-director`.

Creas un ADR: el registro de una decisión técnica importante. Su mayor valor es
documentar las alternativas descartadas, para que dentro de unos meses nadie
tenga que re-litigar lo ya decidido.

## Cuándo crear un ADR

Cuando una decisión es cara de revertir o afecta a más de un área: el stack, la
estrategia de estado, la elección de backend, cómo se maneja el offline. Ante la
duda, créalo — un ADR de más cuesta cinco minutos.

## Protocolo

1. **Pide al arquitecto:**
   - Un título corto (5-10 palabras).
   - El contexto: qué problema o decisión nos enfrenta, qué fuerzas hay en juego.
   - Las opciones consideradas: mínimo dos, reales.
   - La opción elegida y la razón.
   - Las consecuencias: las positivas y las que asumimos como negativas.

2. **Determina el número correlativo** mirando el último ADR en `docs/adr/`.

3. **Crea el archivo** `docs/adr/NNNN-titulo-corto.md` desde la plantilla
   `.claude/templates/adr.md`.

4. **Muestra el borrador** y pide aprobación antes de escribirlo en firme.

## Output

`docs/adr/NNNN-titulo-corto.md`.

## Siguiente paso

El ADR queda como registro permanente. Si la decisión cambia cómo trabajan los
agentes, `technical-director` lo comunica a los leads afectados.

## Anti-patrones

- Un ADR con una sola opción: eso es una justificación, no un registro de
  decisión.
- Omitir las consecuencias negativas: toda decisión tiene un coste, y nombrarlo
  es parte del registro.
- No crear el ADR "porque la decisión es obvia": la obviedad se evapora en tres
  meses.

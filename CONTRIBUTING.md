# Contribuir a Claude Code App Studio

Gracias por querer aportar. Este documento explica cómo contribuir de forma que
encaje con la filosofía del proyecto y maximice las probabilidades de que tu PR
se acepte.

---

## Filosofía (léeme antes de codear)

Este template tiene tres principios no negociables. Si tu cambio los rompe, no
entrará por mucho que tenga sentido en otros contextos.

1. **El humano decide, los agentes proponen.** Nada de auto-piloto. Los agentes
   preguntan, presentan opciones, esperan aprobación. Si tu cambio mueve la línea
   hacia "Claude decide solo y avisa después", no encaja.

2. **Stack-agnóstico.** El núcleo no asume tecnología concreta. Si tu cambio mete
   `import React from "react"` o asume un build tool específico en agentes o
   skills del núcleo, sobra. Esas dependencias viven en tu proyecto, no en el
   template.

3. **Multiplataforma desde el día 1.** Las decisiones deben considerar web +
   móvil + desktop incluso cuando el MVP solo entregue uno. Cambios que asumen
   un único target del usuario rompen este principio.

---

## Antes de abrir un PR

### Para cambios pequeños (typo, fix de bug en un hook, mejora de un agente)
Adelante, abre PR directamente. Un commit por cambio lógico.

### Para cambios medianos (skill nuevo, regla nueva, mejoras a un paquete)
Abre primero una **discussion** en GitHub Discussions explicando:
- Qué problema resuelve.
- Por qué encaja con la filosofía.
- Si toca varios archivos, qué tocas exactamente.

Solo abre el PR cuando recibas señal verde.

### Para cambios grandes (jerarquía de agentes, paquete nuevo, estructura)
**Siempre** discusión previa. Cambios así reescriben la experiencia de quien
clona el template, así que necesitamos consenso antes de codear.

---

## Reglas de oro

### Una mejora por PR
No acoples cosas. "Añade skill X y arregla typo en agente Y" → dos PRs.

### Si tocas un agente, mantén la estructura
Todo agente tiene este frontmatter mínimo:

```yaml
---
name: <slug>
tier: 1 | 2 | 3
model: opus | sonnet | haiku
description: <una frase>
delegates_to: [...]   # tier 1 y 2
escalates_to: [...]
reports_to: <agente>  # tier 3
---
```

Y este esqueleto en el cuerpo:

```markdown
# <nombre>

<una frase de qué hace>

## Responsabilidades
## Lo que NO haces      (o "Cuándo intervienes" para tier 3)
## Protocolo
## Heurísticas
```

No es decorativo. Es lo que hace que Claude sepa cuándo invocarlo.

### Si tocas un skill, mantén el frontmatter

```yaml
---
name: <slug>
description: <una frase, lo que Claude leerá para decidir si activarlo>
---
```

El `description` es **lo más importante** del archivo. Si no es claro y específico,
Claude no lo activará cuando toque.

### Si tocas un hook, no lo desactives a la ligera
Los hooks del estudio cargan contexto, avisan de secretos en claro y dejan traza
de los subagentes. Si crees que uno se equivoca, abre un issue explicando el caso
de falso positivo en lugar de bajar el rigor.

### Si añades una regla, declara el path scope
Toda regla en `.claude/rules/` lleva frontmatter con los paths donde aplica:

```yaml
---
name: <slug>
paths: ["src/algo/**", "tests/algo/**"]
---
```

Reglas globales (`paths: ["**/*"]`) deben ser realmente globales. Si dudas, es local.

---

## Cómo añadir un paquete opcional nuevo

Mira `packages/i18n/` (el más simple) como referencia. Estructura mínima:

```
packages/<nombre>/
  README.md             # qué hace, cuándo activarlo, cómo activarlo
  agents/
    <agente>.md
  skills/
    <skill-1>/
      SKILL.md
    <skill-2>/
      SKILL.md
```

El `README.md` del paquete **debe incluir**:

- Cuándo activarlo (criterios concretos).
- Cuándo NO activarlo.
- Comandos `cp` exactos para activarlo.

Si tu paquete depende de credenciales o servicios de terceros, dilo en el
README. No los listes como obligatorios sin advertir.

---

## Estilo

### Markdown
- Tono directo. Sin marketing.
- Heurísticas, no eslóganes. Las heurísticas son frases que cierran un debate,
  no clichés.
- Listas cortas. Si una lista pasa de 7 items, replantéala.

### Bash (hooks, statusline)
- POSIX-friendly cuando puedas. Si necesitas bashismos, usa `#!/usr/bin/env bash`.
- `set -uo pipefail` al inicio.
- Manejo gracioso de herramientas que pueden faltar (`command -v ... >/dev/null 2>&1`).
- Compatibilidad macOS + Linux. Si usas `date`, prueba con ambas variantes.

### Comentarios
Comentarios explican el **por qué**, no el qué. El qué se ve en el código.

---

## Idioma

El template está principalmente en castellano. Si abres PR con material nuevo:

- Castellano para contenido del template (agentes, skills, rules, plantillas).
- Inglés para documentación que mira al exterior (README, este archivo, code of
  conduct) — actualmente el README está en castellano por decisión inicial, pero
  considera ofrecer ambas versiones si lo cambias.

Si solo hablas inglés, abre el PR igualmente. Lo traducimos.

---

## Tests

No hay tests automáticos del template todavía (los hooks tienen lógica trivial).
Si añades un hook o un script con lógica no trivial, considera añadir tests
manuales documentados al inicio del archivo:

```bash
# Test:
#   echo '{"model":...}' | ./mi-script.sh
```

---

## Licencia

Al contribuir, aceptas que tu aporte se distribuya bajo MIT (la licencia del
proyecto).

---

## Dudas

Abre una **discussion**, no un issue. Issues son para bugs y feature requests.
Discussions son para preguntas y propuestas.

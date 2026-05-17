# Personalizar el template

Este template es punto de partida, no jaula. Todo es modificable.

## Quitar agentes que no uses

¿No te interesa móvil? Borra `.claude/agents/specialists/mobile/` y
`.claude/agents/leads/mobile-lead.md`.

## Cambiar el tono de un agente

Cada agente vive en un solo archivo. Edítalo. Los cambios aplican en la próxima
sesión.

## Añadir reglas custom

Crea un archivo en `.claude/rules/NNN-mi-regla.md` con frontmatter declarando
los paths donde aplica.

## Cambiar la severidad de los hooks

Edita los `.sh` en `.claude/hooks/`. Devuelve exit code 0 para "todo OK",
distinto de 0 para "BLOQUEA".

## Añadir un paquete nuevo

Copia la estructura de `packages/i18n/` (es la más simple) y adapta.

## Compartir tu fork

Si mejoras el template, hazlo público. La comunidad lo agradece.

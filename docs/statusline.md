# Statusline

Claude Code App Studio incluye un statusline que se muestra debajo del prompt de
Claude Code en la terminal. Tres bloques:

```
[Modelo] · ctx:42% · stage:building
```

## Bloques

### Modelo
El modelo activo de Claude (Opus, Sonnet, Haiku) tal como lo reporta Claude Code.

### Contexto (`ctx:NN%`)
Porcentaje de ventana de contexto consumida en la sesión actual. Color según
gravedad:

- **Verde** (`< 60%`): tranquilo.
- **Amarillo** (`60–79%`): vigílalo.
- **Rojo** (`≥ 80%`): considera cerrar y abrir una sesión nueva con el contexto
  imprescindible.

### Stage (`stage:nombre`)
La fase actual del proyecto, auto-detectada a partir de los artefactos que
existen en el proyecto:

| Stage | Cuándo se detecta |
|-------|-------------------|
| `prototype`   | Existe `production/prototype.md` y aún no se ha consolidado. El proyecto trabaja en modo prototipo. |
| `discovery`   | No hay `docs/adr/0001-stack.md` todavía. Estás explorando idea/MVP/stack. |
| `design`      | Existe el ADR de stack pero aún no hay features diseñadas. |
| `building`    | Existen features en `docs/features/` o sprints en `production/sprints/`. |
| `release`     | El `CHANGELOG.md` tiene una versión publicada (`X.Y.Z`) de los últimos 14 días. |
| `maintenance` | El `CHANGELOG.md` tiene una versión publicada con más de 14 días. |

El stage `prototype` corresponde al modo prototipo; los otros cinco, a las fases
del modo completo (ver `docs/workflow.md`).

> **Nota:** el `CHANGELOG.md` del template viene vacío a propósito (solo la
> plantilla y la sección "Sin liberar"). La detección de `release`/`maintenance`
> solo se activa cuando hay una versión publicada de verdad (`X.Y.Z` con fecha),
> así que un proyecto recién creado nunca se detecta como `release` por error.

## Override manual del stage

Si la detección automática no se ajusta a lo que estás haciendo, crea el archivo
`production/stage.txt` con el nombre del stage que quieras forzar:

```bash
echo "release" > production/stage.txt
```

El valor del archivo tiene prioridad sobre la auto-detección. Para volver al modo
automático, borra el archivo.

## Cambiar el formato

El script es `.claude/statusline.sh` — bash puro. Edítalo a tu gusto. Patrones
útiles:

- Quitar colores: borra las variables `*_COLOR` y `RESET` del `printf` final.
- Añadir coste de sesión: el JSON de entrada trae `cost.total_cost_usd`.
- Añadir el directorio actual: el JSON trae `workspace.current_dir`.

El JSON completo que Claude Code envía por stdin está documentado en la
[doc oficial de statusline](https://docs.claude.com/en/docs/claude-code/statusline).

## Requisitos

- **bash** (todos los sistemas Unix lo tienen; en Windows, mediante WSL).
- **jq** (recomendado). Sin él, el script usa un fallback con `grep` menos
  robusto. Instálalo:
  - macOS: `brew install jq`
  - Linux: `apt install jq` / `dnf install jq`

## Desactivar el statusline

Edita `.claude/settings.json` y borra el bloque `statusLine`. Reinicia Claude
Code.

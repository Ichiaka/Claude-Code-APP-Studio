# Quick start

## 1. Obtener el template

Descarga o copia este template a la carpeta de tu proyecto:

```bash
# por ejemplo, clonándolo:
git clone https://github.com/Ichiaka/Claude-Code-APP-Studio.git mi-app
cd mi-app
claude    # abre Claude Code
```

El estudio no depende de git: usa el control de versiones que prefieras, o
ninguno. Si vas a usar git en tu app, hazlo con normalidad — el estudio no
interfiere con ello ni lo gestiona por ti.

## 2. Primer comando

```
/start
```

Te preguntará dónde estás (idea vaga, concepto claro, código existente) y te
guiará al skill adecuado.

## 3. El workflow completo

El recorrido de principio a fin —de la idea a una app publicada y mantenida—
está descrito en detalle en **`docs/workflow.md`**. En resumen, las cinco fases:

1. **Discovery** — `/brainstorm-app`, `/define-mvp`.
2. **Design** — `/choose-stack`, `/package-add`, `/architect-feature`.
3. **Building** — `/sprint-plan`, `/scaffold-feature`, implementación,
   `/code-review`, `/retrospective`.
4. **Release** — `/security-review`, `/release-checklist`, `/changelog`.
5. **Maintenance** — corrección de bugs y nuevos ciclos de mejora.

## 4. Activar un paquete opcional

Si la app necesita backend, pagos, push, multi-idioma o analítica, ejecuta:

```
/package-add
```

Te guiará en la activación. También puedes leer `packages/<nombre>/README.md`.

## 5. Añadir tu propio agente

Crea un archivo en `.claude/agents/specialists/<area>/<nombre>.md` siguiendo la
estructura de los agentes existentes: frontmatter (name, tier, model,
description, reports_to/delegates_to), identidad, responsabilidades, lo que no
hace, workflows, criterios de decisión, ejemplo de interacción, heurísticas y
handoff.

## 6. Añadir tu propio skill

Crea un directorio en `.claude/skills/<nombre>/` con un `SKILL.md` dentro,
siguiendo la estructura de los skills existentes (incluida la sección "Siguiente
paso", que mantiene claro el encadenamiento del workflow).

# Quick start

## 1. Obtener el template

Descarga o copia este template a la carpeta de tu proyecto:

```bash
# por ejemplo, clonándolo:
git clone https://github.com/Ichiaka/claude-code-app-studio.git mi-app
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

Te ayudará a elegir el modo de trabajo y te situará en el paso adecuado.

## 3. Los dos modos de trabajo

El estudio tiene dos modos, y eliges según el proyecto:

**Modo prototipo** — el camino rápido. Se arranca con `/prototype`: el primer
entregable es una app que funciona, y se itera sobre ella (miras, pides un
cambio, se aplica, repites). Sin fases ni ceremonia. Para prototipos, apps
pequeñas o validar una idea cuanto antes.

**Modo completo** — el camino con proceso, en cinco fases:

1. **Discovery** — `/brainstorm-app`, `/define-mvp`.
2. **Design** — `/choose-stack`, `/package-add`, `/architect-feature`.
3. **Building** — `/sprint-plan`, `/scaffold-feature`, implementación,
   `/code-review`, `/retrospective`.
4. **Release** — `/security-review`, `/release-checklist`, `/changelog`.
5. **Maintenance** — corrección de bugs y nuevos ciclos de mejora.

Un prototipo puede pasar al modo completo con `/consolidate` cuando decidas que
el proyecto va en serio. El recorrido detallado de ambos modos está en
**`docs/workflow.md`**.

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

# Paquete: ai-features

Actívalo si tu app **incluye IA como parte de su producto final** — chatbots,
asistentes, sugerencias, resúmenes, búsqueda semántica, generación de texto o
imágenes.

> **Aclaración importante:** Claude Code (el estudio) ya usa IA para *programar*
> tu app. Este paquete es para la IA que tus usuarios usarán **dentro de la
> app**, no para el desarrollo. Son contextos distintos.

Aporta el agente `ai-features-engineer` y el skill `ai-feature-design`.

## Agnóstico de proveedor

El paquete cubre cualquier proveedor de IA: **Anthropic (Claude)**, **OpenAI**,
**Google Gemini**, **modelos locales** (Ollama, llama.cpp) u otros. La elección
se hace por feature, se documenta en un ADR y se aísla detrás de una abstracción
interna — si mañana cambias de proveedor, cambias una capa, no toda la app.

Anthropic suele ser una buena opción por defecto para muchos casos (razonamiento
fuerte, instrucciones precisas, controles de seguridad), pero no es la única que
soporta el paquete.

## Lo que el paquete vigila

- **Costes** — calcula el coste real por usuario antes de que llegue la factura
  sorpresa.
- **Latencia** — qué pasa cuando el modelo tarda, qué se le enseña al usuario.
- **Modos de fallo** — sin red, rate limit, respuestas inválidas, contenido
  inapropiado, prompt injection. No son raros, son normales.
- **Privacidad** — los datos personales no viajan al proveedor sin pensarlo;
  revisado con `security-privacy-lead`.
- **Seguridad** — las claves de API **nunca** en el cliente.

## Activación

La forma recomendada es el skill `/package-add ai-features`. Activación manual
equivalente:

```bash
mkdir -p .claude/agents/specialists/packages
cp packages/ai-features/agents/ai-features-engineer.md .claude/agents/specialists/packages/
cp -r packages/ai-features/skills/* .claude/skills/
```

Después, ejecuta `/ai-feature-design` para diseñar la primera feature de IA del
producto.

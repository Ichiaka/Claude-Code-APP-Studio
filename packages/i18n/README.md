# Paquete: i18n

Actívalo si la app debe soportar varios idiomas.

Aporta el agente `i18n-engineer` y los skills `i18n-setup` y `extract-strings`.

> Conviene activarlo pronto: la *arquitectura* de internacionalización (textos
> fuera del código, sin concatenaciones, formatos por locale) es barata al
> principio y cara de introducir después. Traducir a idiomas concretos sí se
> puede aplazar.

## Activación

La forma recomendada es el skill `/package-add i18n`. Activación manual
equivalente:

```bash
mkdir -p .claude/agents/specialists/packages
cp packages/i18n/agents/i18n-engineer.md .claude/agents/specialists/packages/
cp -r packages/i18n/skills/* .claude/skills/
```

Después, ejecuta `/i18n-setup` para montar la arquitectura de i18n.

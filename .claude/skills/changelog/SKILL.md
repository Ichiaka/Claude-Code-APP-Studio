---
name: changelog
description: Actualiza el registro de cambios (CHANGELOG.md) con lo que cambia en el próximo release, escrito en lenguaje de usuario. Sigue el formato Keep a Changelog.
---

# /changelog

**Fase del workflow:** Release (paso 14).
**Agente que lo lleva:** `release-engineer`.

Actualizas el `CHANGELOG.md` con los cambios de la versión que se va a publicar.
El registro de cambios se escribe para quien **usa** la app, no para quien la
programa.

## Protocolo

1. **Repasa qué se ha hecho desde el último release.** Las fuentes son el trabajo
   de los sprints (`production/sprints/`), las features completadas
   (`docs/features/`) y los bugs corregidos (`docs/bugs/`). No necesitas el
   histórico de control de versiones: el estudio ya deja registro de lo hecho en
   esos archivos.

2. **Agrupa los cambios** en las categorías de Keep a Changelog: **Added**
   (nuevo), **Changed** (cambios de comportamiento), **Fixed** (correcciones),
   **Removed** (lo retirado), **Security** (arreglos de seguridad), **Deprecated**
   (lo que se marcará para retirar).

3. **Filtra lo que no percibe el usuario.** Refactors, cambios internos de
   herramientas, ajustes de tests — fuera. Entra solo lo que un usuario notaría.

4. **Reescribe cada entrada en lenguaje de usuario.** Mal: "refactor del store de
   sync". Bien: "Las notas ahora se sincronizan más rápido al recuperar la
   conexión".

5. **Muestra el borrador** y pide aprobación antes de escribir el archivo.

## Formato

```
## [1.2.0] — 2026-05-15

### Added
- Sincronización offline en el módulo de notas.

### Fixed
- Se corrige un cierre inesperado al abrir la app sin conexión por primera vez.
```

## Output

`CHANGELOG.md` actualizado: la sección "sin liberar" se convierte en la versión
con su número y fecha.

## Siguiente paso

Con el registro de cambios escrito, `release-engineer` marca la versión, genera
los artefactos firmados y completa la publicación. En móvil, las notas de versión
de este changelog alimentan los textos de cada tienda.

## Anti-patrones

- Escribir el changelog en lenguaje de developer en vez de de usuario.
- Incluir cambios internos que al usuario no le dicen nada.
- Escribir el changelog después de publicar: los detalles ya se han evaporado.

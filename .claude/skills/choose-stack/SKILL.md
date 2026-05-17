---
name: choose-stack
description: Decide la tecnología del proyecto según targets y restricciones. Genera el ADR-0001 con la decisión. Primer paso de la fase de diseño y requisito para construir.
---

# /choose-stack

**Fase del workflow:** Design (paso 3).
**Agente que lo lleva:** `technical-director`.

Eliges, con el arquitecto, qué tecnologías se usan para construir la app. Es una
de las decisiones más caras de revertir del proyecto, así que se toma con
cuidado y se documenta. Nada se construye sin este paso completado.

## Protocolo

1. **Pregunta por los targets:**
   - ¿Qué plataformas hay que soportar en el lanzamiento? (web, móvil iOS, móvil
     Android, desktop Windows/macOS/Linux)
   - ¿Cuáles son "deseables" para más adelante?

2. **Pregunta por las restricciones:**
   - Es un equipo de una persona. ¿Cuánta superficie tecnológica puedes mantener
     de forma realista?
   - ¿Necesita rendimiento nativo extremo (juegos, vídeo pesado)?
   - ¿Necesita APIs nativas concretas que la web no ofrece?
   - ¿Tiene que funcionar offline?
   - ¿Hay restricciones de empresa o de cliente?

3. **Presenta 2-3 stacks candidatos.** Para cada uno:
   - El stack concreto: lenguajes, frameworks, herramientas.
   - Qué targets cubre y cómo.
   - Sus fortalezas para *este* proyecto.
   - Sus limitaciones y los workarounds.
   - La curva de aprendizaje estimada.

   Stacks típicos a considerar (orientativo, no exhaustivo):
   - **PWA + Capacitor + Tauri** — TS con React/Vue/Svelte. Una base de código
     para todos los targets. Pragmático para un desarrollador en solitario.
   - **React Native + Expo + RN Web** — mejor móvil real, web aceptable, desktop
     más débil.
   - **Flutter** — una base para todos los targets, en Dart. UI muy consistente;
     ecosistema web/desktop algo menos maduro.
   - **Nativo por plataforma + web aparte** — máxima calidad por plataforma,
     máximo coste de construcción y mantenimiento.

4. **El arquitecto decide.** Genera el ADR-0001 con la decisión, las
   alternativas descartadas y la razón de cada descarte.

## Output

`docs/adr/0001-stack.md`, siguiendo la plantilla `.claude/templates/adr.md`.

## Siguiente paso

Con el stack decidido:
- Si la app necesita backend, pagos, push, multi-idioma o analítica → activa los
  paquetes con `/package-add`.
- Después, diseña cada feature grande del MVP con `/architect-feature`.

Indica al arquitecto ambos pasos.

## Anti-patrones

- Elegir el stack "más popular" sin contrastarlo con los targets y restricciones
  reales del proyecto.
- Elegir un stack que el arquitecto no puede mantener en solitario.
- No registrar el ADR, o registrarlo sin las alternativas descartadas.

# Preferencias del proyecto

Este archivo declara tus preferencias persistentes para que el estudio no te
pregunte una y otra vez lo mismo. Lo cargan los agentes al iniciar cada sesión.

**Cómo funciona:** rellena solo lo que quieras imponer. Lo que dejes vacío o
comentado, el estudio lo pregunta como siempre. Lo que rellenes, lo da por
supuesto.

> Las preferencias **no anulan** la regla central del estudio: los agentes
> proponen, tú decides. Cuando una decisión es seria (un cambio de arquitectura,
> un release), el estudio te seguirá consultando aunque tengas preferencias
> declaradas. Estas son atajos para lo cotidiano, no un piloto automático.

---

## Tono y comunicación

- **Idioma de trabajo:** [español / english / catalán / etc.]
- **Tratamiento:** [tú / usted / "como prefieras"]
- **Formalidad:** [directo / formal / coloquial]
- **Longitud de respuestas por defecto:** [breve / equilibrada / detallada]

## Stack y arquitectura

> Estas preferencias se usan **como recomendación por defecto** cuando el modo
> prototipo elige stack rápidamente, o como guía en `/choose-stack`. Siempre
> puedes cambiarlas en un proyecto concreto.

- **Stack favorito:** [PWA+Capacitor+Tauri / RN+Expo / Flutter / nativo / —]
- **Framework de UI preferido:** [React / Vue / Svelte / Solid / —]
- **Lenguaje:** [TypeScript / JavaScript / Dart / Swift+Kotlin / —]
- **Gestor de paquetes:** [npm / yarn / pnpm / bun / —]
- **Style preferido:** [Tailwind / CSS Modules / styled-components / vanilla / —]

## Backend

- **Modo de backend preferido:** [BaaS / custom / sin backend / —]
- **BaaS favorito (si aplica):** [Supabase / Firebase / Appwrite / Convex / —]
- **Si custom — lenguaje/framework:** [Node+Hono / Bun+Elysia / Python+FastAPI / Go / —]

## Paquetes a activar por defecto

Si arrancas casi siempre con los mismos paquetes, márcalos aquí.

- [ ] backend-baas
- [ ] backend-custom
- [ ] payments
- [ ] push
- [ ] i18n
- [ ] analytics
- [ ] ai-features

(Marcar uno NO lo activa solo — el estudio te lo sugerirá en `/start` para que
confirmes con un sí rápido.)

## Convenciones de código

- **Estilo de nombrado:** [camelCase / kebab-case / snake_case según el caso]
- **Estructura de carpetas preferida:** [feature-folder / por capas / —]
- **Tests:** [framework preferido — vitest / jest / playwright / —]

## Automatización (avanzado, opt-in)

Por defecto el estudio **detecta y avisa**, no ejecuta sin permiso. Si quieres
que ejecute automáticamente ciertas acciones rutinarias, marca:

- [ ] **auto_install_deps** — al detectar dependencias sin instalar, ejecutar
      el install sin preguntar. Cómodo pero puede tardar en proyectos grandes.
- [ ] **auto_load_env** — cargar `.env.local` automáticamente al iniciar
      sesión (sin avisar si lo hace; sí avisa si falta).
- [ ] **auto_start_dev_server** — arrancar el servidor de desarrollo en
      segundo plano al iniciar sesión. Útil si siempre lo lanzas; molesto si
      ya lo tienes corriendo.

Desactivado por defecto. Activa solo las que te encajen con tu forma de
trabajar.

## Otras preferencias

[Cualquier otra cosa que el estudio deba saber siempre — convenciones, tabúes,
"nunca uses X", "siempre incluye Y", etc.]

-
-
-

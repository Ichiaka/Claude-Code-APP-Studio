# Glosario

Términos que se repiten en los agentes, skills y documentación del estudio.
Definidos aquí una vez para que signifiquen lo mismo en todas partes.

## Roles y estructura

**Arquitecto** — la persona humana que dirige el estudio. Toma todas las
decisiones de producto y técnicas. Los agentes proponen; el arquitecto dispone.

**Tier 1 / Directores** — los tres agentes de mayor nivel (product-director,
technical-director, delivery-manager). Deciden visión, arquitectura global y
entrega.

**Tier 2 / Leads** — los responsables de cada área (ux, frontend, mobile,
desktop, qa, devops, security, y backend si hay paquete). Dirigen a los
specialists de su dominio.

**Tier 3 / Specialists** — los agentes que hacen el trabajo concreto de un
dominio acotado.

**Paquete** — un módulo opcional del estudio que añade agentes y skills para una
capacidad concreta (backend, pagos, push, i18n, analítica). Se activa con
`/package-add`.

**Handoff** — el traspaso de trabajo de un agente a otro: qué se entrega, a quién
y en qué archivo.

## Producto y proceso

**PRD** (Product Requirements Document) — el documento que define una feature:
problema, usuario, solución, criterios de aceptación, métrica de éxito y qué
queda fuera de alcance.

**MVP** (Minimum Viable Product) — la versión mínima del producto que permite
validar su hipótesis central. Si el producto puede validar esa hipótesis sin una
feature, esa feature no es del MVP.

**Criterio de aceptación** — una condición verificable, sin interpretación, que
debe cumplirse para dar una feature por terminada. Si QA no puede escribir un
test de él, está mal redactado.

**Arquetipo de usuario** — una descripción concreta de un tipo de usuario. No se
diseña para "todos"; se diseña para un arquetipo nombrado.

**Scope creep** — el crecimiento no controlado del alcance. Se combate haciendo
visible el coste de oportunidad de cada añadido.

**Talla de camiseta** — la unidad de estimación del estudio (XS, S, M, L, XL).
Se prefiere a las horas porque no finge una precisión que no existe.

## Arquitectura

**ADR** (Architecture Decision Record) — el registro de una decisión técnica:
contexto, opciones consideradas, opción elegida, razón y consecuencias. Su valor
está en documentar las alternativas descartadas. Se crea con `/adr-new`.

**Stack-agnóstico** — el estudio no presupone tecnologías. El stack lo decide el
arquitecto por proyecto con `/choose-stack`, y queda registrado en
`docs/adr/0001-stack.md`.

**Capa de plataforma** — la parte del código que adapta las APIs específicas de
cada sistema (web, móvil, desktop) a una interfaz común. La lógica de negocio no
debe saber en qué plataforma corre.

**Contrato de datos / de API** — la definición acordada de qué recibe y devuelve
una pieza (un módulo, un endpoint). Permite construir las dos partes en paralelo.

**YAGNI** ("You Aren't Gonna Need It") — no construir para necesidades futuras
imaginadas. El estudio prefiere YAGNI antes que abstraer de forma prematura.

## Estado (frontend)

**UI state** — estado efímero y local a una interacción (un modal abierto, una
pestaña activa). Vive en el componente.

**Server state** — datos que son propiedad del backend y el cliente solo cachea
(lista de productos, perfil). Se gestiona con una librería de cache de datos.

**Domain state** — estado de cliente que es propio, persiste y se comparte
(preferencias, carrito offline). Vive en un store dedicado con persistencia.

**Estado derivado** — un valor que se puede calcular a partir de otro (el total
de un carrito). No se guarda: se calcula con un selector.

## PWA y offline

**PWA** (Progressive Web App) — una app web que puede instalarse y funcionar
offline, comportándose como una app nativa.

**Service worker** — un proxy entre la app y la red que permite cachear recursos
y funcionar sin conexión. Es el corazón de una PWA.

**Optimistic UI** — patrón en el que la interfaz responde de inmediato como si una
operación hubiera tenido éxito, y la sincronización real ocurre después.

**Cola de operaciones pendientes** — la lista persistida de acciones que el
usuario hizo offline y que se sincronizarán cuando vuelva la red.

**Manifest** — el archivo que define cómo se instala y presenta una PWA (nombre,
iconos, colores, modo de visualización).

**Icono maskable** — una variante del icono de app con un margen de seguridad,
para que el sistema operativo pueda recortarlo en distintas formas sin cortar
contenido.

## Calidad y seguridad

**Pirámide de pruebas** — la proporción recomendada de tests: muchos unitarios,
algunos de integración, pocos e2e.

**Test e2e** (end-to-end) — un test que recorre un flujo completo de usuario
integrando todas las piezas. Caro y más frágil; se reserva para flujos críticos.

**Gate de calidad** — el conjunto de condiciones que se exigen antes de dar una
feature por terminada o antes de liberar. QA tiene autoridad para bloquear un
release que no lo pase.

**Flaky test** — un test que falla de forma intermitente sin que haya un bug
real. Erosiona la confianza en la suite; se arregla o se borra.

**Threat modeling** — el ejercicio de mapear, para una feature, qué puede salir
mal en seguridad y cómo se mitiga.

**STRIDE** — un marco para el threat modeling: Spoofing (suplantación), Tampering
(manipulación), Repudiation (repudio), Information disclosure (divulgación),
Denial of service (denegación de servicio), Elevation of privilege (elevación de
privilegios).

**Idempotencia** — la propiedad de una operación que, ejecutada varias veces,
produce el mismo resultado que ejecutada una vez. Clave en webhooks y colas de
sincronización.

## Release y operación

**SemVer** (Semantic Versioning) — el esquema de versiones MAJOR.MINOR.PATCH:
major rompe compatibilidad, minor añade funcionalidad compatible, patch solo
corrige.

**Rollback** — volver a la versión anterior tras un release fallido. El estudio
exige poder hacerlo en menos de cinco minutos.

**Rollout gradual / canary** — liberar un cambio a un porcentaje de usuarios
primero y ampliar si las métricas aguantan.

**Smoke test** — un puñado de comprobaciones rápidas, tras un despliegue, que
confirman que lo esencial funciona.

**Runbook** — un documento con los pasos a seguir cuando algo concreto falla en
producción.

**Postmortem** — el análisis, tras un incidente, de qué pasó y qué se aprende —
sin buscar culpables.

## Backend

**BaaS** (Backend-as-a-Service) — un backend gestionado por un tercero (Supabase,
Firebase, Appwrite…). El estudio lo soporta con el paquete `backend-baas`.

**Reglas de seguridad** — en un BaaS, la configuración que determina qué puede
leer y escribir cada usuario. Sin ellas, la base de datos es pública.

**Migración** — un cambio de esquema de base de datos, escrito como código
versionado y, siempre que se pueda, reversible.

**Webhook** — una llamada que un servicio externo hace a tu servidor para
notificar un evento (p. ej. un pago completado). En pagos, es la fuente de verdad,
no el cliente.

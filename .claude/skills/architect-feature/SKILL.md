---
name: architect-feature
description: Diseña una feature concreta antes de implementarla — capas, contratos de datos, estados, plan de tests. Se ejecuta una vez por feature en la fase de diseño.
---

# /architect-feature

**Fase del workflow:** Design (paso 5).
**Agente que lo lleva:** `architect`.

Diseñas una feature en detalle **antes** de que se escriba una sola línea de
código. El entregable es un documento, no código: el plano que después seguirán
los specialists para implementar.

## Requisito previo

El stack debe estar decidido (`docs/adr/0001-stack.md` existe). Si no, ejecuta
antes `/choose-stack`.

## Protocolo

1. **Pide al arquitecto:**
   - El nombre y el propósito de la feature, en una frase.
   - El usuario objetivo y un caso de uso concreto.
   - Los criterios de aceptación: cuándo se considera terminada.

2. **Invoca al agente `architect`**, que diseña la feature.

3. **Produce el documento de diseño** en `docs/features/<nombre>.md`, con:
   - Resumen en una frase.
   - Contrato de datos (los tipos de lo que entra y sale).
   - Capas afectadas (UI, lógica de negocio, almacenamiento, plataforma).
   - Side effects (red, disco, notificaciones, telemetría).
   - Estados: vacío, cargando, error, éxito, y los edge cases.
   - Reparto multiplataforma: qué código es compartido y qué específico.
   - Plan de tests.
   - Decisiones tomadas y alternativas descartadas.

4. **No se escribe código en este skill.** Es exclusivamente diseño. Si hay
   varios enfoques posibles, el `architect` los presenta y el arquitecto elige.

## Siguiente paso

Repite `/architect-feature` por cada feature grande del MVP. Cuando todas estén
diseñadas, el proyecto pasa a la fase de **construcción**: el siguiente skill es
`/sprint-plan` para planificar el primer sprint. Indícaselo al arquitecto.

(Para una feature ya diseñada, `/scaffold-feature` genera su esqueleto de
archivos — pero eso ya es trabajo de la fase de building, dentro de un sprint.)

## Anti-patrones

- Escribir código en lugar de diseño: este skill produce un plano, no
  implementación.
- Diseñar una feature sin sus criterios de aceptación.
- Diseñar solo el camino feliz e ignorar los estados de error, vacío y offline,
  que son la mayor parte del trabajo real.

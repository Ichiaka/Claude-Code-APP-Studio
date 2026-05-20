# Protocolo de respuesta a incidentes — [NOMBRE DE LA APP]

**Última actualización:** [FECHA]

Este documento describe qué hacer cuando algo se cae o falla en producción. La
idea: no improvisar bajo presión. Cuando hay un incidente, hay un guion.

> Este protocolo está pensado para un arquitecto en solitario. Si en algún
> momento hay equipo, las responsabilidades se reparten — pero el guion sigue
> sirviendo.

---

## 1. Cómo se detecta un incidente

Hay tres vías típicas:

1. **Alertas automáticas** — del sistema de monitorización
   ([PROVEEDOR, ej. Sentry, Datadog, UptimeRobot]).
2. **Reportes de usuarios** — vía email, formulario de soporte, redes sociales.
3. **Detección propia** — al revisar la app, las métricas o los logs.

Las tres son válidas. No esperes solo a las alertas automáticas — las cosas más
sutiles las suele detectar antes un usuario.

---

## 2. Clasificación de severidad

Decide la severidad en los primeros minutos. Determina la prioridad y la
comunicación.

| Severidad | Descripción | Ejemplo | Respuesta |
|-----------|-------------|---------|-----------|
| **SEV-1 — Crítico** | La app no funciona para la mayoría de usuarios, o hay un riesgo de seguridad o datos. | Login no funciona. Datos personales filtrados. | Atender ya, comunicar pronto |
| **SEV-2 — Alto** | Una función principal falla, o solo afecta a una plataforma. | Pagos rotos en web (móvil sí funciona). Push no llegan. | Atender en horas |
| **SEV-3 — Medio** | Una función secundaria falla, o el problema es intermitente. | Una pantalla muestra error a veces. | Atender en el día / siguiente sprint |
| **SEV-4 — Bajo** | Cosmético o muy localizado. | Un texto mal traducido. Un icono que no carga. | Backlog normal |

---

## 3. Protocolo paso a paso (SEV-1 y SEV-2)

### Paso 1 — Confirmar (los primeros 5 minutos)

- [ ] ¿Pasa de verdad? Reprodúcelo si puedes.
- [ ] ¿A cuántos usuarios afecta? (uno, una región, todos)
- [ ] ¿Qué plataformas afecta? (web, iOS, Android, desktop)
- [ ] ¿Cuándo empezó? Mira el último cambio o release reciente.

### Paso 2 — Mitigar (los siguientes 30 minutos)

El objetivo NO es arreglarlo del todo — es **detener el daño**. Por orden de
preferencia:

1. **Rollback al último release estable** si el incidente empezó tras un
   release reciente. Es lo más rápido y suele resolver.
2. **Feature flag off** si la feature problemática está detrás de uno.
3. **Mantenimiento temporal** si nada más sirve: mostrar un mensaje "la app está
   en mantenimiento, vuelve en X minutos". Es peor para el usuario, pero mejor
   que datos corruptos.

### Paso 3 — Comunicar

Si SEV-1 o SEV-2 con muchos usuarios afectados:

- [ ] **Avisar en la app o en la web** con un banner: "Estamos teniendo un
      problema con X, estamos en ello".
- [ ] **Publicar en el canal habitual** (status page, Twitter, Discord, lo que
      uses).
- [ ] **Responder a los usuarios** que ya hayan escrito, aunque sea un mensaje
      corto.

Una comunicación temprana **siempre** vale más que una explicación tardía. Lo
peor para un usuario es no saber si la app está rota o es su conexión.

### Paso 4 — Arreglar

Una vez mitigado, ya no hay urgencia. Diagnostica la causa con calma y aplica el
arreglo definitivo. Antes de subirlo:

- [ ] Test que reproduce el bug (rojo).
- [ ] Test pasa con el arreglo (verde).
- [ ] Smoke test del flujo afectado.
- [ ] Rollback documentado por si acaso.

### Paso 5 — Comunicar la resolución

- [ ] Quitar el banner de incidente.
- [ ] Publicar resolución en el canal donde se avisó.
- [ ] Responder a los usuarios afectados.

---

## 4. Después del incidente — Postmortem

Para todo SEV-1 y SEV-2, escribir un postmortem **en las 48h siguientes**, en
`docs/postmortems/YYYY-MM-DD-resumen.md`. Estructura mínima:

```
# Incidente del [FECHA] — [resumen]

## Línea de tiempo
- HH:MM — Cómo se detectó
- HH:MM — Confirmación
- HH:MM — Mitigación aplicada
- HH:MM — Resolución
- HH:MM — Comunicación final

## Impacto
- N usuarios afectados, durante N minutos
- Plataformas: web/iOS/Android/desktop
- Qué dejaron de poder hacer

## Causa raíz
Qué pasó, en términos técnicos y honestos. No buscamos culpable; buscamos causa.

## Qué ayudó
Lo que aceleró la detección o la resolución.

## Qué frenó
Lo que costó más de lo esperado.

## Acciones de seguimiento
- [ ] Acción concreta 1 (responsable, fecha)
- [ ] Acción concreta 2
```

---

## 5. Contactos clave

Ten a mano antes de necesitarlos:

| Servicio | Cómo contactar | Notas |
|----------|---------------|-------|
| Proveedor de hosting | [PANEL / SOPORTE] | [Nivel de SLA] |
| Proveedor de BaaS / DB | [PANEL / SOPORTE] | |
| Proveedor de pago | [PANEL / SOPORTE] | Para incidencias de cobros |
| Email transaccional | [PANEL / SOPORTE] | |
| Dominio / DNS | [REGISTRAR] | Para cambios urgentes |
| App Store Connect | [URL] | Para rechazos urgentes |
| Google Play Console | [URL] | |
| Autoridad de protección de datos | [si hay brecha de seguridad de datos] |

---

## 6. Cosas que NO hacer durante un incidente

- **No reescribir bajo presión.** El arreglo definitivo se hace en frío.
- **No probar en producción.** Mitiga primero (rollback o feature flag), repara
  fuera.
- **No prometer plazos que no puedes cumplir.** "Estamos en ello, actualizamos
  en 15 minutos" vale más que "lo arreglamos en 5".
- **No esconder el incidente.** Los usuarios prefieren transparencia a silencio.

---

## Lista de comprobación de preparación (antes de tener un incidente)

- [ ] Sé hacer rollback al release anterior y lo he probado al menos una vez.
- [ ] Tengo monitorización de uptime con alertas.
- [ ] Tengo crash reporting configurado (mobile, desktop).
- [ ] Tengo un canal claro donde comunicar incidentes a los usuarios.
- [ ] Los contactos clave de la sección 5 están actualizados.
- [ ] Las copias de seguridad funcionan **y se han restaurado al menos una vez**.
- [ ] Sé cómo poner la app en modo mantenimiento.

# Checklist de onboarding del proyecto

**Proyecto:** [NOMBRE DE LA APP]

Lista de cosas que hay que configurar **una vez** al arrancar el proyecto. Una
mañana tediosa, pero te ahorra muchas sorpresas el día del primer release.

> Marca lo que vayas haciendo. Lo que no aplique a tu proyecto, márcalo como
> "N/A" en lugar de saltártelo, así sabrás que lo consideraste.

---

## 1. Lo básico del proyecto

- [ ] El template está obtenido y la estructura visible.
- [ ] `LICENSE` rellenado con tu nombre / usuario.
- [ ] `README.md` adaptado: nombre del proyecto, descripción, no el del template.
- [ ] El nombre del proyecto definido y reservado donde aplique (dominio, redes
      sociales).
- [ ] `/start` ejecutado al menos una vez para situarte.

## 2. Stack y arquitectura

- [ ] `/choose-stack` ejecutado y `docs/adr/0001-stack.md` registrado.
- [ ] Los paquetes opcionales que necesite el proyecto, activados con
      `/package-add` (backend, pagos, push, i18n, analytics, ai-features).
- [ ] El proyecto arranca en local y muestra "hola mundo" o equivalente.

## 3. Control de versiones (si lo usas)

- [ ] Repositorio creado donde corresponda (GitHub, GitLab, propio).
- [ ] `.gitignore` adaptado al stack (no se versionan binarios, archivos de
      entorno locales, `node_modules`, etc.).
- [ ] Branch principal protegida si el proyecto lo merece.

## 4. Variables de entorno y secretos

- [ ] `.env.example` creado con las claves que el proyecto necesita (sin valores
      reales).
- [ ] `.env.local` (con valores reales) **fuera del control de versiones**.
- [ ] Gestor de secretos elegido para producción ([cuál]).
- [ ] Ninguna clave en el código fuente, ni en el cliente.

## 5. Cuentas de desarrollo (si la app es móvil)

### Apple
- [ ] Apple Developer Program contratado (99 USD/año).
- [ ] App ID y bundle identifier registrados.
- [ ] Certificado de distribución generado.
- [ ] Provisioning profile creado.
- [ ] App Store Connect: app creada (aunque sea borrador).
- [ ] Sign in with Apple revisado si la app ofrece otros logins (Apple puede
      exigirlo).

### Google
- [ ] Google Play Console contratado (25 USD, único pago).
- [ ] Aplicación creada en la consola.
- [ ] Modo de firma decidido (recomendado: Play App Signing).
- [ ] Upload key generada.
- [ ] Periodo de closed testing planeado si es una cuenta nueva (Google puede
      exigirlo).

## 6. Cuentas de desarrollo (si la app es desktop)

- [ ] Apple Developer Program (sirve el mismo que para móvil) — para firmar y
      notarizar en macOS.
- [ ] Certificado de firma de código para Windows.
- [ ] Plan de firma decidido para Linux (suele no hacer falta).

## 7. Backend / BaaS (si aplica)

- [ ] Proyecto creado en el BaaS o servidor desplegado.
- [ ] Esquema inicial definido.
- [ ] **Reglas de seguridad** configuradas partiendo de "denegar todo".
- [ ] Variables de entorno del backend separadas de las del cliente.
- [ ] Backups automáticos activados.
- [ ] Plan de restore probado al menos una vez.

## 8. Dominios y emails

- [ ] Dominio principal registrado.
- [ ] DNS configurado: registros A/AAAA y MX.
- [ ] HTTPS funcionando (Let's Encrypt o equivalente).
- [ ] Email transaccional configurado: dominio verificado (SPF, DKIM, DMARC).
- [ ] Email de contacto del proyecto definido.

## 9. Monitorización y errores

- [ ] Crash reporting configurado en cada plataforma (Sentry o equivalente).
- [ ] Uptime monitoring configurado para los endpoints críticos.
- [ ] Alertas con destino real (email, Telegram, Discord) — no a un sitio que
      no miras.
- [ ] Logs estructurados (JSON) configurados en el backend.

## 10. Pagos (si aplica)

- [ ] Cuenta del proveedor (Stripe / RevenueCat / etc.) verificada.
- [ ] Datos fiscales del negocio configurados.
- [ ] Webhooks con verificación de firma implementados.
- [ ] Sandbox / modo de pruebas usado para validar el flujo completo.
- [ ] En móvil: IAP configurado en cada tienda.

## 11. Notificaciones push (si aplica)

- [ ] FCM configurado (Android y web).
- [ ] APNs configurado (iOS).
- [ ] Certificados / claves guardados como secretos.
- [ ] Petición de permiso diseñada para pedirse en contexto, no al arrancar.

## 12. Analítica (si aplica)

- [ ] Proveedor de analítica configurado.
- [ ] Plan de eventos definido con `/event-plan`.
- [ ] Banner / flujo de consentimiento implementado (RGPD) antes del primer
      evento si aplica.

## 13. Legal y compliance

- [ ] Política de privacidad redactada (`privacy-policy.md` o equivalente) y
      enlazada desde la app.
- [ ] Términos de servicio redactados (`terms-of-service.md`) y enlazados.
- [ ] Si la app trata datos personales: contratos DPA firmados con los
      procesadores.
- [ ] Edad mínima de uso definida y verificada según jurisdicción.

## 14. Seguridad

- [ ] Hook de check-secrets activo (viene del template).
- [ ] Dependencias auditadas (sin CVE críticos conocidos).
- [ ] HTTPS y TLS verificados en todos los endpoints.
- [ ] Política de retención de datos documentada.
- [ ] Plan básico de respuesta a incidentes (`incident-response.md`) leído y
      adaptado.

## 15. Modelo de costes

- [ ] `cost-model.md` rellenado con cifras reales para tres escenarios.
- [ ] Alertas de gasto activadas en los proveedores que las soportan.

## 16. Documentación inicial

- [ ] `README.md` del proyecto con qué es, cómo se ejecuta en local, dónde está
      el workflow.
- [ ] `CHANGELOG.md` vacío, listo para la primera versión.
- [ ] `docs/adr/` con los primeros ADRs (stack, BaaS si aplica, decisiones
      mayores).

---

## Lo importante

No todos los puntos aplican a todos los proyectos. Lo que **siempre** aplica:

- Sin secretos en el código.
- Sin reglas de seguridad abiertas.
- Backups con restore probado.
- Forma de comunicar con los usuarios definida antes del primer release.

El resto es contexto.

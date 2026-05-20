# Modelo de costes — [NOMBRE DE LA APP]

**Última actualización:** [FECHA]
**Versión:** [v0.1]

Este documento estima cuánto cuesta operar la app, en distintos escenarios de
uso. El objetivo es **no llevarse sorpresas con la factura** — descubrir el
coste real antes de que llegue.

> Este documento se actualiza periódicamente, sobre todo cuando se añade un
> servicio nuevo o cuando el uso real difiere de lo previsto.

---

## 1. Escenarios de uso

Define [N] escenarios de uso plausibles. Como mínimo, "pocos usuarios" y "muchos
usuarios"; idealmente también un punto medio.

| Escenario | Usuarios activos / mes | Uso por usuario | Notas |
|-----------|------------------------|-----------------|-------|
| **Lanzamiento (S)** | [p.ej. 100] | [p.ej. 5 acciones/mes] | Los primeros meses |
| **Crecimiento (M)** | [p.ej. 5.000] | [p.ej. 20 acciones/mes] | Si la app funciona |
| **Escala (L)** | [p.ej. 50.000] | [p.ej. 40 acciones/mes] | Punto de éxito a vigilar |

---

## 2. Costes recurrentes (mensuales)

### 2.1 Infraestructura y servicios

| Concepto | Proveedor | Coste S | Coste M | Coste L | Notas |
|----------|-----------|---------|---------|---------|-------|
| Hosting / backend | [ej. Supabase / AWS] | [€] | [€] | [€] | [cuota base + uso] |
| Base de datos | [ej. incluido en BaaS] | [€] | [€] | [€] | |
| Almacenamiento de ficheros | [ej. S3] | [€] | [€] | [€] | |
| CDN | [ej. CloudFront] | [€] | [€] | [€] | |
| Dominio | [registrar] | [€] | [€] | [€] | |
| Email transaccional | [ej. Postmark] | [€] | [€] | [€] | |
| Push notifications | FCM / APNs | gratuito | gratuito | gratuito | suelen serlo |
| Analítica | [ej. Plausible] | [€] | [€] | [€] | |
| Monitorización y errores | [ej. Sentry] | [€] | [€] | [€] | |
| Backups | [si aplica] | [€] | [€] | [€] | |

### 2.2 APIs externas (uso variable)

| API | Proveedor | Coste S | Coste M | Coste L | Notas |
|-----|-----------|---------|---------|---------|-------|
| [p.ej. IA / LLM] | [ej. Anthropic] | [€] | [€] | [€] | [coste por uso × usos esperados] |
| [p.ej. Pagos] | [ej. Stripe] | [€] | [€] | [€] | [% sobre ingresos] |
| [p.ej. SMS] | [ej. Twilio] | [€] | [€] | [€] | |
| [p.ej. Mapas] | [ej. Mapbox] | [€] | [€] | [€] | |

### 2.3 Costes anuales (prorrateados)

| Concepto | Coste anual | Coste mensual prorrateado |
|----------|-------------|---------------------------|
| Apple Developer Program | 99 USD/año | ≈ [€]/mes |
| Google Play Console (única vez) | 25 USD | despreciable mensual |
| Certificado de firma de código (Windows) | [€]/año | ≈ [€]/mes |
| Cuenta de empresa / fiscalidad | [€]/año | ≈ [€]/mes |

### 2.4 Totales mensuales por escenario

| Escenario | Coste mensual total |
|-----------|--------------------|
| S | **[€]** |
| M | **[€]** |
| L | **[€]** |

---

## 3. Costes de tu tiempo

A menudo se olvida y es el mayor coste real. Si te dedicas a la app, tu tiempo
tiene un valor — aunque no te lo pagues en efectivo.

| Actividad | Horas/mes | Valor estimado |
|-----------|-----------|----------------|
| Desarrollo de features | [N] | [€] |
| Mantenimiento, bugs, releases | [N] | [€] |
| Soporte a usuarios | [N] | [€] |
| Marketing y comunicación | [N] | [€] |
| **Total** | | **[€]** |

---

## 4. Ingresos esperados (si aplica)

Si la app cobra, contrasta los costes con los ingresos esperados por escenario.

| Escenario | Usuarios de pago | Precio medio | Ingreso bruto mensual | Comisión tienda (30% / 15%) | Ingreso neto |
|-----------|------------------|--------------|----------------------|----------------------------|--------------|
| S | [N] | [€] | [€] | [€] | [€] |
| M | [N] | [€] | [€] | [€] | [€] |
| L | [N] | [€] | [€] | [€] | [€] |

---

## 5. Balance por escenario

| Escenario | Ingresos netos | Costes (incl. tiempo) | Resultado |
|-----------|---------------|----------------------|-----------|
| S | [€] | [€] | [€] |
| M | [€] | [€] | [€] |
| L | [€] | [€] | [€] |

---

## 6. Alertas y umbrales

| Métrica | Alerta si... | Acción |
|---------|--------------|--------|
| Coste de API X | supera [€] / mes | Revisar uso, considerar caché o modelo más barato |
| Coste total | supera [€] / mes sin más usuarios | Buscar la causa |
| Coste por usuario | supera [€] / usuario activo | Revisar arquitectura |

---

## 7. Decisiones a tomar antes de cada hito

- **Antes de un lanzamiento mayor:** ¿qué pasa si el uso se multiplica por 10
  de un día para otro? ¿Hay tope, escalado automático, alerta?
- **Antes de añadir una API externa:** ¿cuál es su coste a escala L?
- **Antes de meter una feature de IA:** ¿cuánto cuesta una invocación × cuántas
  invocaciones esperadas? (Coordina con `ai-features-engineer`.)

---

## Lista de comprobación

- [ ] Todos los `[CORCHETES]` están rellenos con cifras reales o estimadas.
- [ ] Las cuotas gratuitas de los proveedores están **expiradas en el cálculo**
      del escenario M y L (cuentas con el precio normal, no con el free tier).
- [ ] Hay alertas configuradas en los proveedores para evitar facturas sorpresa.
- [ ] El escenario L se ha sometido al "test del éxito": si funciona, ¿podemos
      pagarlo?
- [ ] El documento se ha revisado en los últimos [3] meses.

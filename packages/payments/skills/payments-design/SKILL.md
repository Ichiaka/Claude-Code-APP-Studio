---
name: payments-design
description: Diseña el modelo de pagos: productos, precios, ciclos, webhooks.
---

# /payments-design

## Protocolo

1. Define productos: one-shot, suscripción, consumibles.
2. Define ciclos y precios por mercado/moneda.
3. Elige proveedor por plataforma:
   - Web: Stripe, Paddle, Lemon Squeezy.
   - Móvil: IAP de iOS/Android (RevenueCat los unifica).
4. Mapea estados de suscripción a tu modelo.
5. Define webhooks necesarios y su idempotencia.
6. Documenta en `docs/features/payments.md`.

## Checklist crítico

- [ ] Test en sandbox de todos los flows (compra, renovación, cancelación, reembolso, fallo de pago).
- [ ] Webhook firmado y verificado.
- [ ] Reconciliación: estado en tu DB coincide con el del proveedor.
- [ ] Manejo de currency y impuestos por país.

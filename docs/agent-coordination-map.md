# Mapa de coordinación de agentes

Resumen visual de quién delega en quién y cómo escalan los conflictos.

## Jerarquía

```
                       (arquitecto humano)
                              |
        +---------------------+---------------------+
        |                     |                     |
  product-director    technical-director    delivery-manager
        |                     |                     |
        v                     v                     v
   +----+----+        +-------+--------+        +---+---+
   |         |        |       |        |        |       |
 ux-lead   qa-lead  frontend-lead  mobile-lead desktop-lead  qa-lead
   |         |        |              |              |         |
   v         v        v              v              v         v
[specialists]   [specialists]  [specialists] [specialists] ...
```

## Reglas

1. **Vertical**: directores → leads → especialistas.
2. **Horizontal**: agentes de mismo tier consultan, no deciden por el otro.
3. **Conflicto**: escala al padre común. Si no hay, al arquitecto humano.
4. **Cross-departamento**: lo coordina `delivery-manager`.
5. **Cambios técnicos significativos**: `technical-director` + ADR.
6. **Cambios de scope**: `delivery-manager` + revisión con `product-director`.

## Quién pregunta cuando hay duda

| Duda                                  | A quién |
|---------------------------------------|---------|
| ¿Construimos esto?                    | product-director |
| ¿Cómo lo construimos?                 | technical-director (alto), architect (feature) |
| ¿Cuándo entra?                        | delivery-manager |
| ¿Es accesible / usable?               | ux-lead |
| ¿Funciona en móvil?                   | mobile-lead |
| ¿Es seguro?                           | security-privacy-lead |
| ¿Está testeado lo suficiente?         | qa-lead |
| ¿Cómo lo desplegamos?                 | devops-lead |

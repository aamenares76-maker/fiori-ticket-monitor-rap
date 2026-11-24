# Monitor de tickets Juanito1
# Monitor de tickets Juanito1

App Fiori elements (List Report + Object Page) para revisar tickets de soporte, armada con ABAP Cloud y RAP sobre el SAP BTP ABAP Environment (trial).

> **Juanito1** es una empresa ficticia. Los datos son de prueba y el proyecto es solo de práctica.

## Qué hace

- Lista los tickets con número, título, estado, prioridad y fecha, ordenados del más nuevo al más viejo.
- Estado y prioridad se ven como texto ("Abierto", "Alta") con semáforo de colores.
- Filtros con dropdown para estado y prioridad.
- Al entrar a un ticket se ve el detalle, con estado y prioridad destacados en la cabecera.

## Capturas

| List Report | Object Page |
|---|---|
| ![List Report](list-report.png) | ![Object Page](object-page.png) |

## Cómo está armado

| Objeto | Tipo | Para qué |
|---|---|---|
| `ZTK_AM_TICKET` | Tabla | Tickets |
| `ZCL_TK_AM_FILL` | Clase | Carga los datos de prueba (se ejecuta con F9 en ADT) |
| `ZI_TK_AM_Ticket` | CDS view entity | Vista base: textos legibles y criticidad para el semáforo |
| `ZC_TK_AM_Ticket` | CDS view entity | Vista de consumo con las anotaciones `@UI` |
| `ZI_TK_AM_EstadoVH` / `ZI_TK_AM_PrioridadVH` | CDS view entity | Value help para los filtros |
| `ZUI_TK_AM_TICKET` | Service definition | Expone la vista de consumo |
| `ZUI_TK_AM_TICKET_O4` | Service binding | OData V4 - UI |

No tiene behavior definition porque la app es solo de lectura.

## Cómo levantarlo

1. Tener un sistema ABAP Cloud (por ejemplo, el trial de BTP) y Eclipse con ADT y el plugin de abapGit.
2. Crear un paquete y hacer pull de este repo con abapGit.
3. Activar todo.
4. Ejecutar `ZCL_TK_AM_FILL` con F9 para cargar los 8 tickets.
5. Abrir `ZUI_TK_AM_TICKET_O4`, darle **Publish** y después **Preview** sobre la entidad `Ticket`.

## Pendientes

- Cambiar los value help a dominios con valores fijos.
- Agregar behavior definition para crear y editar tickets.
- Generar la app como proyecto en Business Application Studio.

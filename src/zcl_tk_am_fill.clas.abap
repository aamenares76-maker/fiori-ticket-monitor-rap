CLASS zcl_tk_am_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    DATA mt_ticket TYPE STANDARD TABLE OF ztk_am_ticket.

    METHODS add_ticket
      IMPORTING
        iv_id        TYPE ztk_am_ticket-ticket_id
        iv_titulo    TYPE ztk_am_ticket-titulo
        iv_estado    TYPE ztk_am_ticket-estado
        iv_prioridad TYPE ztk_am_ticket-prioridad
        iv_fecha     TYPE ztk_am_ticket-fecha.
ENDCLASS.


CLASS zcl_tk_am_fill IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lv_lines TYPE i.

*   Limpia la tabla para poder re-ejecutar la carga sin duplicados
    DELETE FROM ztk_am_ticket.

    add_ticket( iv_id = '00000001' iv_titulo = 'Error al imprimir factura'
                iv_estado = 'A' iv_prioridad = '1' iv_fecha = '20261122' ).
    add_ticket( iv_id = '00000002' iv_titulo = 'Usuario sin acceso a VA01'
                iv_estado = 'P' iv_prioridad = '2' iv_fecha = '20261121' ).
    add_ticket( iv_id = '00000003' iv_titulo = 'Reporte de ventas lento'
                iv_estado = 'A' iv_prioridad = '2' iv_fecha = '20261120' ).
    add_ticket( iv_id = '00000004' iv_titulo = 'Falla en interfaz con banco'
                iv_estado = 'P' iv_prioridad = '1' iv_fecha = '20261119' ).
    add_ticket( iv_id = '00000005' iv_titulo = 'Cambio de formulario de pedido'
                iv_estado = 'C' iv_prioridad = '3' iv_fecha = '20261117' ).
    add_ticket( iv_id = '00000006' iv_titulo = 'Diferencia en saldo de inventario'
                iv_estado = 'A' iv_prioridad = '1' iv_fecha = '20261115' ).
    add_ticket( iv_id = '00000007' iv_titulo = 'Solicitud de nuevo campo en OC'
                iv_estado = 'C' iv_prioridad = '3' iv_fecha = '20261112' ).
    add_ticket( iv_id = '00000008' iv_titulo = 'Actualizar texto de mensaje'
                iv_estado = 'C' iv_prioridad = '3' iv_fecha = '20261108' ).

    INSERT ztk_am_ticket FROM TABLE @mt_ticket.

    IF sy-subrc = 0.
      lv_lines = lines( mt_ticket ).
      out->write( |Carga OK: { lv_lines } tickets insertados| ).
    ELSE.
      out->write( 'Error al insertar los tickets' ).
    ENDIF.

  ENDMETHOD.


  METHOD add_ticket.

    DATA ls_ticket TYPE ztk_am_ticket.

    ls_ticket-ticket_id = iv_id.
    ls_ticket-titulo    = iv_titulo.
    ls_ticket-estado    = iv_estado.
    ls_ticket-prioridad = iv_prioridad.
    ls_ticket-fecha     = iv_fecha.
    APPEND ls_ticket TO mt_ticket.

  ENDMETHOD.

ENDCLASS.

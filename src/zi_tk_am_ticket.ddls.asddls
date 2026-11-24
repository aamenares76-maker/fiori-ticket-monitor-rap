@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ticket - vista base'
define view entity ZI_TK_AM_Ticket
  as select from ztk_am_ticket
{
  key ticket_id as TicketId,
      titulo    as Titulo,

      estado    as Estado,
      case estado
        when 'A' then 'Abierto'
        when 'P' then 'En proceso'
        when 'C' then 'Cerrado'
        else 'Desconocido'
      end       as EstadoTexto,
      case estado
        when 'A' then 1
        when 'P' then 2
        when 'C' then 3
        else 0
      end       as EstadoCriticality,

      prioridad as Prioridad,
      case prioridad
        when '1' then 'Alta'
        when '2' then 'Media'
        when '3' then 'Baja'
        else 'Sin prioridad'
      end       as PrioridadTexto,
      case prioridad
        when '1' then 1
        when '2' then 2
        when '3' then 3
        else 0
      end       as PrioridadCriticality,

      fecha     as Fecha
}

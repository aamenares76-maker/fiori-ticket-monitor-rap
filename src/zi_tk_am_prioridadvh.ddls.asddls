@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help prioridad ticket'
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_TK_AM_PrioridadVH
  as select distinct from ZI_TK_AM_Ticket
{
      @ObjectModel.text.element: ['PrioridadTexto']
      @UI.textArrangement: #TEXT_ONLY
      @EndUserText.label: 'Prioridad'
  key Prioridad,
      @Semantics.text: true
      PrioridadTexto
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help estado ticket'
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_TK_AM_EstadoVH
  as select distinct from ZI_TK_AM_Ticket
{
      @ObjectModel.text.element: ['EstadoTexto']
      @UI.textArrangement: #TEXT_ONLY
      @EndUserText.label: 'Estado'
  key Estado,
      @Semantics.text: true
      EstadoTexto
}

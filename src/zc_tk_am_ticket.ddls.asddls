@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ticket - consumo Fiori'
@UI.headerInfo: {
  typeName:       'Ticket',
  typeNamePlural: 'Tickets',
  title:          { type: #STANDARD, value: 'Titulo' },
  description:    { type: #STANDARD, value: 'TicketId' }
}
@UI.presentationVariant: [{
  sortOrder:      [{ by: 'Fecha', direction: #DESC }],
  visualizations: [{ type: #AS_LINEITEM }]
}]
define view entity ZC_TK_AM_Ticket
  as select from ZI_TK_AM_Ticket
{
      @UI.facet: [
        { id:              'HdrEstado',
          purpose:         #HEADER,
          type:            #DATAPOINT_REFERENCE,
          targetQualifier: 'Estado',
          position:        10 },
        { id:              'HdrPrioridad',
          purpose:         #HEADER,
          type:            #DATAPOINT_REFERENCE,
          targetQualifier: 'Prioridad',
          position:        20 },
        { id:              'General',
          purpose:         #STANDARD,
          type:            #IDENTIFICATION_REFERENCE,
          label:           'Datos del ticket',
          position:        10 } ]

      @UI.lineItem:       [{ position: 10 }]
      @UI.identification: [{ position: 10 }]
      @UI.selectionField: [{ position: 10 }]
      @EndUserText.label: 'N° Ticket'
  key TicketId,

      @UI.lineItem:       [{ position: 20 }]
      @UI.identification: [{ position: 20 }]
      @EndUserText.label: 'Título'
      Titulo,

      @UI.lineItem:       [{ position: 30, criticality: 'EstadoCriticality' }]
      @UI.identification: [{ position: 30, criticality: 'EstadoCriticality' }]
      @UI.selectionField: [{ position: 20 }]
      @UI.dataPoint:      { qualifier: 'Estado', title: 'Estado', criticality: 'EstadoCriticality' }
      @UI.textArrangement: #TEXT_ONLY
      @ObjectModel.text.element: ['EstadoTexto']
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_TK_AM_EstadoVH', element: 'Estado' } }]
      @EndUserText.label: 'Estado'
      Estado,

      @UI.hidden: true
      EstadoTexto,

      @UI.hidden: true
      EstadoCriticality,

      @UI.lineItem:       [{ position: 40, criticality: 'PrioridadCriticality' }]
      @UI.identification: [{ position: 40, criticality: 'PrioridadCriticality' }]
      @UI.selectionField: [{ position: 30 }]
      @UI.dataPoint:      { qualifier: 'Prioridad', title: 'Prioridad', criticality: 'PrioridadCriticality' }
      @UI.textArrangement: #TEXT_ONLY
      @ObjectModel.text.element: ['PrioridadTexto']
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_TK_AM_PrioridadVH', element: 'Prioridad' } }]
      @EndUserText.label: 'Prioridad'
      Prioridad,

      @UI.hidden: true
      PrioridadTexto,

      @UI.hidden: true
      PrioridadCriticality,

      @UI.lineItem:       [{ position: 50 }]
      @UI.identification: [{ position: 50 }]
      @UI.selectionField: [{ position: 40 }]
      @EndUserText.label: 'Fecha'
      Fecha
}

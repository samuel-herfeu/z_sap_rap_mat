@EndUserText.label: 'UI View - Material Root'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI.headerInfo: {
  typeName: 'Material Record',
  typeNamePlural: 'Material Records',
  title: { type: #STANDARD, value: 'Material' },
  description: { value: 'MaterialDescription' }
}

@UI.presentationVariant: [
  {
    sortOrder: [
      { by: 'Material', direction: #ASC },
      { by: 'Plant', direction: #ASC }
    ]
  }
]

define root view entity ZUI_C_MaterialRoot
  as projection on Z_C_MaterialRoot
{
  @UI.selectionField: [ { position: 10 } ]
  @UI.lineItem:       [ { position: 10, importance: #HIGH } ]
  @UI.identification: [ { position: 10 } ]
  key Material,

  @UI.selectionField: [ { position: 20 } ]
  @UI.lineItem:       [ { position: 20, importance: #HIGH } ]
  @UI.identification: [ { position: 20 } ]
  key Plant,

  @UI.lineItem:       [ { position: 30, importance: #HIGH } ]
  @UI.identification: [ { position: 30 } ]
  MaterialDescription,

  @UI.lineItem:       [ { position: 40 } ]
  @UI.identification: [ { position: 40 } ]
  MaterialType,

  @UI.lineItem:       [ { position: 50 } ]
  @UI.identification: [ { position: 50 } ]
  IndustrySector,

  @UI.lineItem:       [ { position: 60 } ]
  @UI.identification: [ { position: 60 } ]
  MaterialGroup,

  @UI.lineItem:       [ { position: 70 } ]
  @UI.identification: [ { position: 70 } ]
  BaseUnit,

  @UI.lineItem:       [ { position: 80 } ]
  @UI.identification: [ { position: 80 } ]
  MRPController,

  @UI.lineItem:       [ { position: 90 } ]
  @UI.identification: [ { position: 90 } ]
  ProcurementType,

  @UI.lineItem:       [ { position: 100 } ]
  @UI.identification: [ { position: 100 } ]
  ValuationArea,

  @UI.lineItem:       [ { position: 110 } ]
  @UI.identification: [ { position: 110 } ]
  ValuationClass,

  @UI.lineItem:       [ { position: 120 } ]
  @UI.identification: [ { position: 120 } ]
  PriceControl,

  @UI.lineItem:       [ { position: 130 } ]
  @UI.identification: [ { position: 130 } ]
  StandardPrice,

  @UI.lineItem:       [ { position: 140 } ]
  @UI.identification: [ { position: 140 } ]
  MovingAveragePrice,

  @UI.lineItem: [ { type: #FOR_ACTION, dataAction: 'checkConsistency', label: 'Check Consistency', position: 150 } ]
  checkConsistency
}

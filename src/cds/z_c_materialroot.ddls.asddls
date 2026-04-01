@EndUserText.label: 'Projection View - Material Root'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity Z_C_MaterialRoot
  as projection on Z_I_MaterialRoot
{
  key Material,
  key Plant,
      MaterialType,
      IndustrySector,
      MaterialGroup,
      BaseUnit,
      MaterialDescription,
      MRPController,
      ProcurementType,
      ValuationArea,
      ValuationClass,
      PriceControl,
      StandardPrice,
      MovingAveragePrice,

      /* custom action exposed to UI/service */
      checkConsistency
}

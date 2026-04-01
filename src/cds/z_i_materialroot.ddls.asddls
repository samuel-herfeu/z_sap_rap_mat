@EndUserText.label: 'Interface Root View - Material + Plant + Valuation'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_I_MaterialRoot
  as select from mara
    left outer join makt
      on  makt.matnr = mara.matnr
      and makt.spras = $session.system_language
    left outer join marc
      on  marc.matnr = mara.matnr
    left outer join mbew
      on  mbew.matnr = mara.matnr
      and mbew.bwkey = marc.werks
{
  key mara.matnr as Material,
  key marc.werks as Plant,

      mara.mtart as MaterialType,
      mara.mbrsh as IndustrySector,
      mara.matkl as MaterialGroup,
      mara.meins as BaseUnit,
      makt.maktx as MaterialDescription,

      marc.dispo as MRPController,
      marc.beskz as ProcurementType,

      mbew.bwkey as ValuationArea,
      mbew.bklas as ValuationClass,
      mbew.vprsv as PriceControl,
      mbew.stprs as StandardPrice,
      mbew.verpr as MovingAveragePrice
}

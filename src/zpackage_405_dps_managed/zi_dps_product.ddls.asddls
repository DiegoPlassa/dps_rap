@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic produtos'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_DPS_PRODUCT as select from zdps_rap_product
{
    key matnr as Matnr,
    key language as language,
    description as Description
}

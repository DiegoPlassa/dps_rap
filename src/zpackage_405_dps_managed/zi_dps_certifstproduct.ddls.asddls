@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Composite Certificado Status com produto'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_DPS_CERTIFSTPRODUCT as select from ZI_DPS_CERTIF_ST
association to parent ZI_DPS_CERTIFIWITHPRODUCT as _certifi 
                                                on $projection.CertUuid = _certifi.CertUuid
association [1..1] to  ZI_DPS_PRODUCT as _PROD on $projection.Matnr = _PROD.Matnr 
                                          and _PROD.language = $session.system_language 
{
    key StateUuid,
    CertUuid,
    Matnr,
    _PROD.Description as description,
    Version,
    Status,
    StatusOld,
    @Semantics.user.lastChangedBy: true
    LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    LastChangeAt,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalLastChangedAt,
    _certifi 
}

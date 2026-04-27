@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck:   #NOT_REQUIRED
@EndUserText.label: 'Composite Certificado com produto'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_DPS_CERTIFIWITHPRODUCT 
as select from ZI_DPS_CERTIF
composition [1..*] of zi_DPS_CERTIFSTPRODUCT as _stats
association [1..1] to  ZI_DPS_PRODUCT as _PROD on $projection.Matnr = _PROD.Matnr 
                                          and _PROD.language = $session.system_language 

{
    key CertUuid,
    Matnr,
    _PROD.Description as description,
    Version,
    CertStatus,
    CertCe,
    CertGs,
    CertFcc,
    CertIso,
    CertTuev,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalLastChangedAt,
    'sap-icon://documents' as Icon,
    
    _PROD,
    _stats
    
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption - Certificados'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_DPS_CERTIFIWITHPRODUCT
  as projection on ZI_DPS_CERTIFIWITHPRODUCT
{

  key CertUuid,
      Matnr,
      description,
      Version,
      CertStatus,
      CertCe,
      CertGs,
      CertFcc,
      CertIso,
      CertTuev,
      LocalLastChangedAt,
      Icon,
      
      /* Associations */
      _PROD,
      _stats : redirected to composition child zc_dps_certifstprodct
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption - Certificados Status'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zc_dps_certifstprodct as projection on zi_DPS_CERTIFSTPRODUCT
{
    key StateUuid,
    CertUuid,
    Matnr,
    description,
    Version,
    Status,
    StatusOld,
    LastChangedBy,
    LastChangeAt,
    LocalLastChangedAt,
    /* Associations */
    _certifi: redirected to parent ZC_DPS_CERTIFIWITHPRODUCT
}

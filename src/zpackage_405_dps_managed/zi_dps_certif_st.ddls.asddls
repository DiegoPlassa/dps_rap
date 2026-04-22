@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BASIC Certificados Status'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_DPS_CERTIF_ST as select from zdps_rap_cert_st
{
    key state_uuid as StateUuid,
    cert_uuid as CertUuid,
    matnr as Matnr,
    version as Version,
    status as Status,
    status_old as StatusOld,
    last_changed_by as LastChangedBy,
    last_change_at as LastChangeAt,
    local_last_changed_at as LocalLastChangedAt
}

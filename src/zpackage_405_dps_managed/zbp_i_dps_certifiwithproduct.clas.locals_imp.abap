CLASS lhc_ZI_DPS_CERTIFIWITHPRODUCT DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZI_DPS_CERTIFIWITHPRODUCT RESULT result.

    METHODS validateMatnr FOR VALIDATE ON SAVE
      IMPORTING keys FOR ZI_DPS_CERTIFIWITHPRODUCT~validateMatnr.

ENDCLASS.

CLASS lhc_ZI_DPS_CERTIFIWITHPRODUCT IMPLEMENTATION.

  METHOD get_global_authorizations.
    result-%create = if_abap_behv=>auth-allowed.
    result-%update = if_abap_behv=>auth-allowed.
    result-%delete = if_abap_behv=>auth-allowed.
  ENDMETHOD.

  METHOD validateMatnr.
    READ ENTITIES OF ZI_DPS_CERTIFIWITHPRODUCT IN LOCAL MODE
      ENTITY ZI_DPS_CERTIFIWITHPRODUCT
        FIELDS ( Matnr ) WITH CORRESPONDING #( keys )
      RESULT DATA(certificados).

    LOOP AT certificados INTO DATA(ls_certif).
      IF ls_certif-Matnr IS INITIAL.
        APPEND VALUE #( %tky = ls_certif-%tky ) TO failed-zi_dps_certifiwithproduct.
        APPEND VALUE #( %tky = ls_certif-%tky
                        %state_area = 'VALIDATE_MATNR'
                        %msg = cl_abap_behv=>new_message_with_text(
                                 severity = if_abap_behv=>severity-error
                                 text     = 'O Material (Matnr) é obrigatório.' )
                        %element-Matnr = if_abap_behv=>mk-on ) TO reported-zi_dps_certifiwithproduct.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

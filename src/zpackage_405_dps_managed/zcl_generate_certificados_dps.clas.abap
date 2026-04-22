CLASS zcl_generate_certificados_dps DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_generate_certificados_dps IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES: tt_certif TYPE TABLE OF zdps_rap_certif WITH DEFAULT KEY.
    TYPES: tt_status TYPE TABLE OF zdps_rap_cert_st WITH DEFAULT KEY.

    DELETE FROM zdps_rap_certif.
     DELETE FROM zdps_rap_cert_st.

    DATA(lt_certificados) = VALUE tt_certif(

    ( cert_uuid = '1' matnr = '1' )
    ( cert_uuid = '2' matnr = '2' )
    ( cert_uuid = '3' matnr = '3' )


     ).


     data(lt_status) = VALUE tt_status(

     ( state_uuid = '1'  cert_uuid = '1' matnr = '1' )
     ( state_uuid = '2'  cert_uuid = '2' matnr = '2' )
     ( state_uuid = '3'  cert_uuid = '3' matnr = '3' )
     ( state_uuid = '4'  cert_uuid = '3' matnr = '3' )

     ).

    MODIFY zdps_rap_certif FROM TABLE @lt_certificados.
    moDIFY zdps_rap_cert_st FROM TABLE @lt_status.


    out->write( 'Certificados criados.' ).

  ENDMETHOD.

ENDCLASS.

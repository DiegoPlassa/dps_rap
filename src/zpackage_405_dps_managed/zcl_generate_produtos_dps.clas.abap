CLASS zcl_generate_produtos_dps DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_generate_produtos_dps IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

  TYPES: TT_PRODUTOS TYPE TABLE OF zdps_rap_product WITH DEFAULT KEY.

  delETE from zdps_rap_product.

  DATA(lt_products) = VALUE TT_PRODUTOS(

  ( MATNR = '1' description = 'Computador' language = 'P' )
  ( MATNR = '2' description = 'Televisao'  language = 'P' )
  ( MATNR = '3' description = 'Celular'    language = 'P' )
  ( MATNR = '1' description = 'Computer'   language = 'E' )
  ( MATNR = '2' description = 'Television' language = 'E' )
  ( MATNR = '3' description = 'Cellphone'  language = 'E' )

   ).

   MODIFY zdps_rap_product FROM TABLE @lt_products.


  out->write( 'Produtos criados.' ).

  ENDMETHOD.

ENDCLASS.

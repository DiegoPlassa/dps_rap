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

  DATA(lt_products) = VALUE TT_PRODUTOS(

  ( MATNR = '1' description = 'Computador' )
  ( MATNR = '2' description = 'TV' )
  ( MATNR = '3' description = 'Geladeira' )
  ( MATNR = '4' description = 'AR CONDICIONADO' )



   ).

   MODIFY zdps_rap_product FROM TABLE @lt_products.


  out->write( 'Produtos criados.' ).

  ENDMETHOD.

ENDCLASS.

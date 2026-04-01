CLASS zcl_bp_i_materialroot DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_abap_behavior_handler.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS checkConsistency FOR MODIFY
      IMPORTING keys FOR ACTION MaterialRoot~checkConsistency RESULT result.

    METHODS validatePricing FOR VALIDATE ON SAVE
      IMPORTING keys FOR MaterialRoot~validatePricing.
ENDCLASS.

CLASS zcl_bp_i_materialroot IMPLEMENTATION.

  METHOD checkConsistency.
    " Example action for Fiori button / client demo
    READ ENTITIES OF Z_I_MaterialRoot IN LOCAL MODE
      ENTITY MaterialRoot
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(lt_data).

    result = VALUE #( FOR ls_data IN lt_data
      ( %tky = ls_data-%tky
        %param = ls_data ) ).
  ENDMETHOD.

  METHOD validatePricing.
    READ ENTITIES OF Z_I_MaterialRoot IN LOCAL MODE
      ENTITY MaterialRoot
      FIELDS ( Material Plant PriceControl StandardPrice MovingAveragePrice ValuationArea )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_data).

    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<ls_data>).

      " Validation example 1:
      " Standard price control requires standard price
      IF <ls_data>-PriceControl = 'S' AND <ls_data>-StandardPrice IS INITIAL.
        APPEND VALUE #( %tky = <ls_data>-%tky ) TO failed-MaterialRoot.

        APPEND VALUE #(
          %tky = <ls_data>-%tky
          %msg = new_message(
                    id       = '00'
                    number   = '001'
                    severity = if_abap_behv_message=>severity-error
                    v1       = |Material { <ls_data>-Material } Plant { <ls_data>-Plant }: Standard price required for price control S| ) )
          TO reported-MaterialRoot.
      ENDIF.

      " Validation example 2:
      " Moving average control requires moving price
      IF <ls_data>-PriceControl = 'V' AND <ls_data>-MovingAveragePrice IS INITIAL.
        APPEND VALUE #( %tky = <ls_data>-%tky ) TO failed-MaterialRoot.

        APPEND VALUE #(
          %tky = <ls_data>-%tky
          %msg = new_message(
                    id       = '00'
                    number   = '001'
                    severity = if_abap_behv_message=>severity-error
                    v1       = |Material { <ls_data>-Material } Plant { <ls_data>-Plant }: Moving price required for price control V| ) )
          TO reported-MaterialRoot.
      ENDIF.

      " Validation example 3:
      " Plant present but no valuation area derived
      IF <ls_data>-Plant IS NOT INITIAL AND <ls_data>-ValuationArea IS INITIAL.
        APPEND VALUE #( %tky = <ls_data>-%tky ) TO failed-MaterialRoot.

        APPEND VALUE #(
          %tky = <ls_data>-%tky
          %msg = new_message(
                    id       = '00'
                    number   = '001'
                    severity = if_abap_behv_message=>severity-error
                    v1       = |Material { <ls_data>-Material } Plant { <ls_data>-Plant }: Valuation area missing| ) )
          TO reported-MaterialRoot.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

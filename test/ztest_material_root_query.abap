REPORT ztest_material_root_query.

SELECT *
  FROM zui_c_materialroot
  INTO TABLE @DATA(lt_materials)
  UP TO 50 ROWS.

cl_demo_output=>display( lt_materials ).

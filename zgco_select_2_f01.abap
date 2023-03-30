*&---------------------------------------------------------------------*
*& Include          ZGCO_SELECT_2_F01
*&---------------------------------------------------------------------*

* here we have two options, 1-use table, 2-use structure
* If you use table option, use INTO TABLE
* If you use table option, you do not need to use ENDSELECT
* If you use table option, you can not use WRITE OPTION
* If you use table option, you have to use factory and display method

* If you use table option, use TABLE
* If you use structure, you have to use ENDSELECT
* If you use structure, you can use WRITE keyword, to do this, you can use variable name which was declared in the TOP file


************************************* FIRST USE TABLE *******************************
*SELECT
*  zdriver_car_kde~id_driver,
*  zdriver_car_kde~surname,
*  zdriver_car_kde~name,
*  zdriver_car_kde~date_birth,
*  zdriver_car_kde~city,
*  zdriver_car_kde~region,
*  zdriver_car_kde~country,
*  zdriver_car_kde~car_brand,
*  zdriver_car_kde~car_model,
*  zdriver_car_kde~car_year,
*  zdriver_car_kde~car_color,
*  zdriver_car_kde~car_id,
*  zdriver_car_kde~lang
*
*  FROM zdriver_car_kde
*
** the difference is here, you can use internal table
*INTO TABLE @lt_zdriver
*WHERE zdriver_car_kde~id_driver IN @s_id
*AND zdriver_car_kde~car_color = @p_carClr
*ORDER BY zdriver_car_kde~date_birth ASCENDING.
*
*IF sy-subrc <> 0.
*  MESSAGE e013(zgco_msg).
*  LEAVE LIST-PROCESSING.
*ELSE.
*  MESSAGE s014(zgco_msg).
*ENDIF.
*
** Create objcet alv for factory and display method
*DATA : lo_alv TYPE REF TO cl_salv_table.
*
** Call factory method with class/interface cl_salv_table
*CALL METHOD cl_salv_table=>factory
*  IMPORTING
*    r_salv_table = lo_alv
*  CHANGING
*    t_table      = lt_zdriver.
*
** call display method with class/interface cl_salv_table
*CALL METHOD lo_alv->display.


************************************* SECOND USE STRUCTURE *******************************

SELECT
  zdriver_car_kde~id_driver,
  zdriver_car_kde~surname,
  zdriver_car_kde~name,
  zdriver_car_kde~date_birth,
  zdriver_car_kde~city,
  zdriver_car_kde~region,
  zdriver_car_kde~country,
  zdriver_car_kde~car_brand,
  zdriver_car_kde~car_model,
  zdriver_car_kde~car_year,
  zdriver_car_kde~car_color,
  zdriver_car_kde~car_id,
  zdriver_car_kde~lang

  FROM zdriver_car_kde

* the difference is here, you can use internal table
INTO @ls_zdriver
WHERE zdriver_car_kde~id_driver IN @s_id
AND zdriver_car_kde~car_color = @p_carClr
ORDER BY zdriver_car_kde~date_birth ASCENDING.

  IF sy-subrc <> 0.
    MESSAGE e013(zgco_msg).
    LEAVE LIST-PROCESSING.
  ELSE.
    MESSAGE s014(zgco_msg).
  ENDIF.

  WRITE :/ ls_zdriver-fname && ' | ' &&  ls_zdriver-sname && ' | ' && ls_zdriver-birthD && ' | ' && ls_zdriver-carMdl && ' | ' && ls_zdriver-carClr.

ENDSELECT.
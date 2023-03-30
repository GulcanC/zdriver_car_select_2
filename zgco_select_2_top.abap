*&---------------------------------------------------------------------*
*& Include          ZGCO_SELECT_2_TOP
*&--------------------------------------------------------------------*


TABLES :zdriver_car_kde.

* Create model, structure for internal table

TYPES: BEGIN OF ty_zdriver,
         id     TYPE zdriver_car_kde-id_driver,
         sname  TYPE zdriver_car_kde-surname,
         fname  TYPE zdriver_car_kde-name,
         birthD TYPE zdriver_car_kde-date_birth,
         city   TYPE zdriver_car_kde-city,
         region TYPE zdriver_car_kde-region,
         coutry TYPE zdriver_car_kde-country,
         carBr  TYPE zdriver_car_kde-car_brand,
         carMdl TYPE zdriver_car_kde-car_model,
         carYr  TYPE zdriver_car_kde-car_year,
         carClr TYPE zdriver_car_kde-car_color,
         carId  TYPE zdriver_car_kde-car_id,
         lang   TYPE zdriver_car_kde-lang,

       END OF ty_zdriver.

* in this example, we will use model and declare structure and internal table
* In select data, we will see how selecting data changes according to the use of structure or table

DATA : ls_zdriver TYPE ty_zdriver,
       lt_zdriver TYPE TABLE OF ty_zdriver.
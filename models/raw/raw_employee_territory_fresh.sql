{{ config (materialized='table')}}

SELECT *
from {{ source('NWT', 'RAW_EMPLOYEE_TERRITORY_FRESH') }}
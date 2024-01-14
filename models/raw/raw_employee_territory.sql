{{ config (materialized='table')}}

Select *
from {{ source('NWT', 'EMPLOYEE_TERRITORY') }}

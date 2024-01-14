{{ config (materialized='table')}}

Select *
from {{ source('NWT', 'RAW_EMPLOYEE') }}


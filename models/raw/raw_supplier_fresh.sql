{{ config (materialized='table')}}

SELECT *
from {{ source('NWT', 'RAW_SUPPLIER_FRESH') }}
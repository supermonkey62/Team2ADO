{{ config (materialized='table')}}

SELECT *
from {{ source('NWT', 'RAW_ORDER_FRESH') }}

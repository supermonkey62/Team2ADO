{{ config (materialized='table')}}

SELECT *
from {{ source('NWT', 'RAW_ORDER_DETAIL_FRESH') }}

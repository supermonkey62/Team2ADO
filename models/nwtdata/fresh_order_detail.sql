{{ config (materialized='table')}}

SELECT *
from {{ source('NWT', 'FRESH_ORDER_DETAIL') }}

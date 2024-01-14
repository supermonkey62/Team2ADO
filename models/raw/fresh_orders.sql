{{ config (materialized='table')}}

SELECT *
from {{ source('NWT', 'FRESH_ORDERS') }}

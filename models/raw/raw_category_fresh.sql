{{ config (materialized='table')}}

SELECT *
from {{ source('NWT', 'RAW_CATEGORY_FRESH') }}

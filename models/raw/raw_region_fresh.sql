{{ config (materialized='table')}}

SELECT *
from {{ source('NWT', 'RAW_REGION_FRESH') }}
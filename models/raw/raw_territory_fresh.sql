{{ config (materialized='table')}}

SELECT *
from {{ source('NWT', 'RAW_TERRITORY_FRESH') }}
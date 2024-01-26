{{ config (materialized='table')}}

SELECT *
from {{ source('NWT', 'RAW_SHIPPER_FRESH') }}
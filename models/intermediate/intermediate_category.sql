{{ config (materialized='table')}}

select *
from {{ source('NWT', 'RAW_CATEGORY') }}
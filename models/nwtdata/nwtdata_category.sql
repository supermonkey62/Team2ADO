{{ config (materialized='table')}}

select *
from {{ source('NWT', 'CATEGORY') }}






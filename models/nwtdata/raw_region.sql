{{ config (materialized='table')}}

Select *
from {{ source('NWT', 'REGION') }}
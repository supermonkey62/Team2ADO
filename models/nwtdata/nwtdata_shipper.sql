{{ config (materialized='table')}}

Select *
from {{ source('NWT', 'SHIPPER') }}
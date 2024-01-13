{{ config (materialized='table')}}

Select *
from {{ source('NWT', 'SUPPLIER') }}
{{ config (materialized='table')}}

Select *
from {{ source('NWT', 'TERRITORY') }}
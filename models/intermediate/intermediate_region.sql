{{ config (materialized='table')}}

SELECT 
  CASE WHEN regionID IS NULL THEN 0 ELSE regionID END AS regionID,
  CASE WHEN regionDescription IS NULL THEN 'None' ELSE regionDescription END AS regionDescription
FROM {{ source('NWT', 'RAW_REGIONS') }};

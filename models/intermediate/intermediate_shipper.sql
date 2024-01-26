{{ config (materialized='table')}}

SELECT 
  CASE WHEN shipperID IS NULL THEN 0 ELSE shipperID END AS shipperID,
  CASE WHEN companyName IS NULL THEN 'None' ELSE companyName END AS companyName,
  CASE WHEN phone IS NULL THEN 'None' ELSE phone END AS phone
FROM {{ source('NWT', 'RAW_SHIPPERS') }};




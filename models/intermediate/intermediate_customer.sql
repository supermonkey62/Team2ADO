{{ config (materialized='table')}}

SELECT 
  CASE WHEN customerID IS NULL THEN 0 ELSE customerID END AS customerID,
  CASE WHEN companyName IS NULL THEN 'None' ELSE companyName END AS companyName,
  CASE WHEN contactName IS NULL THEN 'None' ELSE contactName END AS contactName,
  CASE WHEN contactTitle IS NULL THEN 'None' ELSE contactTitle END AS contactTitle,
  CASE WHEN address IS NULL THEN 'None' ELSE address END AS address,
  CASE WHEN city IS NULL THEN 'None' ELSE city END AS city,
  CASE WHEN region IS NULL THEN 'None' ELSE region END AS region,
  CASE WHEN postalCode IS NULL THEN 0 ELSE postalCode END AS postalCode,
  CASE WHEN country IS NULL THEN 'None' ELSE country END AS country,
  CASE WHEN phone IS NULL THEN 0 ELSE phone END AS phone,
  CASE WHEN fax IS NULL THEN 0 ELSE fax END AS fax
FROM {{ source('NWT', 'RAW_CUSTOMER') }};

{{ config (materialized='table')}}

SELECT 
  CASE WHEN supplierID IS NULL THEN 0 ELSE supplierID END AS supplierID,
  CASE WHEN companyName IS NULL THEN 'None' ELSE companyName END AS companyName,
  CASE WHEN contactName IS NULL THEN 'None' ELSE contactName END AS contactName,
  CASE WHEN contactTitle IS NULL THEN 'None' ELSE contactTitle END AS contactTitle,
  CASE WHEN address IS NULL THEN 'None' ELSE address END AS address,
  CASE WHEN city IS NULL THEN 'None' ELSE city END AS city,
  CASE WHEN region IS NULL THEN 'None' ELSE region END AS region,
  CASE WHEN postalCode IS NULL THEN 'None' ELSE postalCode END AS postalCode,
  CASE WHEN country IS NULL THEN 'None' ELSE country END AS country,
  CASE WHEN phone IS NULL THEN 'None' ELSE phone END AS phone,
  CASE WHEN fax IS NULL THEN 'None' ELSE fax END AS fax,
  CASE WHEN homePage IS NULL THEN 'None' ELSE homePage END AS homePage

FROM {{ source('NWT', 'RAW_SUPPLIER') }}

UNION ALL

SELECT
  CASE WHEN supplierID IS NULL THEN 0 ELSE supplierID END AS supplierID,
  CASE WHEN companyName = 'NULL' THEN 'None' ELSE companyName END AS companyName,
  CASE WHEN contactName = 'NULL' THEN 'None' ELSE contactName END AS contactName,
  CASE WHEN contactTitle = 'NULL' THEN 'None' ELSE contactTitle END AS contactTitle,
  CASE WHEN address = 'NULL' THEN 'None' ELSE address END AS address,
  CASE WHEN city = 'NULL' THEN 'None' ELSE city END AS city,
  CASE WHEN region = 'NULL' THEN 'None' ELSE region END AS region,
  CASE WHEN postalCode = 'NULL' THEN 'None' ELSE postalCode END AS postalCode,
  CASE WHEN country = 'NULL' THEN 'None' ELSE country END AS country,
  CASE WHEN phone = 'NULL' THEN 'None' ELSE phone END AS phone,
  CASE WHEN fax = 'NULL' THEN 'None' ELSE fax END AS fax,
  CASE WHEN homePage = 'NULL' THEN 'None' ELSE homePage END AS homePage

FROM {{ source('NWT', 'RAW_SUPPLIER') }}

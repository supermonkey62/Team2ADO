{{ config (materialized='table')}}

SELECT 
  CASE WHEN customerID IS NULL OR TRIM(customerID) LIKE 'NULL' THEN 'None' ELSE customerID END AS customerID,
  CASE WHEN companyName IS NULL OR TRIM(companyName) LIKE 'NULL' THEN 'None' ELSE companyName END AS companyName,
  CASE WHEN contactName IS NULL OR TRIM(contactName) LIKE 'NULL' THEN 'None' ELSE contactName END AS contactName,
  CASE WHEN contactTitle IS NULL OR TRIM(contactTitle) LIKE 'NULL' THEN 'None' ELSE contactTitle END AS contactTitle,
  CASE WHEN address IS NULL OR TRIM(address) LIKE 'NULL' THEN 'None' ELSE address END AS address,
  CASE WHEN city IS NULL OR TRIM(city) LIKE 'NULL' THEN 'None' ELSE city END AS city,
  CASE WHEN region IS NULL OR TRIM(region) LIKE 'NULL' THEN 'None' ELSE region END AS region,
  CASE WHEN postalCode IS NULL OR TRIM(postalCode) LIKE 'NULL' THEN 'None' ELSE postalCode END AS postalCode,
  CASE WHEN country IS NULL OR TRIM(country) LIKE 'NULL' THEN 'None' ELSE country END AS country,
  CASE WHEN phone IS NULL OR TRIM(phone) LIKE 'NULL' THEN 'None' ELSE phone END AS phone,
  CASE WHEN fax IS NULL OR TRIM(fax) LIKE 'NULL' THEN 'None' ELSE fax END AS fax

FROM {{ source('NWT', 'RAW_CUSTOMER') }}

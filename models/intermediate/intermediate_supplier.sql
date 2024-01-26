{{ config(materialized='table') }}

SELECT DISTINCT
  CASE 
    WHEN supplierID < 0 THEN 0 
    ELSE supplierID 
  END AS supplierID,
  CASE 
    WHEN UPPER(TRIM(companyName)) = 'NULL' THEN 'None' 
    ELSE TRIM(companyName) 
  END AS companyName,
  CASE 
    WHEN UPPER(TRIM(contactName)) = 'NULL' THEN 'None' 
    ELSE TRIM(contactName) 
  END AS contactName,
  CASE 
    WHEN UPPER(TRIM(contactTitle)) = 'NULL' THEN 'None' 
    ELSE TRIM(contactTitle) 
  END AS contactTitle,
  CASE 
    WHEN UPPER(TRIM(address)) = 'NULL' THEN 'None' 
    ELSE TRIM(address) 
  END AS address,
  CASE 
    WHEN UPPER(TRIM(city)) = 'NULL' THEN 'None' 
    ELSE TRIM(city) 
  END AS city,
  CASE 
    WHEN UPPER(TRIM(region)) = 'NULL' THEN 'None' 
    ELSE TRIM(region) 
  END AS region,
  CASE 
    WHEN UPPER(TRIM(postalCode)) = 'NULL' THEN 'None' 
    ELSE TRIM(postalCode) 
  END AS postalCode,
  CASE 
    WHEN UPPER(TRIM(country)) = 'NULL' THEN 'None' 
    ELSE TRIM(country) 
  END AS country,
  CASE 
    WHEN UPPER(TRIM(phone)) = 'NULL' THEN 'None' 
    ELSE TRIM(phone) 
  END AS phone,
  CASE 
    WHEN UPPER(TRIM(fax)) = 'NULL' THEN 'None' 
    ELSE TRIM(fax) 
  END AS fax,
  CASE 
    WHEN UPPER(TRIM(homePage)) = 'NULL' THEN 'None' 
    ELSE TRIM(homePage) 
  END AS homePage
FROM {{ source('NWT', 'RAW_SUPPLIER') }}

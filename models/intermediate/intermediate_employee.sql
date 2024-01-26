{{ config (materialized='table')}}

SELECT 
  CASE WHEN employeeID IS NULL THEN 0 ELSE employeeID END AS employeeID,
  CASE WHEN lastName IS NULL THEN 'None' ELSE lastName END AS lastName,
  CASE WHEN firstName IS NULL THEN 'None' ELSE firstName END AS firstName,
  CASE WHEN title IS NULL THEN 'None' ELSE title END AS title,
  CASE WHEN titleOfCourtesy IS NULL THEN 'None' ELSE titleOfCourtesy END AS titleOfCourtesy,
  CASE WHEN birthDate IS NULL THEN TO_DATE('09-99-9999', 'MM-DD-YYYY') ELSE birthDate END AS birthDate,
  CASE WHEN hireDate IS NULL THEN TO_DATE('09-99-9999', 'MM-DD-YYYY') ELSE hireDate END AS hireDate,
  CASE WHEN address IS NULL THEN 'None' ELSE address END AS address,
  CASE WHEN city IS NULL THEN 'None' ELSE city END AS city,
  CASE WHEN region IS NULL THEN 'None' ELSE region END AS region,
  CASE WHEN postalCode IS NULL THEN 'None' ELSE postalCode END AS postalCode,
  CASE WHEN country IS NULL THEN 'None' ELSE country END AS country,
  CASE WHEN homePhone IS NULL THEN 'None' ELSE homePhone END AS homePhone,
  CASE WHEN extension IS NULL THEN 0 ELSE extension END AS extension,
  CASE WHEN photo IS NULL THEN 'None' ELSE photo END AS photo,
  CASE WHEN notes IS NULL THEN 'None' ELSE notes END AS notes,
  CASE WHEN reportsTo IS NULL THEN 0 ELSE reportsTo END AS reportsTo,
  CASE WHEN photoPath IS NULL THEN 'None' ELSE photoPath END AS photoPath
  
FROM {{ source('NWT', 'RAW_EMPLOYEE') }}

UNION ALL

SELECT 
  CASE WHEN employeeID IS NULL THEN 0 ELSE employeeID END AS employeeID,
  CASE WHEN lastName = 'NULL' THEN 'None' ELSE lastName END AS lastName,
  CASE WHEN firstName = 'NULL' THEN 'None' ELSE firstName END AS firstName,
  CASE WHEN title = 'NULL' THEN 'None' ELSE title END AS title,
  CASE WHEN titleOfCourtesy = 'NULL' THEN 'None' ELSE titleOfCourtesy END AS titleOfCourtesy,
  CASE WHEN birthDate IS NULL THEN TO_DATE('09-99-9999', 'MM-DD-YYYY') ELSE birthDate END AS birthDate,
  CASE WHEN hireDate IS NULL THEN TO_DATE('09-99-9999', 'MM-DD-YYYY') ELSE hireDate END AS hireDate,
  CASE WHEN address = 'NULL' THEN 'None' ELSE address END AS address,
  CASE WHEN city = 'NULL' THEN 'None' ELSE city END AS city,
  CASE WHEN region = 'NULL' THEN 'None' ELSE region END AS region,
  CASE WHEN postalCode = 'NULL' THEN 'None' ELSE postalCode END AS postalCode,
  CASE WHEN country = 'NULL' THEN 'None' ELSE country END AS country,
  CASE WHEN homePhone = 'NULL' THEN 'None' ELSE homePhone END AS homePhone,
  CASE WHEN extension IS NULL THEN 0 ELSE extension END AS extension,
  CASE WHEN photo = 'NULL' THEN 'None' ELSE photo END AS photo,
  CASE WHEN notes = 'NULL' THEN 'None' ELSE notes END AS notes,
  CASE WHEN reportsTo IS NULL THEN 0 ELSE reportsTo END AS reportsTo,
  CASE WHEN photoPath = 'NULL' THEN 'None' ELSE photoPath END AS photoPath

FROM {{ source('NWT', 'RAW_EMPLOYEE') }}
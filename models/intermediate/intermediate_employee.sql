{{ config (materialized='table')}}

SELECT 
  CASE WHEN employeeID IS NULL OR LOWER(employeeID) = 'null' THEN 0 ELSE employeeID END AS employeeID,
  CASE WHEN lastName IS NULL OR LOWER(lastName) = 'null' THEN 'None' ELSE lastName END AS lastName,
  CASE WHEN firstName IS NULL OR LOWER(firstName) = 'null' THEN 'None' ELSE firstName END AS firstName,
  CASE WHEN title IS NULL OR LOWER(title) = 'null' THEN 'None' ELSE title END AS title,
  CASE WHEN titleOfCourtesy IS NULL OR LOWER(titleOfCourtesy) = 'null' THEN 'None' ELSE titleOfCourtesy END AS titleOfCourtesy,
  CASE WHEN birthDate IS NULL OR LOWER(birthDate) = 'null' THEN TO_DATE('09-99-9999', 'MM-DD-YYYY') ELSE birthDate END AS birthDate,
  CASE WHEN hireDate IS NULL OR LOWER(hireDate) = 'null' THEN TO_DATE('09-99-9999', 'MM-DD-YYYY') ELSE hireDate END AS hireDate,
  CASE WHEN address IS NULL OR LOWER(address) = 'null' THEN 'None' ELSE address END AS address,
  CASE WHEN city IS NULL OR LOWER(city) = 'null' THEN 'None' ELSE city END AS city,
  CASE WHEN region IS NULL OR LOWER(region) = 'null' THEN 'None' ELSE region END AS region,
  CASE WHEN postalCode IS NULL OR LOWER(postalCode) = 'null' THEN 'None' ELSE postalCode END AS postalCode,
  CASE WHEN country IS NULL OR LOWER(country) = 'null' THEN 'None' ELSE country END AS country,
  CASE WHEN homePhone IS NULL OR LOWER(homePhone) = 'null' THEN 'None' ELSE homePhone END AS homePhone,
  CASE WHEN extension IS NULL OR LOWER(extension) = 'null' THEN 0 ELSE extension END AS extension,
  CASE WHEN photo IS NULL OR LOWER(photo) = 'null' THEN 'None' ELSE photo END AS photo,
  CASE WHEN notes IS NULL OR LOWER(notes) = 'null' THEN 'None' ELSE notes END AS notes,
  CASE WHEN reportsTo IS NULL OR LOWER(reportsTo) = 'null' THEN 0 ELSE reportsTo END AS reportsTo,
  CASE WHEN photoPath IS NULL OR LOWER(photoPath) = 'null' THEN 'None' ELSE photoPath END AS photoPath
  
FROM {{ source('NWT', 'RAW_EMPLOYEE') }}

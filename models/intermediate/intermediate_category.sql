{{ config (materialized='table')}}

SELECT 
  CASE WHEN categoryID IS NULL THEN 0 ELSE categoryID END AS categoryID,
  CASE WHEN categoryName IS NULL THEN 'None' ELSE categoryName END AS categoryName,
  CASE WHEN description IS NULL THEN 'None' ELSE description END AS description,
  CASE WHEN picture IS NULL THEN 'None' ELSE picture END AS picture,
FROM {{ source('NWT', 'RAW_CATEGORY') }}

SELECT 
--  CASE WHEN categoryID = 'NULL' THEN 0 ELSE categoryID END AS categoryID,
  CASE WHEN categoryName = 'NULL' THEN 'None' ELSE categoryName END AS categoryName,
  CASE WHEN description = 'NULL' THEN 'None' ELSE description END AS description,
  CASE WHEN picture = 'NULL' THEN 'None' ELSE picture END AS picture
FROM {{ source('NWT', 'RAW_CATEGORY') }}
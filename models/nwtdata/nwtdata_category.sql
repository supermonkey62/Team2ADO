{{ config (materialized='table')}}

Select *
From 
NWTDATA.NWT.CATEGORY;

SELECT *
FROM NWTDATA.NWT.CATEGORY
WHERE
  categoryID LIKE '%NULL%' OR
  categoryName LIKE '%NULL%' OR
  description LIKE '%NULL%' OR
  picture LIKE '%NULL%';





{{ config (materialized='table')}}

SELECT 
  CASE WHEN productID IS NULL THEN 0 ELSE productID END AS productID,
  CASE WHEN productName IS NULL THEN 'None' ELSE productName END AS productName,
  CASE WHEN supplierID IS NULL THEN 0 ELSE supplierID END AS supplierID,
  CASE WHEN categoryID IS NULL THEN 0 ELSE categoryID END AS categoryID,
  CASE WHEN quantityPerUnit IS NULL THEN 'None' ELSE quantityPerUnit END AS quantityPerUnit,
  CASE WHEN unitPrice IS NULL THEN 0 ELSE unitPrice END AS unitPrice,
  CASE WHEN unitsInStock IS NULL THEN 0 ELSE unitsInStock END AS unitsInStock,
  CASE WHEN unitsOnOrder IS NULL THEN 0 ELSE unitsOnOrder END AS unitsOnOrder,
  CASE WHEN reorderLevel IS NULL THEN 0 ELSE reorderLevel END AS reorderLevel,
  CASE WHEN discontinued IS NULL THEN 0 ELSE discontinued END AS discontinued,
  CASE WHEN unitCost IS NULL THEN 0 ELSE unitCost END AS unitCost,

--   CASE WHEN productID = 'NULL' THEN 0 ELSE productID END AS productID,
  CASE WHEN productName = 'NULL' THEN 'None' ELSE productName END AS productName,
--   CASE WHEN supplierID = 'NULL' THEN 0 ELSE supplierID END AS supplierID,
--   CASE WHEN categoryID = 'NULL' THEN 0 ELSE categoryID END AS categoryID,
--   CASE WHEN quantityPerUnit = 'NULL' THEN 'None' ELSE quantityPerUnit END AS quantityPerUnit,
--   CASE WHEN unitPrice = 'NULL' THEN 0 ELSE unitPrice END AS unitPrice,
--   CASE WHEN unitsInStock = 'NULL' THEN 0 ELSE unitsInStock END AS unitsInStock,
--   CASE WHEN unitsOnOrder = 'NULL' THEN 0 ELSE unitsOnOrder END AS unitsOnOrder,
--   CASE WHEN reorderLevel = 'NULL' THEN 0 ELSE reorderLevel END AS reorderLevel,
--   CASE WHEN discontinued = 'NULL' THEN 0 ELSE discontinued END AS discontinued,
--   CASE WHEN unitCost = 'NULL' THEN 0 ELSE unitCost END AS unitCost

FROM {{ source('NWT', 'RAW_PRODUCT') }}

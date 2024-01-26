{{ config (materialized='table')}}

SELECT 
  CASE WHEN orderID IS NULL THEN 0 ELSE orderID END AS orderID,
  CASE WHEN productID IS NULL THEN 0 ELSE productID END AS productID,
  CASE WHEN unitPrice IS NULL THEN 0 ELSE unitPrice END AS unitPrice,
  CASE WHEN quantity IS NULL THEN 0 ELSE quantity END AS quantity,
  CASE WHEN discount IS NULL THEN 0 ELSE discount END AS discount,

--   CASE WHEN orderID = 'NULL' THEN 0 ELSE orderID END AS orderID,
--   CASE WHEN productID = 'NULL' THEN 0 ELSE productID END AS productID,
--   CASE WHEN unitPrice = 'NULL' THEN 0 ELSE unitPrice END AS unitPrice,
--   CASE WHEN quantity = 'NULL' THEN 0 ELSE quantity END AS quantity,
--   CASE WHEN discount = 'NULL' THEN 0 ELSE discount END AS discount

FROM {{ source('NWT', 'RAW_ORDER_DETAIL_FRESH') }}



-- {{ config(materialized='view') }}

-- Delete rows where orderID is null
-- DELETE FROM NWTDATA.NWT.RAW_ORDER
-- WHERE orderID IS NULL

-- SELECT
--  'shipRegion' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_ORDER
-- WHERE IFNULL(shipRegion, '') LIKE '%NULL%'
-- UNION ALL

-- SELECT
--  'shipPostalCode' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_ORDER
-- WHERE IFNULL(shipPostalCode, '') LIKE '%NULL%'
-- UNION ALL

-- SELECT
--  'shippedDate' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_ORDER
-- WHERE IFNULL(shippedDate, '9/9/9999') LIKE '%NULL%'
-- UNION ALL
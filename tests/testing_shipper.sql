-- SELECT *
-- FROM NWTDATA.NWT.SHIPPER
-- WHERE
--   shipperID LIKE '%NULL%' OR
--   companyName LIKE '%NULL%' OR
--   phone LIKE '%NULL%';


SELECT
  'shipperID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.SHIPPER
WHERE shipperID LIKE '%NULL%'
UNION ALL
SELECT
  'companyName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.SHIPPER
WHERE companyName LIKE '%NULL%'
UNION ALL
SELECT
  'phone' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.SHIPPER
WHERE phone LIKE '%NULL%';

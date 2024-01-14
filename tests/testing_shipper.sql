SELECT
  'shipperID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SHIPPER
WHERE shipperID LIKE '%NULL%'
UNION ALL
SELECT
  'companyName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SHIPPER
WHERE companyName LIKE '%NULL%'
UNION ALL
SELECT
  'phone' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SHIPPER
WHERE phone LIKE '%NULL%';

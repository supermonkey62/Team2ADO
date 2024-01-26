SELECT
  'shipperID' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_SHIPPER
WHERE shipperID LIKE '%NULL%' OR shipperID IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'companyName' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_SHIPPER
WHERE companyName LIKE '%NULL%' OR companyName IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'phone' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_SHIPPER
WHERE phone LIKE '%NULL%' OR phone IS NULL
HAVING COUNT(*) > 0

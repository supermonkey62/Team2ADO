SELECT
  'supplierID' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE supplierID LIKE '%NULL%' OR supplierID IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'companyName' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE companyName LIKE '%NULL%' OR companyName IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'contactName' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE contactName LIKE '%NULL%' OR contactName IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'contactTitle' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE contactTitle LIKE '%NULL%' OR contactTitle IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'address' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE address LIKE '%NULL%' OR address IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'city' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE city LIKE '%NULL%' OR city IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'region' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE region LIKE '%NULL%' OR region IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'postalCode' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE postalCode LIKE '%NULL%' OR postalCode IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'country' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE country LIKE '%NULL%' OR country IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'phone' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE phone LIKE '%NULL%' OR phone IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'fax' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE fax LIKE '%NULL%' OR fax IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'homePage' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE homePage LIKE '%NULL%' OR homePage IS NULL
HAVING COUNT(*) > 0

SELECT
  'customerID' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.INTERMEDIATE_CUSTOMER
WHERE customerID LIKE '%NULL%' OR customerID IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'companyName' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.INTERMEDIATE_CUSTOMER
WHERE companyName LIKE '%NULL%' OR companyName IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'contactName' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.INTERMEDIATE_CUSTOMER
WHERE contactName LIKE '%NULL%' OR contactName IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'contactTitle' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.INTERMEDIATE_CUSTOMER
WHERE contactTitle LIKE '%NULL%' OR contactTitle IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'address' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.INTERMEDIATE_CUSTOMER
WHERE address LIKE '%NULL%' OR address IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'city' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.INTERMEDIATE_CUSTOMER
WHERE city LIKE '%NULL%' OR city IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'region' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.INTERMEDIATE_CUSTOMER
WHERE region LIKE '%NULL%' OR region IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'postalCode' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.INTERMEDIATE_CUSTOMER
WHERE postalCode LIKE '%NULL%' OR postalCode IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'country' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.INTERMEDIATE_CUSTOMER
WHERE country LIKE '%NULL%' OR country IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'phone' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.INTERMEDIATE_CUSTOMER
WHERE phone LIKE '%NULL%' OR phone IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'fax' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.INTERMEDIATE_CUSTOMER
WHERE fax LIKE '%NULL%' OR fax IS NULL
HAVING COUNT(*) > 0


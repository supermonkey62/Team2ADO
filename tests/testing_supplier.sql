SELECT
  'supplierID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE supplierID LIKE '%NULL%'
UNION ALL
SELECT
  'companyName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE companyName LIKE '%NULL%'
UNION ALL
SELECT
  'contactName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE contactName LIKE '%NULL%'
UNION ALL
SELECT
  'contactTitle' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE contactTitle LIKE '%NULL%'
UNION ALL
SELECT
  'address' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE address LIKE '%NULL%'
UNION ALL
SELECT
  'city' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE city LIKE '%NULL%'
UNION ALL
SELECT
  'region' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE region LIKE '%NULL%'
UNION ALL
SELECT
  'postalCode' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE postalCode LIKE '%NULL%'
UNION ALL
SELECT
  'country' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE country LIKE '%NULL%'
UNION ALL
SELECT
  'phone' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE phone LIKE '%NULL%'
UNION ALL
SELECT
  'fax' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE fax LIKE '%NULL%'
UNION ALL
SELECT
  'homePage' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE homePage LIKE '%NULL%';

SELECT
  'supplierID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE supplierID IS NULL
UNION ALL
SELECT
  'companyName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE companyName IS NULL
UNION ALL
SELECT
  'contactName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE contactName IS NULL
UNION ALL
SELECT
  'contactTitle' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE contactTitle IS NULL
UNION ALL
SELECT
  'address' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE address IS NULL
UNION ALL
SELECT
  'city' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE city IS NULL
UNION ALL
SELECT
  'region' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE region IS NULL
UNION ALL
SELECT
  'postalCode' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE postalCode IS NULL
UNION ALL
SELECT
  'country' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE country IS NULL
UNION ALL
SELECT
  'phone' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE phone IS NULL
UNION ALL
SELECT
  'fax' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE fax IS NULL
UNION ALL
SELECT
  'homePage' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_SUPPLIER
WHERE homePage IS NULL;


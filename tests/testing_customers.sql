SELECT
  'customerID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE customerID LIKE '%NULL%'
UNION ALL
SELECT
  'companyName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE companyName LIKE '%NULL%'
UNION ALL
SELECT
  'contactName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE contactName LIKE '%NULL%'
UNION ALL
SELECT
  'contactTitle' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE contactTitle LIKE '%NULL%'
UNION ALL
SELECT
  'address' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE address LIKE '%NULL%'
UNION ALL
SELECT
  'city' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE city LIKE '%NULL%'
UNION ALL
SELECT
  'region' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE region LIKE '%NULL%'
UNION ALL
SELECT
  'postalCode' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE postalCode LIKE '%NULL%'
UNION ALL
SELECT
  'country' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE country LIKE '%NULL%'
UNION ALL
SELECT
  'phone' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE phone LIKE '%NULL%'
UNION ALL
SELECT
  'fax' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE fax LIKE '%NULL%';


SELECT
  'customerID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE customerID IS NULL
UNION ALL
SELECT
  'companyName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE companyName IS NULL
UNION ALL
SELECT
  'contactName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE contactName IS NULL
UNION ALL
SELECT
  'contactTitle' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE contactTitle IS NULL
UNION ALL
SELECT
  'address' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE address IS NULL
UNION ALL
SELECT
  'city' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE city IS NULL
UNION ALL
SELECT
  'region' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE region IS NULL
UNION ALL
SELECT
  'postalCode' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE postalCode IS NULL
UNION ALL
SELECT
  'country' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE country IS NULL
UNION ALL
SELECT
  'phone' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE phone IS NULL
UNION ALL
SELECT
  'fax' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMER
WHERE fax IS NULL;

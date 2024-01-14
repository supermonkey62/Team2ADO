SELECT
  'customerID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMERS
WHERE customerID LIKE '%NULL%'
UNION ALL
SELECT
  'companyName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMERS
WHERE companyName LIKE '%NULL%'
UNION ALL
SELECT
  'contactName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMERS
WHERE contactName LIKE '%NULL%'
UNION ALL
SELECT
  'contactTitle' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMERS
WHERE contactTitle LIKE '%NULL%'
UNION ALL
SELECT
  'address' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMERS
WHERE address LIKE '%NULL%'
UNION ALL
SELECT
  'city' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMERS
WHERE city LIKE '%NULL%'
UNION ALL
SELECT
  'region' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMERS
WHERE region LIKE '%NULL%'
UNION ALL
SELECT
  'postalCode' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMERS
WHERE postalCode LIKE '%NULL%'
UNION ALL
SELECT
  'country' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMERS
WHERE country LIKE '%NULL%'
UNION ALL
SELECT
  'phone' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMERS
WHERE phone LIKE '%NULL%'
UNION ALL
SELECT
  'fax' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CUSTOMERS
WHERE fax LIKE '%NULL%';


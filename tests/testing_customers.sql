-- SELECT *
-- FROM NWTDATA.NWT.CUSTOMERS
-- WHERE
--   customerID LIKE '%NULL%' OR
--   companyName LIKE '%NULL%' OR
--   contactName LIKE '%NULL%' OR
--   contactTitle LIKE '%NULL%' OR
--   address LIKE '%NULL%' OR
--   city LIKE '%NULL%' OR
--   region LIKE '%NULL%' OR
--   postalCode LIKE '%NULL%' OR
--   country LIKE '%NULL%' OR
--   phone LIKE '%NULL%' OR
--   fax LIKE '%NULL%';

SELECT
  'customerID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE customerID LIKE '%NULL%'
UNION ALL
SELECT
  'companyName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE companyName LIKE '%NULL%'
UNION ALL
SELECT
  'contactName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE contactName LIKE '%NULL%'
UNION ALL
SELECT
  'contactTitle' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE contactTitle LIKE '%NULL%'
UNION ALL
SELECT
  'address' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE address LIKE '%NULL%'
UNION ALL
SELECT
  'city' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE city LIKE '%NULL%'
UNION ALL
SELECT
  'region' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE region LIKE '%NULL%'
UNION ALL
SELECT
  'postalCode' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE postalCode LIKE '%NULL%'
UNION ALL
SELECT
  'country' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE country LIKE '%NULL%'
UNION ALL
SELECT
  'phone' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE phone LIKE '%NULL%'
UNION ALL
SELECT
  'fax' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE fax LIKE '%NULL%';


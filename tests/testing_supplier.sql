SELECT
  'supplierID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.SUPPLIER
WHERE supplierID LIKE '%NULL%'
UNION ALL
SELECT
  'companyName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.SUPPLIER
WHERE companyName LIKE '%NULL%'
UNION ALL
SELECT
  'contactName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.SUPPLIER
WHERE contactName LIKE '%NULL%'
UNION ALL
SELECT
  'contactTitle' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.SUPPLIER
WHERE contactTitle LIKE '%NULL%'
UNION ALL
SELECT
  'address' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.SUPPLIER
WHERE address LIKE '%NULL%'
UNION ALL
SELECT
  'city' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.SUPPLIER
WHERE city LIKE '%NULL%'
UNION ALL
SELECT
  'region' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.SUPPLIER
WHERE region LIKE '%NULL%'
UNION ALL
SELECT
  'postalCode' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.SUPPLIER
WHERE postalCode LIKE '%NULL%'
UNION ALL
SELECT
  'country' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.SUPPLIER
WHERE country LIKE '%NULL%'
UNION ALL
SELECT
  'phone' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.SUPPLIER
WHERE phone LIKE '%NULL%'
UNION ALL
SELECT
  'fax' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.SUPPLIER
WHERE fax LIKE '%NULL%'
UNION ALL
SELECT
  'homePage' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.SUPPLIER
WHERE homePage LIKE '%NULL%';

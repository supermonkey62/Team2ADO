SELECT
  'orderID' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.ORDERS WHERE orderID IS NULL
UNION ALL
SELECT
  'customerID' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.ORDERS WHERE customerID IS NULL
UNION ALL
SELECT
  'employeeID' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.ORDERS WHERE employeeID IS NULL
UNION ALL
SELECT
  'orderDate' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.ORDERS WHERE orderDate IS NULL
UNION ALL
SELECT
  'requiredDate' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.ORDERS WHERE requiredDate IS NULL
UNION ALL
SELECT
  'shippedDate' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.ORDERS WHERE shippedDate IS NULL
UNION ALL
SELECT
  'shipVia' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.ORDERS WHERE shipVia IS NULL
UNION ALL
SELECT
  'freight' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.ORDERS WHERE freight IS NULL
UNION ALL
SELECT
  'shipName' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.ORDERS WHERE shipName IS NULL
UNION ALL
SELECT
  'shipAddress' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.ORDERS WHERE shipAddress IS NULL
UNION ALL
SELECT
  'shipCity' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.ORDERS WHERE shipCity IS NULL
UNION ALL
SELECT
  'shipRegion' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.ORDERS WHERE shipRegion IS NULL
UNION ALL
SELECT
  'shipPostalCode' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.ORDERS WHERE shipPostalCode IS NULL
UNION ALL
SELECT
  'shipCountry' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.ORDERS WHERE shipCountry IS NULL;

DELETE FROM NWTDATA.NWT.ORDER_DETAIL
WHERE orderID IS NULL;

-- SELECT *
-- FROM NWTDATA.NWT.ORDERS
-- WHERE
--   orderID LIKE '%NULL%' OR
--   customerID LIKE '%NULL%' OR
--   employeeID LIKE '%NULL%' OR
--   orderDate LIKE '%NULL%' OR
--   requiredDate LIKE '%NULL%' OR
--   shippedDate LIKE '%NULL%' OR
--   shipVia LIKE '%NULL%' OR
--   freight LIKE '%NULL%' OR
--   shipName LIKE '%NULL%' OR
--   shipAddress LIKE '%NULL%' OR
--   shipCity LIKE '%NULL%' OR
--   shipRegion LIKE '%NULL%' OR
--   shipPostalCode LIKE '%NULL%' OR
--   shipCountry LIKE '%NULL%';

SELECT
  'orderID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDERS
WHERE orderID LIKE '%NULL%'
UNION ALL
SELECT
  'customerID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDERS
WHERE customerID LIKE '%NULL%'
UNION ALL
SELECT
  'employeeID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDERS
WHERE employeeID LIKE '%NULL%'
UNION ALL
SELECT
  'orderDate' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDERS
WHERE orderDate LIKE '%NULL%'
UNION ALL
SELECT
  'requiredDate' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDERS
WHERE requiredDate LIKE '%NULL%'
UNION ALL
SELECT
  'shippedDate' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDERS
WHERE shippedDate LIKE '%NULL%'
UNION ALL
SELECT
  'shipVia' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDERS
WHERE shipVia LIKE '%NULL%'
UNION ALL
SELECT
  'freight' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDERS
WHERE freight LIKE '%NULL%'
UNION ALL
SELECT
  'shipName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDERS
WHERE shipName LIKE '%NULL%'
UNION ALL
SELECT
  'shipAddress' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDERS
WHERE shipAddress LIKE '%NULL%'
UNION ALL
SELECT
  'shipCity' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDERS
WHERE shipCity LIKE '%NULL%'
UNION ALL
SELECT
  'shipRegion' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDERS
WHERE shipRegion LIKE '%NULL%'
UNION ALL
SELECT
  'shipPostalCode' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDERS
WHERE shipPostalCode LIKE '%NULL%'
UNION ALL
SELECT
  'shipCountry' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDERS
WHERE shipCountry LIKE '%NULL%';


SELECT
  'orderID' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.RAW_ORDER WHERE orderID IS NULL
UNION ALL
SELECT
  'customerID' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.RAW_ORDER WHERE customerID IS NULL
UNION ALL
SELECT
  'employeeID' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.RAW_ORDER WHERE employeeID IS NULL
UNION ALL
SELECT
  'orderDate' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.RAW_ORDER WHERE orderDate IS NULL
UNION ALL
SELECT
  'requiredDate' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.RAW_ORDER WHERE requiredDate IS NULL
UNION ALL
SELECT
  'shippedDate' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.RAW_ORDER WHERE shippedDate IS NULL
UNION ALL
SELECT
  'shipVia' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.RAW_ORDER WHERE shipVia IS NULL
UNION ALL
SELECT
  'freight' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.RAW_ORDER WHERE freight IS NULL
UNION ALL
SELECT
  'shipName' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.RAW_ORDER WHERE shipName IS NULL
UNION ALL
SELECT
  'shipAddress' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.RAW_ORDER WHERE shipAddress IS NULL
UNION ALL
SELECT
  'shipCity' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.RAW_ORDER WHERE shipCity IS NULL
UNION ALL
SELECT
  'shipRegion' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.RAW_ORDER WHERE shipRegion IS NULL
UNION ALL
SELECT
  'shipPostalCode' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.RAW_ORDER WHERE shipPostalCode IS NULL
UNION ALL
SELECT
  'shipCountry' AS column_name, COUNT(*) AS null_count FROM NWTDATA.NWT.RAW_ORDER WHERE shipCountry IS NULL;

DELETE FROM NWTDATA.NWT.RAW_ORDER_DETAIL
WHERE orderID IS NULL;


SELECT
  'orderID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE orderID LIKE '%NULL%'
UNION ALL
SELECT
  'customerID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE customerID LIKE '%NULL%'
UNION ALL
SELECT
  'employeeID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE employeeID LIKE '%NULL%'
UNION ALL
SELECT
  'orderDate' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE orderDate LIKE '%NULL%'
UNION ALL
SELECT
  'requiredDate' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE requiredDate LIKE '%NULL%'
UNION ALL
SELECT
  'shippedDate' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE shippedDate LIKE '%NULL%'
UNION ALL
SELECT
  'shipVia' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE shipVia LIKE '%NULL%'
UNION ALL
SELECT
  'freight' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE freight LIKE '%NULL%'
UNION ALL
SELECT
  'shipName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE shipName LIKE '%NULL%'
UNION ALL
SELECT
  'shipAddress' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE shipAddress LIKE '%NULL%'
UNION ALL
SELECT
  'shipCity' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE shipCity LIKE '%NULL%'
UNION ALL
SELECT
  'shipRegion' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE shipRegion LIKE '%NULL%'
UNION ALL
SELECT
  'shipPostalCode' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE shipPostalCode LIKE '%NULL%'
UNION ALL
SELECT
  'shipCountry' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE shipCountry LIKE '%NULL%';

SELECT *
FROM NWTDATA.NWT.RAW_ORDER
WHERE
  orderID IS NULL OR
  customerID IS NULL OR
  employeeID IS NULL OR
  orderDate IS NULL OR
  requiredDate IS NULL OR
  shippedDate IS NULL OR
  shipVia IS NULL OR
  freight IS NULL OR
  shipName IS NULL OR
  shipAddress IS NULL OR
  shipCity IS NULL OR
  shipRegion IS NULL OR
  shipPostalCode IS NULL OR
  shipCountry IS NULL;

  


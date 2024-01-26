SELECT
  'orderID' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE orderID LIKE '%NULL%' OR orderID IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'customerID' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE customerID LIKE '%NULL%' OR customerID IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'employeeID' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE employeeID LIKE '%NULL%' OR employeeID IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'orderDate' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE orderDate LIKE '%NULL%' OR orderDate IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'requiredDate' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE requiredDate LIKE '%NULL%' OR requiredDate IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'shippedDate' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE shippedDate LIKE '%NULL%' OR shippedDate IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'shipVia' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE shipVia LIKE '%NULL%' OR shipVia IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'freight' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE freight LIKE '%NULL%' OR freight IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'shipName' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE shipName LIKE '%NULL%' OR shipName IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'shipAddress' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE shipAddress LIKE '%NULL%' OR shipAddress IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'shipCity' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE shipCity LIKE '%NULL%' OR shipCity IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'shipRegion' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE shipRegion LIKE '%NULL%' OR shipRegion IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'shipPostalCode' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE shipPostalCode LIKE '%NULL%' OR shipPostalCode IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'shipCountry' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER
WHERE shipCountry LIKE '%NULL%' OR shipCountry IS NULL
HAVING COUNT(*) > 0

{{ config (materialized='table')}}
Select *
FROM
NWTDATA.NWT.ORDERS;


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

DELETE FROM NWTDATA.NWT.ORDERS
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


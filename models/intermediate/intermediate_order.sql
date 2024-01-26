 {{ config(materialized='incremental', unique_key='ORDERID') }}

SELECT 
  CASE WHEN orderID IS NULL THEN 0 ELSE orderID END AS orderID,
  CASE WHEN customerID IS NULL THEN 'None' ELSE customerID END AS customerID,
  CASE WHEN employeeID IS NULL THEN 0 ELSE employeeID END AS employeeID,
  CASE WHEN orderDate IS NULL THEN TO_DATE('09-09-9999', 'MM-DD-YYYY') ELSE orderDate END AS orderDate,
  CASE WHEN requiredDate IS NULL THEN TO_DATE('09-09-9999', 'MM-DD-YYYY') ELSE requiredDate END AS requiredDate,
  CASE WHEN shippedDate IS NULL THEN TO_DATE('09-09-9999', 'MM-DD-YYYY') ELSE shippedDate END AS shippedDate,
  CASE WHEN shipVia IS NULL THEN 0 ELSE shipVia END AS shipVia,
  CASE WHEN freight IS NULL THEN 0 ELSE freight END AS freight,
  CASE WHEN shipName IS NULL THEN 'None' ELSE shipName END AS shipName,
  CASE WHEN shipAddress IS NULL THEN 'None' ELSE shipAddress END AS shipAddress,
  CASE WHEN shipCity IS NULL THEN 'None' ELSE shipCity END AS shipCity,
  CASE WHEN shipRegion IS NULL THEN 'None' ELSE shipRegion END AS shipRegion,
  CASE WHEN shipPostalCode IS NULL THEN 'None' ELSE shipPostalCode END AS shipPostalCode,
  CASE WHEN shipCountry IS NULL THEN 'None' ELSE shipCountry END AS shipCountry,

FROM {{ source('NWT', 'RAW_ORDER_FRESH') }}

SELECT
  --CASE WHEN orderID = 'NULL' THEN 0 ELSE orderID END AS orderID,
  CASE WHEN customerID = 'NULL' THEN 'None' ELSE customerID END AS customerID,
 -- CASE WHEN employeeID = 'NULL' THEN 0 ELSE employeeID END AS employeeID,
  CASE WHEN orderDate = 'NULL' THEN TO_DATE('09-09-9999', 'MM-DD-YYYY') ELSE TO_DATE(orderDate, 'MM-DD-YYYY') END AS orderDate,
  CASE WHEN requiredDate = 'NULL' THEN TO_DATE('09-09-9999', 'MM-DD-YYYY') ELSE TO_DATE(requiredDate, 'MM-DD-YYYY') END AS requiredDate,
  CASE WHEN shippedDate = 'NULL' THEN TO_DATE('09-09-9999', 'MM-DD-YYYY') ELSE TO_DATE(shippedDate, 'MM-DD-YYYY') END AS shippedDate,
  --CASE WHEN shipVia = 'NULL' THEN 0 ELSE shipVia END AS shipVia,
  --CASE WHEN freight = 'NULL' THEN 0 ELSE freight END AS freight,
  CASE WHEN shipName = 'NULL' THEN 'None' ELSE shipName END AS shipName,
  CASE WHEN shipAddress = 'NULL' THEN 'None' ELSE shipAddress END AS shipAddress,
  CASE WHEN shipCity = 'NULL' THEN 'None' ELSE shipCity END AS shipCity,
  CASE WHEN shipRegion = 'NULL' THEN 'None' ELSE shipRegion END AS shipRegion,
  CASE WHEN shipPostalCode = 'NULL' THEN 'None' ELSE shipPostalCode END AS shipPostalCode,
  CASE WHEN shipCountry = 'NULL' THEN 'None' ELSE shipCountry END AS shipCountry

FROM {{ source('NWT', 'RAW_ORDER_FRESH') }}

 {{ config(materialized='incremental', unique_key='ORDERID') }}

SELECT 
  CASE WHEN orderID IS NULL THEN 0 ELSE orderID END AS orderID,
  CASE WHEN customerID IS NULL THEN 0 ELSE customerID END AS customerID,
  CASE WHEN employeeID IS NULL THEN 0 ELSE employeeID END AS employeeID,
  CASE WHEN orderDate IS NULL THEN 'None' ELSE orderDate END AS orderDate,
  CASE WHEN requiredDate IS NULL THEN 'None' ELSE requiredDate END AS requiredDate,
  CASE WHEN shippedDate IS NULL THEN 'None' ELSE shippedDate END AS shippedDate,
  CASE WHEN shipVia IS NULL THEN 0 ELSE shipVia END AS shipVia,
  CASE WHEN freight IS NULL THEN 0 ELSE freight END AS freight,
  CASE WHEN shipName IS NULL THEN 'None' ELSE shipName END AS shipName,
  CASE WHEN shipAddress IS NULL THEN 'None' ELSE shipAddress END AS shipAddress,
  CASE WHEN shipCity IS NULL THEN 'None' ELSE shipCity END AS shipCity,
  CASE WHEN shipRegion IS NULL THEN 'None' ELSE shipRegion END AS shipRegion,
  CASE WHEN shipPostalCode IS NULL THEN 'None' ELSE shipPostalCode END AS shipPostalCode,
  CASE WHEN shipCountry IS NULL THEN 'None' ELSE shipCountry END AS shipCountry
FROM {{ source('NWT', 'RAW_ORDER_FRESH') }}

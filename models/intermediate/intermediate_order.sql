{{ config(materialized='table') }}

SELECT 
  orderID,
  CASE 
    WHEN customerID IS NULL OR customerID = 'NULL' THEN 'None' 
    ELSE customerID 
  END AS customerID,
  CASE 
    WHEN employeeID IS NULL THEN 0 
    ELSE employeeID 
  END AS employeeID,
  CASE 
    WHEN orderDate IS NULL THEN TO_DATE('09-09-9999', 'MM-DD-YYYY') 
    ELSE orderDate 
  END AS orderDate,
  CASE 
    WHEN requiredDate IS NULL THEN TO_DATE('09-09-9999', 'MM-DD-YYYY') 
    ELSE requiredDate 
  END AS requiredDate,
  CASE 
    WHEN shippedDate IS NULL THEN TO_DATE('09-09-9999', 'MM-DD-YYYY') 
    ELSE shippedDate 
  END AS shippedDate,
  CASE 
    WHEN shipVia IS NULL THEN 0 
    ELSE shipVia 
  END AS shipVia,
  CASE 
    WHEN freight IS NULL THEN 0 
    ELSE freight 
  END AS freight,
  CASE 
    WHEN shipName IS NULL OR shipName = 'NULL' THEN 'None' 
    ELSE shipName 
  END AS shipName,
  CASE 
    WHEN shipAddress IS NULL OR shipAddress = 'NULL' THEN 'None' 
    ELSE shipAddress 
  END AS shipAddress,
  CASE 
    WHEN shipCity IS NULL OR shipCity = 'NULL' THEN 'None' 
    ELSE shipCity 
  END AS shipCity,
  CASE 
    WHEN shipRegion IS NULL OR shipRegion = 'NULL' THEN 'None' 
    ELSE shipRegion 
  END AS shipRegion,
  CASE 
    WHEN shipPostalCode IS NULL OR shipPostalCode = 'NULL' THEN 'None' 
    ELSE shipPostalCode 
  END AS shipPostalCode,
  CASE 
    WHEN shipCountry IS NULL OR shipCountry = 'NULL' THEN 'None' 
    ELSE shipCountry 
  END AS shipCountry
FROM {{ source('NWT', 'RAW_ORDER_UPDATED') }}
WHERE orderID IS NOT NULL

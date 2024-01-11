-- Delete rows where orderID is null
DELETE FROM NWTDATA.NWT.ORDERS
WHERE orderID IS NULL;

SELECT *
FROM NWTDATA.NWT.ORDERS
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
  shipCity,
  ROUND(AVG(DATEDIFF('day', orderDate, shippedDate))) AS avg_days_taken
FROM NWTDATA.NWT.ORDERS
WHERE
  shippedDate IS NOT NULL
GROUP BY shipCity;

UPDATE NWTDATA.NWT.ORDERS
SET shippedDate = orderDate + 
                  (SELECT AVG(DATEDIFF('day', orderDate, shippedDate)) 
                   FROM NWTDATA.NWT.ORDERS 
                   WHERE shipCity = ORDERS.shipCity AND shippedDate IS NOT NULL)
WHERE shippedDate IS NULL;

SELECT *
FROM NWTDATA.NWT.ORDERS
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

UPDATE NWTDATA.NWT.ORDERS
SET shipRegion = CASE 
               WHEN shipregion LIKE '%NULL%' THEN shipcountry
               ELSE shipregion
             END
WHERE shipregion LIKE '%NULL%';

UPDATE NWTDATA.NWT.ORDERS
SET shipPostalCode = CASE 
            WHEN shipPostalCode LIKE '%NULL%' THEN 'NONE'
            ELSE shipPostalCode
          END
WHERE shipPostalCode LIKE '%NULL%';
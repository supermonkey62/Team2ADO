{{ config(materialized='view') }};

Delete rows where orderID is null
DELETE FROM NWTDATA.NWT.RAW_ORDER
WHERE orderID IS NULL;

SELECT
  shipCity,
  ROUND(AVG(DATEDIFF('day', orderDate, shippedDate))) AS avg_days_taken
FROM NWTDATA.NWT.RAW_ORDER
WHERE
  shippedDate IS NOT NULL
GROUP BY shipCity;

UPDATE NWTDATA.NWT.RAW_ORDER
SET shippedDate = orderDate + 
                  (SELECT AVG(DATEDIFF('day', orderDate, shippedDate)) 
                   FROM NWTDATA.NWT.ORDERS 
                   WHERE shipCity = ORDERS.shipCity AND shippedDate IS NOT NULL)
WHERE shippedDate IS NULL;


UPDATE NWTDATA.NWT.RAW_ORDER
SET shipRegion = CASE 
               WHEN shipregion LIKE '%NULL%' THEN shipcountry
               ELSE shipregion
             END
WHERE shipregion LIKE '%NULL%';

UPDATE NWTDATA.NWT.RAW_ORDER
SET shipPostalCode = CASE 
            WHEN shipPostalCode LIKE '%NULL%' THEN 'NONE'
            ELSE shipPostalCode
          END
WHERE shipPostalCode LIKE '%NULL%';
SELECT *
FROM NWTDATA.NWT.SHIPPER
WHERE
  shipperID LIKE '%NULL%' OR
  shippcompanyNameerID LIKE '%NULL%' OR
  phone LIKE '%NULL%';
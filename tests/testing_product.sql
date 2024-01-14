SELECT
  'productID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE productID LIKE '%NULL%'
UNION ALL
SELECT
  'productName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE productName LIKE '%NULL%'
UNION ALL
SELECT
  'supplierID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE supplierID LIKE '%NULL%'
UNION ALL
SELECT
  'categoryID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE categoryID LIKE '%NULL%'
UNION ALL
SELECT
  'quantityPerUnit' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE quantityPerUnit LIKE '%NULL%'
UNION ALL
SELECT
  'unitPrice' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE unitPrice LIKE '%NULL%'
UNION ALL
SELECT
  'unitsInStock' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE unitsInStock LIKE '%NULL%'
UNION ALL
SELECT
  'unitsOnOrder' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE unitsOnOrder LIKE '%NULL%'
UNION ALL
SELECT
  'reorderLevel' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE reorderLevel LIKE '%NULL%'
UNION ALL
SELECT
  'discontinued' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE discontinued LIKE '%NULL%';


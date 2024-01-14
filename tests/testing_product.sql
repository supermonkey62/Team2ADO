SELECT *
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE unitPrice < 0 OR unitsInStock < 0 OR unitsOnOrder < 0 OR reorderLevel < 0;

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

SELECT
  'productID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE productID IS NULL
UNION ALL
SELECT
  'productName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE productName IS NULL
UNION ALL
SELECT
  'supplierID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE supplierID IS NULL
UNION ALL
SELECT
  'categoryID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE categoryID IS NULL
UNION ALL
SELECT
  'quantityPerUnit' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE quantityPerUnit IS NULL
UNION ALL
SELECT
  'unitPrice' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE unitPrice IS NULL
UNION ALL
SELECT
  'unitsInStock' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE unitsInStock IS NULL
UNION ALL
SELECT
  'unitsOnOrder' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE unitsOnOrder IS NULL
UNION ALL
SELECT
  'reorderLevel' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE reorderLevel IS NULL
UNION ALL
SELECT
  'discontinued' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE discontinued IS NULL;


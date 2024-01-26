SELECT
  'productID' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE productID LIKE '%NULL%' OR productID IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'productName' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE productName LIKE '%NULL%' OR productName IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'supplierID' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE supplierID LIKE '%NULL%' OR supplierID IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'categoryID' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE categoryID LIKE '%NULL%' OR categoryID IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'quantityPerUnit' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE quantityPerUnit LIKE '%NULL%' OR quantityPerUnit IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'unitPrice' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE unitPrice LIKE '%NULL%' OR unitPrice IS NULL OR unitPrice < 0
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'unitsInStock' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE unitsInStock LIKE '%NULL%' OR unitsInStock IS NULL OR unitsInStock < 0
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'unitsOnOrder' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE unitsOnOrder LIKE '%NULL%' OR unitsOnOrder IS NULL OR unitsOnOrder < 0
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'reorderLevel' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE reorderLevel LIKE '%NULL%' OR reorderLevel IS NULL OR reorderLevel < 0
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'discontinued' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE discontinued LIKE '%NULL%' OR discontinued IS NULL
HAVING COUNT(*) > 0

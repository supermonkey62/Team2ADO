SELECT
  'orderID' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER_DETAIL
WHERE orderID LIKE '%NULL%' OR orderID IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'productID' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER_DETAIL
WHERE productID LIKE '%NULL%' OR productID IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'unitPrice' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER_DETAIL
WHERE unitPrice LIKE '%NULL%' OR unitPrice IS NULL OR unitPrice < 0
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'quantity' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER_DETAIL
WHERE quantity LIKE '%NULL%' OR quantity IS NULL OR quantity < 0
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'discount' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_ORDER_DETAIL
WHERE discount LIKE '%NULL%' OR discount IS NULL OR discount < 0
HAVING COUNT(*) > 0
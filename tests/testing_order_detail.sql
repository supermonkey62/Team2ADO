-- SELECT orderid, COUNT(*) as count
-- FROM NWTDATA.NWT.ORDER_DETAIL
-- GROUP BY orderid
-- HAVING count > 1;

-- checking for any negative values in unitprice, quantity and discount
SELECT *
FROM NWTDATA.NWT.ORDER_DETAIL
WHERE unitPrice < 0 OR quantity < 0 OR discount < 0;

-- SELECT *
-- FROM NWTDATA.NWT.ORDER_DETAIL
-- WHERE
--   orderID LIKE '%NULL%' OR
--   productID LIKE '%NULL%' OR
--   unitPrice LIKE '%NULL%' OR
--   quantity LIKE '%NULL%' OR
--   discount LIKE '%NULL%';

  SELECT
  'orderID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDER_DETAIL
WHERE orderID LIKE '%NULL%'
UNION ALL
SELECT
  'productID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDER_DETAIL
WHERE productID LIKE '%NULL%'
UNION ALL
SELECT
  'unitPrice' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDER_DETAIL
WHERE unitPrice LIKE '%NULL%'
UNION ALL
SELECT
  'quantity' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDER_DETAIL
WHERE quantity LIKE '%NULL%'
UNION ALL
SELECT
  'discount' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.ORDER_DETAIL
WHERE discount LIKE '%NULL%';

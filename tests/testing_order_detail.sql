-- SELECT orderid, COUNT(*) as count
-- FROM NWTDATA.NWT.ORDER_DETAIL
-- GROUP BY orderid
-- HAVING count > 1;

-- checking for any negative values in unitprice, quantity and discount
SELECT *
FROM NWTDATA.NWT.ORDER_DETAIL
WHERE unitPrice < 0 OR quantity < 0 OR discount < 0;

SELECT *
FROM NWTDATA.NWT.ORDER_DETAIL
WHERE
  orderID LIKE '%NULL%' OR
  productID LIKE '%NULL%' OR
  unitPrice LIKE '%NULL%' OR
  quantity LIKE '%NULL%' OR
  discount LIKE '%NULL%';
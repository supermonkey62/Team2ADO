SELECT *
FROM NWTDATA.NWT.RAW_ORDER_DETAIL
WHERE unitPrice < 0 OR quantity < 0 OR discount < 0

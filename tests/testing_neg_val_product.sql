SELECT *
FROM NWTDATA.NWT.RAW_PRODUCT
WHERE unitPrice < 0 OR unitsInStock < 0 OR unitsOnOrder < 0 OR reorderLevel < 0

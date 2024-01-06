SELECT *
FROM NWTDATA.NWT.PRODUCT
WHERE
  productID LIKE '%NULL%' OR
  productName LIKE '%NULL%' OR
  supplierID LIKE '%NULL%' OR
  categoryID LIKE '%NULL%' OR
  quantityPerUnit LIKE '%NULL%' OR
  unitPrice LIKE '%NULL%' OR
  unitsInStock LIKE '%NULL%' OR
  unitsOnOrder LIKE '%NULL%' OR
  reorderLevel LIKE '%NULL%' OR
  discontinued LIKE '%NULL%';
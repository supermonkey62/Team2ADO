-- Update UnitCost in Product table based on values from Product_Fresh table
USE SCHEMA NWT;

UPDATE RAW_PRODUCT p
SET UnitCost = (
  SELECT RAW_PRODUCT_FRESH.UnitCost
  FROM RAW_PRODUCT_FRESH pf
  WHERE p.ProductID = pf.ProductID
)
WHERE EXISTS (
  SELECT 1
  FROM Product_Fresh pf
  WHERE p.ProductID = pf.ProductID
);

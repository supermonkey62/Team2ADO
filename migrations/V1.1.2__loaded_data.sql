-- Update UnitCost in Product table based on values from Product_Fresh table
USE SCHEMA NWT;

UPDATE Product p
SET UnitCost = (
  SELECT pf.UnitCost
  FROM Product_Fresh pf
  WHERE p.ProductID = pf.ProductID
)
WHERE EXISTS (
  SELECT 1
  FROM Product_Fresh pf
  WHERE p.ProductID = pf.ProductID
);

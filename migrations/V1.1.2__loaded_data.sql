-- Update UnitCost in Product table based on values from Product_Fresh table
USE SCHEMA NWT;

UPDATE RAW_PRODUCT p
SET UNITCOST  = (
  SELECT RAW_PRODUCT_FRESH.UNITCOST
  FROM RAW_PRODUCT_FRESH pf
  WHERE p.PRODUCTID = pf.PRODUCTID
)
WHERE EXISTS (
  SELECT 1
  FROM RAW_PRODUCT_FRESH pf
  WHERE p.PRODUCTID = pf.PRODUCTID
);

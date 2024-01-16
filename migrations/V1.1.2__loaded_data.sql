-- Update UnitCost in Product table based on values from Product_Fresh table
USE SCHEMA NWT;
UPDATE RAW_PRODUCT p
SET p.UNITCOST = (
  SELECT pf.UNITCOST
  FROM RAW_PRODUCT_FRESH pf
  WHERE p.PRODUCTID = pf.PRODUCTID
);

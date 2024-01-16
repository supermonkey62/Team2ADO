USE SCHEMA NWT;
ALTER TABLE RAW_PRODUCT ADD COLUMN Unitcost FLOAT;


-- UPDATE RAW_PRODUCT 
-- SET RAW_PRODUCT.UnitCost = pf.UnitCost
-- FROM RAW_PRODUCT AS p
-- INNER JOIN RAW_PRODUCT_FRESH AS pf
-- ON p.productID = pf.productID;

-- SELECT p.productID, p.UnitCost AS OldUnitCost, pf.UnitCost AS NewUnitCost
-- FROM RAW_PRODUCT AS p
-- INNER JOIN RAW_PRODUCT_FRESH AS pf ON p.productID = pf.productID;

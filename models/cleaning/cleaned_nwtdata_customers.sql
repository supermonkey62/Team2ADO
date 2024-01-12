{{ config(materialized='view') }};

UPDATE {{ ref('fresh_orders') }}
SET region = CASE 
               WHEN region LIKE '%NULL%' THEN country
               ELSE region
             END
WHERE region LIKE '%NULL%';

UPDATE NWTDATA.NWT.CUSTOMERS
SET postalCode = CASE 
                   WHEN postalCode LIKE '%NULL%' THEN 'NONE'
                   ELSE postalCode
                 END
WHERE postalCode LIKE '%NULL%';


-- UPDATE {{ ref('nwtdata_customers') }}
-- SET region = CASE 
--                WHEN region IS NULL THEN country
--                ELSE region
--              END
-- WHERE region IS NULL;

-- UPDATE {{ ref('nwtdata_customers') }}
-- SET postalCode = CASE 
--                    WHEN postalCode IS NULL THEN 'NONE'
--                    ELSE postalCode
--                  END
-- WHERE postalCode IS NULL;
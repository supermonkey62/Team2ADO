{{ config(materialized='view') }}

UPDATE {{ ref('raw_order_fresh') }}
SET region = CASE 
               WHEN region LIKE '%NULL%' THEN country
               ELSE region
             END
WHERE region LIKE '%NULL%'

UPDATE NWTDATA.NWT.RAW_CUSTOMER
SET postalCode = CASE 
                   WHEN postalCode LIKE '%NULL%' THEN 'NONE'
                   ELSE postalCode
                 END
WHERE postalCode LIKE '%NULL%'


-- UPDATE {{ ref('raw_customer') }}
-- SET region = CASE 
--                WHEN region IS NULL THEN country
--                ELSE region
--              END
-- WHERE region IS NULL;

-- UPDATE {{ ref('raw_customer') }}
-- SET postalCode = CASE 
--                    WHEN postalCode IS NULL THEN 'NONE'
--                    ELSE postalCode
--                  END
-- WHERE postalCode IS NULL

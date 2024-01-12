{{ config(materialized='view') }}

UPDATE NWTDATA.NWT.CUSTOMERS 
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


SELECT
  'customerID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE customerID LIKE '%NULL%'
UNION ALL
SELECT
  'companyName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE companyName LIKE '%NULL%'
UNION ALL
SELECT
  'contactName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE contactName LIKE '%NULL%'
UNION ALL
SELECT
  'contactTitle' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE contactTitle LIKE '%NULL%'
UNION ALL
SELECT
  'address' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE address LIKE '%NULL%'
UNION ALL
SELECT
  'city' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE city LIKE '%NULL%'
UNION ALL
SELECT
  'region' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE region LIKE '%NULL%'
UNION ALL
SELECT
  'postalCode' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE postalCode LIKE '%NULL%'
UNION ALL
SELECT
  'country' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE country LIKE '%NULL%'
UNION ALL
SELECT
  'phone' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE phone LIKE '%NULL%'
UNION ALL
SELECT
  'fax' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.CUSTOMERS
WHERE fax LIKE '%NULL%';

-- UPDATE {{ ref('nwtdata_customers') }} AS o
-- SET region = CASE 
--                WHEN region LIKE '%NULL%' THEN country
--                ELSE region
--              END
-- WHERE region LIKE '%NULL%';


-- UPDATE {{ ref('nwtdata_customers') }} AS o
-- SET postalCode = CASE 
--             WHEN postalCode LIKE '%NULL%' THEN 'NONE'
--             ELSE postalCode
--           END
-- WHERE postalCode LIKE '%NULL%';


-- SELECT
--   'customerID' AS column_name,
--   COUNT(*) AS null_count
-- FROM {{ ref('nwtdata_customers') }} AS o
-- WHERE customerID LIKE '%NULL%'
-- UNION ALL
-- SELECT
--   'companyName' AS column_name,
--   COUNT(*) AS null_count
-- FROM {{ ref('nwtdata_customers') }} AS o
-- WHERE companyName LIKE '%NULL%'
-- UNION ALL
-- SELECT
--   'contactName' AS column_name,
--   COUNT(*) AS null_count
-- FROM {{ ref('nwtdata_customers') }} AS o
-- WHERE contactName LIKE '%NULL%'
-- UNION ALL
-- SELECT
--   'contactTitle' AS column_name,
--   COUNT(*) AS null_count
-- FROM {{ ref('nwtdata_customers') }} AS o
-- WHERE contactTitle LIKE '%NULL%'
-- UNION ALL
-- SELECT
--   'address' AS column_name,
--   COUNT(*) AS null_count
-- FROM {{ ref('nwtdata_customers') }} AS o
-- WHERE address LIKE '%NULL%'
-- UNION ALL
-- SELECT
--   'city' AS column_name,
--   COUNT(*) AS null_count
-- FROM{{ ref('nwtdata_customers') }} AS o
-- WHERE city LIKE '%NULL%'
-- UNION ALL
-- SELECT
--   'region' AS column_name,
--   COUNT(*) AS null_count
-- FROM {{ ref('nwtdata_customers') }} AS o
-- WHERE region LIKE '%NULL%'
-- UNION ALL
-- SELECT
--   'postalCode' AS column_name,
--   COUNT(*) AS null_count
-- FROM {{ ref('nwtdata_customers') }} AS o
-- WHERE postalCode LIKE '%NULL%'
-- UNION ALL
-- SELECT
--   'country' AS column_name,
--   COUNT(*) AS null_count
-- FROM {{ ref('nwtdata_customers') }} AS o
-- WHERE country LIKE '%NULL%'
-- UNION ALL
-- SELECT
--   'phone' AS column_name,
--   COUNT(*) AS null_count
-- FROM{{ ref('nwtdata_customers') }} AS o
-- UNION ALL
-- SELECT
--   'fax' AS column_name,
--   COUNT(*) AS null_count
-- FROM {{ ref('nwtdata_customers') }} AS o
-- WHERE fax LIKE '%NULL%';


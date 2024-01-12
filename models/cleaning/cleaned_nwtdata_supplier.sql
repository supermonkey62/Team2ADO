{{ config(materialized='view') }}

UPDATE NWTDATA.NWT.SUPPLIER
SET region = CASE 
               WHEN region LIKE '%NULL%' THEN country
               ELSE region
             END
WHERE region LIKE '%NULL%';

UPDATE NWTDATA.NWT.SUPPLIER
SET fax = CASE 
            WHEN fax LIKE '%NULL%' THEN 'NONE'
            ELSE fax
          END
WHERE fax LIKE '%NULL%';

UPDATE NWTDATA.NWT.SUPPLIER
SET homePage = CASE 
                WHEN homePage LIKE '%NULL%' THEN 'NONE'
                ELSE homePage
              END
WHERE homePage LIKE '%NULL%';
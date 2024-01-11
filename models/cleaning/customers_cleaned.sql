UPDATE NWTDATA.NWT.CUSTOMERS
SET fax = CASE 
            WHEN fax LIKE '%NULL%' THEN 'NONE'
            ELSE fax
          END
WHERE fax LIKE '%NULL%';

UPDATE NWTDATA.NWT.CUSTOMERS
SET region = CASE 
               WHEN region LIKE '%NULL%' THEN country
               ELSE region
             END
WHERE region LIKE '%NULL%';
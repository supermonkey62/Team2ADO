UPDATE NWTDATA.NWT.EMPLOYEE
SET region = CASE 
               WHEN region LIKE '%NULL%' THEN country
               ELSE region
             END
WHERE region LIKE '%NULL%';
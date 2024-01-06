{{ config (materialized='table')}}

Select *
From 
NWTDATA.NWT.EMPLOYEE_TERRITORY;

SELECT *
FROM NWTDATA.NWT.EMPLOYEE_TERRITORY
WHERE
  employeeID LIKE '%NULL%' OR
  territoryID LIKE '%NULL%';
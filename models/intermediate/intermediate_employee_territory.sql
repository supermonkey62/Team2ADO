{{ config (materialized='table')}}

SELECT 
  CASE WHEN employeeID IS NULL THEN 0 ELSE employeeID END AS employeeID,
  CASE WHEN territoryID IS NULL THEN 0 ELSE territoryID END AS territoryID

--   CASE WHEN employeeID = 'NULL' THEN 0 ELSE employeeID END AS employeeID,
--   CASE WHEN territoryID = 'NULL' THEN 0 ELSE territoryID END AS territoryID

from {{ source('NWT', 'RAW_EMPLOYEE_TERRITORY') }}


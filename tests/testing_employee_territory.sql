SELECT
  'employeeID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.EMPLOYEE_TERRITORY
WHERE employeeID LIKE '%NULL%'
UNION ALL
SELECT
  'territoryID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.EMPLOYEE_TERRITORY
WHERE territoryID LIKE '%NULL%';


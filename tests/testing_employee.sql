SELECT
  'employeeID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE employeeID LIKE '%NULL%' OR employeeID IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'lastName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE lastName LIKE '%NULL%' OR lastName IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'firstName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE firstName LIKE '%NULL%' OR firstName IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'title' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE title LIKE '%NULL%' OR title IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'titleOfCourtesy' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE titleOfCourtesy LIKE '%NULL%' OR titleOfCourtesy IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'birthDate' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE birthDate LIKE '%NULL%' OR birthDate IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'hireDate' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE hireDate LIKE '%NULL%' OR hireDate IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'address' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE address LIKE '%NULL%' OR address IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'city' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE city LIKE '%NULL%' OR city IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'region' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE region LIKE '%NULL%' OR region IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'postalCode' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE postalCode LIKE '%NULL%' OR postalCode IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'country' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE country LIKE '%NULL%' OR country IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'homePhone' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE homePhone LIKE '%NULL%' OR homePhone IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'extension' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE extension LIKE '%NULL%' OR extension IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'photo' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE photo LIKE '%NULL%' OR photo IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'notes' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE notes LIKE '%NULL%' OR notes IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'reportsTo' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE reportsTo LIKE '%NULL%' OR reportsTo IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'photoPath' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE photoPath LIKE '%NULL%' OR photoPath IS NULL
HAVING COUNT(*) > 0


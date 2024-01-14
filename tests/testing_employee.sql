SELECT
  'employeeID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE employeeID LIKE '%NULL%'
UNION ALL
SELECT
  'lastName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE lastName LIKE '%NULL%'
UNION ALL
SELECT
  'firstName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE firstName LIKE '%NULL%'
UNION ALL
SELECT
  'title' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE title LIKE '%NULL%'
UNION ALL
SELECT
  'titleOfCourtesy' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE titleOfCourtesy LIKE '%NULL%'
UNION ALL
SELECT
  'birthDate' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE birthDate LIKE '%NULL%'
UNION ALL
SELECT
  'hireDate' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE hireDate LIKE '%NULL%'
UNION ALL
SELECT
  'address' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE address LIKE '%NULL%'
UNION ALL
SELECT
  'city' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE city LIKE '%NULL%'
UNION ALL
SELECT
  'region' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE region LIKE '%NULL%'
UNION ALL
SELECT
  'postalCode' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE postalCode LIKE '%NULL%'
UNION ALL
SELECT
  'country' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE country LIKE '%NULL%'
UNION ALL
SELECT
  'homePhone' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE homePhone LIKE '%NULL%'
UNION ALL
SELECT
  'extension' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE extension LIKE '%NULL%'
UNION ALL
SELECT
  'photo' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE photo LIKE '%NULL%'
UNION ALL
SELECT
  'notes' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE notes LIKE '%NULL%'
UNION ALL
SELECT
  'reportsTo' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE reportsTo LIKE '%NULL%'
UNION ALL
SELECT
  'photoPath' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_EMPLOYEE
WHERE photoPath LIKE '%NULL%';

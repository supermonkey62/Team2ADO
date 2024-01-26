{{ config(materialized='view')}}

SELECT
 'employeeID' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(employeeID, '') LIKE '%NULL%'
UNION ALL
SELECT
 'lastName' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(lastName, '') LIKE '%NULL%'
UNION ALL
SELECT
 'firstName' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(firstName, '') LIKE '%NULL%'
UNION ALL
SELECT
 'title' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(title, '') LIKE '%NULL%'
UNION ALL
SELECT
 'titleOfCourtesy' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(titleOfCourtesy, '') LIKE '%NULL%'
UNION ALL
SELECT
 'birthDate' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(birthDate, '') LIKE '%NULL%'
UNION ALL
SELECT
 'hireDate' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(hireDate, '') LIKE '%NULL%'
UNION ALL
SELECT
 'address' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(address, '') LIKE '%NULL%'
UNION ALL
SELECT
 'city' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(city, '') LIKE '%NULL%'
UNION ALL
SELECT
 'region' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(region, '') LIKE '%NULL%'
UNION ALL
SELECT
 'postalCode' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(postalCode, '') LIKE '%NULL%'
UNION ALL
SELECT
 'country' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(country, '') LIKE '%NULL%'
UNION ALL
SELECT
 'homePhone' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(homePhone, '') LIKE '%NULL%'
UNION ALL
SELECT
 'extension' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(extension, '') LIKE '%NULL%'
UNION ALL
SELECT
 'photo' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(photo, '') LIKE '%NULL%'
UNION ALL
SELECT
 'notes' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(notes, '') LIKE '%NULL%'
UNION ALL
SELECT
 'reportsTo' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(reportsTo, '') LIKE '%NULL%'
UNION ALL
SELECT
 'photoPath' AS column_name,
 COUNT(*) AS null_count
FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
WHERE IFNULL(photoPath, '') LIKE '%NULL%'
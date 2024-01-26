-- {{ config(materialized='view')}}

-- SELECT
--  'employeeID' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(employeeID, '') LIKE '%NULL%'
-- UNION ALL
-- SELECT
--  'lastName' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(lastName, '') LIKE '%NULL%'
-- UNION ALL
-- SELECT
--  'firstName' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(firstName, '') LIKE '%NULL%'
-- UNION ALL
-- SELECT
--  'title' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(title, '') LIKE '%NULL%'
-- UNION ALL
-- SELECT
--  'titleOfCourtesy' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(titleOfCourtesy, '') LIKE '%NULL%'
-- UNION ALL
-- SELECT
--  'birthDate' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(birthDate, '') LIKE '%NULL%'
-- UNION ALL
-- SELECT
--  'hireDate' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(hireDate, '') LIKE '%NULL%'
-- UNION ALL
-- SELECT
--  'address' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(address, '') LIKE '%NULL%'
-- UNION ALL
-- SELECT
--  'city' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(city, '') LIKE '%NULL%'
-- UNION ALL
-- SELECT
--  'region' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(region, '') LIKE '%NULL%'
-- UNION ALL
-- SELECT
--  'postalCode' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(postalCode, '') LIKE '%NULL%'
-- UNION ALL
-- SELECT
--  'country' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(country, '') LIKE '%NULL%'
-- UNION ALL
-- SELECT
--  'homePhone' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(homePhone, '') LIKE '%NULL%'
-- UNION ALL
-- SELECT
--  'extension' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(extension, '') LIKE '%NULL%'
-- UNION ALL
-- SELECT
--  'photo' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(photo, '') LIKE '%NULL%'
-- UNION ALL
-- SELECT
--  'notes' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(notes, '') LIKE '%NULL%'
-- UNION ALL
-- SELECT
--  'reportsTo' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(reportsTo, '') LIKE '%NULL%'
-- UNION ALL
-- SELECT
--  'photoPath' AS column_name,
--  COUNT(*) AS null_count
-- FROM NWTDATA.NWT.INTERMEDIATE_EMPLOYEE
-- WHERE IFNULL(photoPath, '') LIKE '%NULL%'

-- models/intermediate_employee_no_nulls.sql

WITH cleaned_data AS (
  SELECT
    coalesce(employeeID, 'None') AS employeeID,
    coalesce(lastName, 'None') AS lastName,
    coalesce(firstName, 'None') AS firstName,
    coalesce(title, 'None') AS title,
    coalesce(titleOfCourtesy, 'None') AS titleOfCourtesy,
    coalesce(birthDate, 'None') AS birthDate,
    coalesce(hireDate, 'None') AS hireDate,
    coalesce(address, 'None') AS address,
    coalesce(city, 'None') AS city,
    coalesce(region, 'None') AS region,
    coalesce(postalCode, 'None') AS postalCode,
    coalesce(country, 'None') AS country,
    coalesce(homePhone, 'None') AS homePhone,
    coalesce(extension, 'None') AS extension,
    coalesce(photo, 'None') AS photo,dbt
    coalesce(notes, 'None') AS notes,
    coalesce(reportsTo, 'None') AS reportsTo,
    coalesce(photoPath, 'None') AS photoPath
  FROM {{ ref('intermediate_employee') }}
)

SELECT * FROM cleaned_data

UPDATE {{ ref('intermediate_employee') }}
SET
  employeeID = cleaned_data.employeeID,
  lastName = cleaned_data.lastName,
  firstName = cleaned_data.firstName,
  title = cleaned_data.title,
  titleOfCourtesy = cleaned_data.titleOfCourtesy,
  birthDate = cleaned_data.birthDate,
  hireDate = cleaned_data.hireDate,
  address = cleaned_data.address,
  city = cleaned_data.city,
  region = cleaned_data.region,
  postalCode = cleaned_data.postalCode,
  country = cleaned_data.country,
  homePhone = cleaned_data.homePhone,
  extension = cleaned_data.extension,
  photo = cleaned_data.photo,
  notes = cleaned_data.notes,
  reportsTo = cleaned_data.reportsTo,
  photoPath = cleaned_data.photoPath
FROM cleaned_data;


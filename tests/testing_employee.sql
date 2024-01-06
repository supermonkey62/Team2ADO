SELECT *
FROM NWTDATA.NWT.EMPLOYEE
WHERE
  employeeID LIKE '%NULL%' OR
  lastName LIKE '%NULL%' OR
  firstName LIKE '%NULL%' OR
  title LIKE '%NULL%' OR
  titleOfCourtesy LIKE '%NULL%' OR
  birthDate LIKE '%NULL%' OR
  hireDate LIKE '%NULL%' OR
  address LIKE '%NULL%' OR
  city LIKE '%NULL%' OR
  region LIKE '%NULL%' OR
  postalCode LIKE '%NULL%' OR
  country LIKE '%NULL%' OR
  homePhone LIKE '%NULL%' OR
  extension LIKE '%NULL%' OR
  photo LIKE '%NULL%' OR
  notes LIKE '%NULL%' OR
  reportsTo LIKE '%NULL%' OR
  photoPath LIKE '%NULL%';
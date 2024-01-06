{{ config (materialized='table')}}

Select *
From 
NWTDATA.NWT.CUSTOMERS;

SELECT *
FROM NWTDATA.NWT.CUSTOMERS
WHERE
  customerID LIKE '%NULL%' OR
  companyName LIKE '%NULL%' OR
  contactName LIKE '%NULL%' OR
  contactTitle LIKE '%NULL%' OR
  address LIKE '%NULL%' OR
  city LIKE '%NULL%' OR
  region LIKE '%NULL%' OR
  postalCode LIKE '%NULL%' OR
  country LIKE '%NULL%' OR
  phone LIKE '%NULL%' OR
  fax LIKE '%NULL%';
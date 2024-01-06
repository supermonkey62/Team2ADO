{{ config (materialized='table')}}

Select *
From 
NWTDATA.NWT.CUSTOMERS;

SELECT *
FROM NWTDATA.NWT.CUSTOMERS
WHERE
  customerID LIKE '%null%' OR
  companyName LIKE '%null%' OR
  contactName LIKE '%null%' OR
  contactTitle LIKE '%null%' OR
  address LIKE '%null%' OR
  city LIKE '%null%' OR
  region LIKE '%null%' OR
  postalCode LIKE '%null%' OR
  country LIKE '%null%' OR
  phone LIKE '%null%' OR
  fax LIKE '%null%';
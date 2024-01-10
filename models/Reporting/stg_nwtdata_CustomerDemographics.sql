{{ config(materialized='view') }}

SELECT
    C.ContactName AS CustomerContactName,
    C.CompanyName AS CustomerCompanyName,
    C.ContactTitle AS CustomerContactTitle,
    C.City AS CustomerCity,
    C.Region AS CustomerRegion,
    T.TerritoryDescription AS CustomerTerritory
FROM {{ ref('nwtdata_customers') }} AS C
JOIN {{ ref('nwtdata_orders') }} AS O ON C.CustomerID = O.CustomerID
JOIN {{ ref('nwtdata_employee') }} AS E ON O.EmployeeID = E.EmployeeID
JOIN {{ ref('nwtdata_employee_territory') }} AS ET ON E.EmployeeID = ET.EmployeeID
JOIN {{ ref('nwtdata_territory') }} AS T ON ET.TerritoryID = T.TerritoryID


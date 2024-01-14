-- {{ config(materialized='view') }}

-- SELECT DISTINCT
--     C.ContactName AS CustomerContactName,
--     C.CompanyName AS CustomerCompanyName,
--     C.ContactTitle AS CustomerContactTitle,
--     C.City AS CustomerCity,
--     C.Region AS CustomerRegion,
--     T.TerritoryDescription AS CustomerTerritory
-- FROM {{ ref('raw_customer') }} AS C
-- JOIN {{ ref('raw_order') }} AS O ON C.CustomerID = O.CustomerID
-- JOIN {{ ref('raw_employee') }} AS E ON O.EmployeeID = E.EmployeeID
-- JOIN {{ ref('raw_employee_territory') }} AS ET ON E.EmployeeID = ET.EmployeeID
-- JOIN {{ ref('raw_territory') }} AS T ON ET.TerritoryID = T.TerritoryID

{{ config(materialized='view') }}

SELECT
    C.CustomerID,
    MAX(C.ContactName) AS CustomerContactName,
    MAX(C.CompanyName) AS CustomerCompanyName,
    MAX(C.ContactTitle) AS CustomerContactTitle,
    MAX(C.City) AS CustomerCity,
    MAX(C.Region) AS CustomerRegion,
    MAX(T.TerritoryDescription) AS CustomerTerritory
FROM {{ ref('raw_customer') }} AS C
JOIN {{ ref('raw_order') }} AS O ON C.CustomerID = O.CustomerID
JOIN {{ ref('raw_employee') }} AS E ON O.EmployeeID = E.EmployeeID
JOIN {{ ref('raw_employee_territory') }} AS ET ON E.EmployeeID = ET.EmployeeID
JOIN {{ ref('raw_territory') }} AS T ON ET.TerritoryID = T.TerritoryID
GROUP BY C.CustomerID


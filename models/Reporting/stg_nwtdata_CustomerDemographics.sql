{{ config(materialized='view') }}

SELECT
    C.CompanyName AS CustomerCompanyName,
    C.ContactName AS CustomerContactName,
    C.ContactTitle AS CustomerContactTitle,
    C.City AS CustomerCity,
    C.Region AS CustomerRegion,
    T.TerritoryDescription AS CustomerTerritory
FROM
    Customer C
JOIN
    [Order] O ON C.CustomerID = O.CustomerID
JOIN
    Employee E ON O.EmployeeID = E.EmployeeID
JOIN
    EmployeeTerritory ET ON E.EmployeeID = ET.EmployeeID
JOIN
    Territory T ON ET.TerritoryID = T.TerritoryID;


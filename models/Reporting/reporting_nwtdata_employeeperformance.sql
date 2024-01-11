SELECT
    EmployeeID,
    LastName,
    FirstName,
    TotalOrders,
    TotalSales,
    AvgOrderValue

from {{ ref('stg_nwtdata_employeeperformance') }}
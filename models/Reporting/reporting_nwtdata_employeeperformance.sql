SELECT
    EmployeeID,
    EmployeeName,
    TotalOrders,
    TotalSales,
    AvgOrderValue

from {{ ref('stg_nwtdata_EmployeePerformance') }}
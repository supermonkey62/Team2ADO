SELECT
    EmployeeID,
    EmployeeName,
    TotalSales,
    AvgOrderValue,
    NumberOfOrders,
    TotalProfit

from {{ ref('stg_nwtdata_employeeperformance') }}
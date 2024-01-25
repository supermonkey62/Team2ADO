SELECT
    EmployeeID,
    EmployeeName,
    Revenue,
    AvgOrderValue,
    NumberOfOrders,
    TotalProfit

from {{ ref('stg_nwtdata_employeeperformance') }}
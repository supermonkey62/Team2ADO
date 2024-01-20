SELECT 
    EmployeeID,
    ProductID,
    ProductName,
    EmployeeName,
    TotalQuantity,
    TotalValue

from {{ ref('stg_nwtdata_employeeeperformanceproducts') }}
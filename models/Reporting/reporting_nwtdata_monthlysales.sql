SELECT
  OrderId,
  OrderDate,
  OrderMonth,
  Quantity,
  CategoryName,
  ProductName,
  ProductSales

from {{ ref('stg_nwtdata_monthlysales') }}
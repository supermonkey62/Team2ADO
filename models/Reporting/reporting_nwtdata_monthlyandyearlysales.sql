SELECT
  OrderId,
  OrderDate,
  OrderMonth,
  OrderYear,
  Quantity,
  CategoryName,
  ProductName,
  ProductSales

from {{ ref('stg_nwtdata_monthlyandyearlysales') }}
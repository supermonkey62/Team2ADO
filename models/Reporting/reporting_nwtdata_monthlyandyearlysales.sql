SELECT
  OrderId,
  OrderDate,
  OrderMonth,
  OrderYear,
  Quantity,
  CategoryName,
  ProductName,
  TotalRevenue,
  CostOfSales,
  GrossProfit,
  GrossProfitMargin

from {{ ref('stg_nwtdata_monthlyandyearlysales') }}
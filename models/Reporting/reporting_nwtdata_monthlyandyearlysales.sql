SELECT
  OrderId,
  OrderDate,
  OrderMonth,
  OrderYear,
  Quantity,
  CategoryName,
  ProductName,
  Revenue,
  CostOfSales,
  GrossProfit,
  GrossProfitMargin

from {{ ref('stg_nwtdata_monthlyandyearlysales') }}
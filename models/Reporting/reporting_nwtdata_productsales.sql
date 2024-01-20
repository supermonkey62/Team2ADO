SELECT
  orderid,
  od.unitprice,
  quantity,
  discount,
  productname,
  SupplierId,
  CategoryId,
  CategoryName,
  QuantityPerUnit,
  reorderlevel,
  discontinued,
  unitcost,
  OrderDate,
  OrderMonth,
  OrderYear,
  Sales,
  Profit,
  ProfitMargin

from {{ ref('stg_nwtdata_productsales') }}
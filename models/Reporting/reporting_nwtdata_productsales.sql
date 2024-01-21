SELECT
  orderid,
  unitprice,
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
  SalesRevenue,
  Profit

from {{ ref('stg_nwtdata_productsales') }}
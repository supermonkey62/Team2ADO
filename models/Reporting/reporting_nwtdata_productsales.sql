SELECT
  orderid,
  unitprice,
  quantity,
  discount,
  productname,
  supplierid,
  categoryid,
  QuantityPerUnit,
  reorderlevel,
  discontinued,
  Sales,
  Profit,
  ProfitMargin

from {{ ref('stg_nwtdata_productsales') }}
SELECT
  CustomerId,
  ContactName,
  CompanyName,
  ContactTitle,
  Revenue,
  City,
  Country,
  Address,
  ShipCountry,
  ShipCity,
  OrderId,
  Unitprice,
  Quantity,
  Discount

from {{ ref('stg_nwtdata_topcustomers') }}
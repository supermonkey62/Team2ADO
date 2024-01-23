SELECT
  CustomerId,
  ContactName,
  CompanyName,
  ContactTitle,
  CustomerSales,
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
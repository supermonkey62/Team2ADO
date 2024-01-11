SELECT
  CustomerId,
  CustomerSales

from {{ ref('stg_nwtdata_topcustomers') }}
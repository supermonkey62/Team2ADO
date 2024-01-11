SELECT
  CategoryId,
  CategoryName,
  ProductSales

from {{ ref('stg_nwtdata_categorysales') }}
SELECT
  CategoryId,
  CategoryName,
  CategorySales


from {{ ref('stg_nwtdata_categorysales') }}
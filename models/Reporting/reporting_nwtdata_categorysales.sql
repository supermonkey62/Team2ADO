SELECT
  CategoryId,
  CategoryName,
  Revenue


from {{ ref('stg_nwtdata_categorysales') }}
<<<<<<< HEAD

=======
SELECT
  'categoryID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CATEGORY
WHERE categoryID LIKE '%NULL%'
UNION ALL
SELECT
  'categoryName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CATEGORY
WHERE categoryName LIKE '%NULL%'
UNION ALL
SELECT
  'description' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CATEGORY
WHERE description LIKE '%NULL%'
UNION ALL
SELECT
  'picture' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CATEGORY
WHERE picture LIKE '%NULL%'
>>>>>>> d5702ca8e025b45bddbfae395035c0ef631194cc

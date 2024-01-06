SELECT
  'regionID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.REGION
WHERE regionID LIKE '%NULL%'
UNION ALL
SELECT
  'regionDescription' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.REGION
WHERE regionDescription LIKE '%NULL%';




SELECT
  'territoryID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_TERRITORY
WHERE territoryID LIKE '%NULL%'
UNION ALL
SELECT
  'territoryDescription' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_TERRITORY
WHERE territoryDescription LIKE '%NULL%'
UNION ALL
SELECT
  'regionID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_TERRITORY
WHERE regionID LIKE '%NULL%';


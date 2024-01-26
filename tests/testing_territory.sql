SELECT
  'territoryID' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_TERRITORY
WHERE territoryID LIKE '%NULL%' OR territoryID IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'territoryDescription' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_TERRITORY
WHERE territoryDescription LIKE '%NULL%' OR territoryDescription IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'regionID' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_TERRITORY
WHERE regionID LIKE '%NULL%' OR regionID IS NULL
HAVING COUNT(*) > 0

SELECT
  'regionID' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_REGION
WHERE regionID LIKE '%NULL%' OR regionID IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
  'regionDescription' AS column_name,
  COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_REGION
WHERE regionDescription LIKE '%NULL%' OR regionDescription IS NULL
HAVING COUNT(*) > 0


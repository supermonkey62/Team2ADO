SELECT *
FROM NWTDATA.NWT.REGION
WHERE
  regionID LIKE '%NULL%' OR
  regionDescription LIKE '%NULL%';
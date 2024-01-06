SELECT *
FROM NWTDATA.NWT.TERRITORY
WHERE
  territoryID LIKE '%NULL%' OR
  territoryDescription LIKE '%NULL%' OR
  regionID LIKE '%NULL%';
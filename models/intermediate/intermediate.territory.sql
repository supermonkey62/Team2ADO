{{ config (materialized='table')}}

SELECT 
  CASE WHEN territoryID IS NULL THEN 0 ELSE territoryID END AS territoryID,
  CASE WHEN territoryDescription IS NULL THEN 'None' ELSE territoryDescription END AS territoryDescription,
  CASE WHEN regionID IS NULL THEN 0 ELSE regionID END AS regionID
FROM {{ source('NWT', 'RAW_TERRITORY') }}

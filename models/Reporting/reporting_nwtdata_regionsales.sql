SELECT
  RegionId,
  RegionDescription,
  RegionSales

from {{ ref('stg_nwtdata_regionsales') }}
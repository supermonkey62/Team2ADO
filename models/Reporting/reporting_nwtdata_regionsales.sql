SELECT
  RegionId,
  RegionDescription,
  Revenue

from {{ ref('stg_nwtdata_regionsales') }}
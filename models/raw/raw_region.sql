 {{ config(materialized='incremental', unique_key='REGIONID') }}

 SELECT *
FROM {{ ref ('raw_region_fresh') }}
 {% if is_incremental() %}
WHERE CAST(REGIONID AS BIGINT) > (SELECT MAX(CAST(REGIONID AS BIGINT))  FROM {{this}})
{% endif %}
from {{ source('NWT', 'RAW_REGION') }}
 {{ config(materialized='incremental', unique_key='TERRITORYID') }}

 SELECT *
FROM {{ ref ('raw_territory_fresh') }}
 {% if is_incremental() %}
WHERE CAST(TERRITORYID AS BIGINT) > (SELECT MAX(CAST(TERRITORYID AS BIGINT))  FROM {{this}})
{% endif %}
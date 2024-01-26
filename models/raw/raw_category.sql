 {{ config(materialized='incremental', unique_key='CATEGORYID') }}

 SELECT *
FROM {{ ref ('raw_category_fresh') }}
 {% if is_incremental() %}
WHERE CAST(CATEGORYID AS BIGINT) > (SELECT MAX(CAST(CATEGORYID AS BIGINT))  FROM {{this}})
{% endif %}






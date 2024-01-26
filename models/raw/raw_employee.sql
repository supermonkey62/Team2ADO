 {{ config(materialized='incremental', unique_key='EMPLOYEEID') }}

 SELECT *
FROM {{ ref ('raw_employee_fresh') }}
 {% if is_incremental() %}
WHERE CAST(EMPLOYEEID AS BIGINT) > (SELECT MAX(CAST(EMPLOYEEID AS BIGINT))  FROM {{this}})
{% endif %}


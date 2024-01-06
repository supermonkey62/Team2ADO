{{ config (materialized='table')}}

Select *
From 
NWTDATA.NWT.ORDER_DETAIL;

-- SELECT orderid, COUNT(*) as count
-- FROM NWTDATA.NWT.ORDER_DETAIL
-- GROUP BY orderid
-- HAVING count > 1;

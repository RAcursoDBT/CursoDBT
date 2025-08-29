{{
    config(
        materialized='table',
        tags=['processing', 'sales', 'carmake']
    ) 
}}


select 
date_trunc('month',ddate) as ddate,
SALESPERSON,
CARMAKE,
sum(SALEPRICE -COMNEA) as TOTALSALE,
sum(COMNEA) as TOTALCOM
from {{ref("stg_sales_data_2020p")}}
group by date_trunc('month',ddate),SALESPERSON,CARMAKE

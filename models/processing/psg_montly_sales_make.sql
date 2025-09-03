{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key=['DDATE','SALESPERSON','CARMAKE'],
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
{% if is_incremental %}
    --filtra sólo lo nuevo desde la última ejecución
    where DDATE > (select max(ddate) from {{ this }})
{% endif %}
group by date_trunc('month',ddate),SALESPERSON,CARMAKE

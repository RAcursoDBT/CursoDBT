{{ config(tags=['dash_sales_bi'])}}

select 
    rank () over (ORDER BY SALESPERSON) as ID_SALESPERSON,
    SALESPERSON
from {{ ref("psg_montly_sales_make")}}
GROUP BY SALESPERSON
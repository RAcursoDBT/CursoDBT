{{ config(tags=['dash_sales_bi'])}}

select 
    {#rank () over (ORDER BY CARMAKE) as ID_CARMAKE,#}
    {{ generate_id( 'CARMAKE' )}} as ID_CARMAKE,
    CARMAKE
from {{ ref("psg_montly_sales_make")}}
GROUP BY CARMAKE
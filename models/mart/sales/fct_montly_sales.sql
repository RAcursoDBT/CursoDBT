{{ config(tags=['dash_sales_bi'])}}

SELECT
    DDATE,
    ID_SALESPERSON,
    ID_CARMAKE,
    TOTALSALE,
    TOTALCOM
FROM {{ ref("psg_montly_sales_make")}} as psgm
left join {{ ref("dim_carmake")}} as dimcm on psgm.carmake=dimcm.carmake
left join {{ ref("dim_salesperson")}} as dimsp on psgm.salesperson=dimsp.salesperson

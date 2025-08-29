select 
    try_cast(ddate as date) as ddate,
    SALESPERSON,
    CUSTOMERNAME,
    CARMAKE,
    CARMODEL,
    TRY_CAST(CARYEAR AS NUMBER) AS CARYEAR,
    SALEPRICE,
    COMMISSIONRATE AS COMRATE,
    COMMISSIONEARNED AS COMNEA
from {{ source("raw_bi_car","CAR_SALES")}}
where try_cast(ddate as date) >= '2020-01-01'
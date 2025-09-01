{% snapshot salesperson_snapshot%}

{{
    config(
        target_schema = 'snapshot',
        unique_key='SALESPERSON_ID',
        strategy='timestamp',
        updated_at='last_update_ts',
        invalidated_hard_deletes= true
    )
}}

select 
    salesperson_id,
    salesperson_name,
    commission_rate,
    store_id,
    status,
    last_update_ts
from {{ source("raw_bi_car", "SALESPERSON")}}

{% endsnapshot%}
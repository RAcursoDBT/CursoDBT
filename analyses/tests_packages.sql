SELECT {{ dbt_utils.generate_surrogate_key(['CARMAKE','SALESPERSON']) }} AS ID
FROM {{ ref( "psg_montly_sales_make" )}}
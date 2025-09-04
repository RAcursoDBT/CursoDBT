# Documentación de Modelos dbt

{% doc dim_carmake %}
Dimensión de marcas de coches. Contiene una clave única por marca.

**Columnas:**
- `ID_CARMAKE`: Clave única por marca del coche
  - Tests: not_null, unique
- `CARMAKE`: Nombre de la marca
  - Tests: not_null, accepted_values ['Toyota', 'Honda', 'Ford', 'Chevrolet', 'Audi'] (severity: warn)
{% enddoc %}

{% doc dim_salesperson %}
Dimensión de vendedores de coches. Contiene una clave única por vendedor.

**Columnas:**
- `ID_SALESPERSON`: Clave subrogada única por vendedor
  - Tests: not_null, unique
- `SALESPERSON`: Nombre del vendedor
  - Tests: not_null
{% enddoc %}

{% doc fct_montly_sales %}
Tabla de hechos de ventas mensuales por vendedor y marca.

**Columnas:**
- `DDATE`: Fecha
  - Tests: not_null
- `ID_SALESPERSON`: Clave foránea a la dimensión de vendedores (dim_salesperson)
  - Tests: not_null, relationships to=ref('dim_salesperson'), field=ID_SALESPERSON
- `ID_CARMAKE`: Clave foránea a la dimensión de marcas (dim_carmake)
  - Tests: not_null, relationships to=ref('dim_carmake'), field=ID_CARMAKE
- `TOTALSALE`: Total de la venta para ese mes, vendedor y marca
- `TOTALCOM`: Total comisiones por mes, vendedor y marca
{% enddoc %}

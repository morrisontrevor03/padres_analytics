{% test positive_inter_or_zero(model, column_name) %}

SELECT {{ column_name }} AS val
FROM {{ model }}
WHERE {{ column_name }} < 0 OR {{ column_name }} != SAFE_CAST({{ column_name }} AS INT64)

{% endtest %}

{% test between_0_and_1(model, column_name) %}

SELECT {{ column_name }} AS val
FROM {{ model }}
WHERE {{ column_name }} < 0 AND {{ column_name }} > 1

{% endtest %}

{% test between_min_max(model, column_name, min, max) %}

SELECT {{ column_name }} AS val
FROM {{ model }}
WHERE {{ column_name }} < {{min}} OR {{ column_name }} > {{max}}

{% endtest %}
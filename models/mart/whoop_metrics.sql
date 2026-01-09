SELECT
*
FROM {{ ref("int_whoop_clean_date")}}
ORDER BY Date DESC
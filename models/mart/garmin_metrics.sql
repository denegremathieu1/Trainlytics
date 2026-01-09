SELECT
*
FROM {{ ref("stg_garmin")}}
ORDER BY Date DESC
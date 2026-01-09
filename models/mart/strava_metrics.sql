SELECT
*
FROM {{ ref("stg_strava")}}
ORDER BY Date DESC
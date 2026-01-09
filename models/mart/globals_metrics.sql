SELECT
*
FROM {{ ref("int_joining_strava_garmin_whoop")}}
ORDER BY Date DESC
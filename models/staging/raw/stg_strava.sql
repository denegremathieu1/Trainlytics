WITH s1 AS (
    SELECT
        PARSE_DATETIME("%e %b %Y, %H:%M:%S",
        CASE
            WHEN REGEXP_CONTAINS(LOWER(Date_de_l_activite),"janv.") THEN REPLACE(LOWER(Date_de_l_activite),"janv.","JAN")
            WHEN REGEXP_CONTAINS(REPLACE(LOWER(Date_de_l_activite),"é","e"),"fevr.") THEN REPLACE(REPLACE(LOWER(Date_de_l_activite),"é","e"),"fevr.","FEB")
            WHEN REGEXP_CONTAINS(LOWER(Date_de_l_activite),"mars") THEN REPLACE(LOWER(Date_de_l_activite),"mars","MAR")
            WHEN REGEXP_CONTAINS(LOWER(Date_de_l_activite),"avr.") THEN REPLACE(LOWER(Date_de_l_activite),"avr.","APR")
            WHEN REGEXP_CONTAINS(LOWER(Date_de_l_activite),"mai") THEN REPLACE(LOWER(Date_de_l_activite),"mai","MAY")
            WHEN REGEXP_CONTAINS(LOWER(Date_de_l_activite),"juin") THEN REPLACE(LOWER(Date_de_l_activite),"juin","JUN")
            WHEN REGEXP_CONTAINS(LOWER(Date_de_l_activite),"juil.") THEN REPLACE(LOWER(Date_de_l_activite),"juil.","JUL")
            WHEN REGEXP_CONTAINS(LOWER(Date_de_l_activite),"août") THEN REPLACE(LOWER(Date_de_l_activite),"août","AUG")
            WHEN REGEXP_CONTAINS(LOWER(Date_de_l_activite),"sept.") THEN REPLACE(LOWER(Date_de_l_activite),"sept.","SEP")
            WHEN REGEXP_CONTAINS(LOWER(Date_de_l_activite),"oct.") THEN REPLACE(LOWER(Date_de_l_activite),"oct.","OCT")
            WHEN REGEXP_CONTAINS(LOWER(Date_de_l_activite),"nov.") THEN REPLACE(LOWER(Date_de_l_activite),"nov.","NOV")
            WHEN REGEXP_CONTAINS(REPLACE(LOWER(Date_de_l_activite),"é","e"),"dec.") THEN REPLACE(REPLACE(LOWER(Date_de_l_activite),"é","e"),"dec.","DEC")
            ELSE Date_de_l_activite
        END 
        ) AS date_time
        , Type_d_activite 
        , Temperature_ressentie
        , Humidite
        , ROUND(Vitesse_du_vent * 3.6,0) AS Vitesse_du_vent
    FROM {{ source('raw', 'strava') }}
)

SELECT
  DATE(s1.date_time) AS Date
  , TIME(s1.date_time) AS Heure
  , s1.Type_d_activite
  , s1.Temperature_ressentie
  , s1.Humidite
  , s1.Vitesse_du_vent
FROM s1
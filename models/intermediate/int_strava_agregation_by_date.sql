SELECT 
    Date
    , Type_d_activite AS Type_d_activite_strava
    , ROUND(AVG(Temperature_ressentie),1) AS Temperature_ressentie
    , ROUND(AVG(Humidite),1) AS Humidite
    , ROUND(AVG(Vitesse_du_vent),1) AS Vitesse_du_vent
FROM {{ ref("stg_strava")}}
WHERE REPLACE(Type_d_activite,"é","e") IN ("Velo","Velo virtuel")
GROUP BY
    date
    , Type_d_activite
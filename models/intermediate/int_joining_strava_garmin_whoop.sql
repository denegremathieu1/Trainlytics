SELECT
    w.*
    , g.Heure
    , s.Type_d_activite_strava
    , g.Type_d_activite_garmin
    , g.Distance
    , g.Temps_de_deplacement_en_heure
    , g.Frequence_cardiaque_moyenne
    , g.Frequence_cardiaque_maximale
    , g.Frequence_respiratoire_moyenne
    , g.Frequence_respiratoire_minimale
    , g.Frequence_respiratoire_maximale
    , g.TE_aerobie
    , g.Vitesse_moyenne
    , g.Ascension_totale
    , g.Altitude_maximale
    , g.Normalized_Power
    , g.Equilibre_G
    , g.Equilibre_D
    , g.Training_Stress_Score
    , g.Temperature_minimale
    , g.Temperature_maximale
    , s.Temperature_ressentie
    , s.Humidite
    , s.Vitesse_du_vent
FROM {{ ref("int_whoop_clean_date")}} AS w
LEFT JOIN {{ ref("int_strava_agregation_by_date")}} AS s
USING(Date)
LEFT JOIN {{ ref("int_garmin_agregation_by_date")}} AS g
USING(Date)
WHERE w.Date IS NOT NULL
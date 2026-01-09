SELECT
    Date
    , MIN(Heure) AS Heure
    , Type_d_activite AS Type_d_activite_garmin
    , ROUND(SUM(Distance),2) AS Distance
    , ROUND(SUM(Temps_de_deplacement_en_heure),1) AS Temps_de_deplacement_en_heure
    , ROUND(AVG(Frequence_cardiaque_moyenne),1) AS Frequence_cardiaque_moyenne
    , MAX(Frequence_cardiaque_maximale) AS Frequence_cardiaque_maximale
    , ROUND(AVG(TE_aerobie),1) AS TE_aerobie
    , ROUND(AVG(Vitesse_moyenne),1) AS Vitesse_moyenne
    , ROUND(SUM(Ascension_totale),1) AS Ascension_totale
    , ROUND(AVG(Cadence_de_velo_moyenne),1) AS Cadence_de_velo_moyenne
    , ROUND(AVG(Normalized_Power),1) AS Normalized_Power
    , ROUND(AVG(Equilibre_G),1) AS Equilibre_G
    , ROUND(AVG(Equilibre_D),1) AS Equilibre_D
    , ROUND(SUM(Training_Stress_Score),1) AS Training_Stress_Score
    , MIN(Temperature_minimale) AS Temperature_minimale
    , MAX(Temperature_maximale) AS Temperature_maximale
    , ROUND(AVG(Frequence_respiratoire_moyenne),1) AS Frequence_respiratoire_moyenne
    , MIN(Frequence_respiratoire_minimale) AS Frequence_respiratoire_minimale
    , MAX(Frequence_respiratoire_maximale) AS Frequence_respiratoire_maximale
    , MAX(Altitude_maximale) AS Altitude_maximale
FROM {{ ref("stg_garmin")}}
GROUP BY 
    Date
    , Type_d_activite
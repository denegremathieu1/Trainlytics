SELECT  
  DATE(Date) AS Date
  , TIME(Date) AS Heure
  , CASE
        WHEN Type_d_activite = "Autre" THEN REPLACE(Type_d_activite,"Autre","Cyclisme sur route")
        ELSE Type_d_activite
    END AS Type_d_activite
  , Distance
  , ROUND(SAFE_CAST(SPLIT(Temps_de_deplacement, ":")[OFFSET(0)] AS FLOAT64) + SAFE_CAST(SPLIT(Temps_de_deplacement, ":")[OFFSET(1)] AS FLOAT64) / 60 + SAFE_CAST(SPLIT(Temps_de_deplacement, ':')[OFFSET(2)] AS FLOAT64) / 3600
,1) AS Temps_de_deplacement_en_heure
  , SAFE_CAST(Frequence_cardiaque_moyenne AS INT64) AS Frequence_cardiaque_moyenne
  , SAFE_CAST(Frequence_cardiaque_maximale AS INT64) AS Frequence_cardiaque_maximale
  , SAFE_CAST(TE_aerobie AS FLOAT64) AS TE_aerobie
  , SAFE_CAST(Vitesse_moyenne AS FLOAT64) AS Vitesse_moyenne 
  , CASE
      WHEN REGEXP_CONTAINS(Ascension_totale,",") THEN SAFE_CAST(REPLACE(Ascension_totale,",",".") AS FLOAT64)*1000 
      WHEN SAFE_CAST(Ascension_totale AS INT64) < 10 THEN SAFE_CAST(Ascension_totale AS INT64)*1000 
      ELSE SAFE_CAST(Ascension_totale AS INT64)
    END AS Ascension_totale
  , SAFE_CAST(Cadence_de_velo_moyenne AS INT64) AS Cadence_de_velo_moyenne
  , SAFE_CAST(Normalized_Power__NP_ AS INT64) AS Normalized_Power
  , SAFE_CAST(REGEXP_EXTRACT(Equilibre_G_D,r"(\d+)%\s*G") AS INT64) AS Equilibre_G
  , SAFE_CAST(REGEXP_EXTRACT(Equilibre_G_D,r"(\d+)%\s*D") AS INT64) AS Equilibre_D
  , Training_Stress_Score__TSS_ AS Training_Stress_Score
  , SAFE_CAST(Temperature_minimale AS FLOAT64) AS Temperature_minimale
  , SAFE_CAST(Temperature_maximale AS FLOAT64) AS Temperature_maximale
  , SAFE_CAST(Frequence_respiratoire_moyenne AS INT64) AS Frequence_respiratoire_moyenne
  , SAFE_CAST(Frequence_respiratoire_minimale AS INT64) AS Frequence_respiratoire_minimale
  , SAFE_CAST(Frequence_respiratoire_maximale AS INT64) AS Frequence_respiratoire_maximale
  , CASE
      WHEN REGEXP_CONTAINS(Altitude_maximale,",") THEN SAFE_CAST(REPLACE(Altitude_maximale,",",".") AS FLOAT64)*1000 
      WHEN SAFE_CAST(Altitude_maximale AS INT64) < 3 THEN SAFE_CAST(Altitude_maximale AS INT64)*1000 
      ELSE SAFE_CAST(Altitude_maximale AS INT64)
    END AS Altitude_maximale
FROM {{ source('raw', 'garmin')}}
WHERE Distance > 10
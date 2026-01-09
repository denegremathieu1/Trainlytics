WITH s1 AS (SELECT
  *
  , ROW_NUMBER()OVER(PARTITION BY Date) AS rn
FROM {{ ref("stg_whoop")}}
)

SELECT
  CASE
    WHEN rn = 1 THEN Date
    ELSE DATE_ADD(Date, INTERVAL rn - 1 DAY)
  END AS Date
  , s1.Score_de_recuperation
  , s1.Frequence_cardiaque_au_repos_bpm
  , s1.Variabilite_de_la_frequence_cardiaque_ms
  , s1.Temperature_cutanee_Celsius
  , s1.Niveau_d_oxygene
  , s1.Effort_du_jour
  , s1.Depense_energetique_cal
  , s1.FC_moyenne_bpm
  , s1.Performance_Sommeil
  , s1.Frequence_respiratoire_tr_min
  , s1.Duree_du_sommeil_heure
  , s1.Duree_du_sommeil_leger_pourcentage
  , s1.Duree_du_sommeil_profond_pourcentage
  , s1.Duree_du_sommeil_paradoxal_heure
  , s1.Dette_de_sommeil_min
  , s1.Efficacite_du_sommeil
  , s1.Regularite_du_sommeil
FROM s1
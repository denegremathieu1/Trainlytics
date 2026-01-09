SELECT 
  DATE(Premiers_signes_de_reveil) AS Date
  , CASE
        WHEN (Score_de_recuperation_ IS NULL AND Effort_du_jour > 20) THEN 0
        ELSE Score_de_recuperation_
    END AS Score_de_recuperation
  , Frequence_cardiaque_au_repos_bpm
  , Variabilite_de_la_frequence_cardiaque_ms
  , Temperature_cutanee_Celsius
  , Niveau_d_oxygene_ AS Niveau_d_oxygene
  , Effort_du_jour
  , Depense_energetique_cal
  , FC_moyenne_bpm
  , Performance_Sommeil_ AS Performance_Sommeil
  , Frequence_respiratoire_tr_min
  , ROUND(Duree_du_sommeil_min/60,1) AS Duree_du_sommeil_heure
  , ROUND(Duree_du_sommeil_leger_min/Duree_du_sommeil_min,1) AS Duree_du_sommeil_leger_pourcentage
  , ROUND(Duree_du_sommeil_profond_min/Duree_du_sommeil_min,1) AS Duree_du_sommeil_profond_pourcentage
  , ROUND(Duree_du_sommeil_paradoxal_min/Duree_du_sommeil_min,1) AS Duree_du_sommeil_paradoxal_heure
  , Dette_de_sommeil_min
  , Efficacite_du_sommeil_ AS Efficacite_du_sommeil
  , CASE
      WHEN Regularite_du_sommeil_ IS NULL THEN 0
      ELSE Regularite_du_sommeil_
    END AS Regularite_du_sommeil
FROM {{ source('raw', 'whoop') }}
WHERE DATE(Premiers_signes_de_reveil) IS NOT NULL
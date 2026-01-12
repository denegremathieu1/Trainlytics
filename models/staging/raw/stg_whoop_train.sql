SELECT
    DATE(Heure_de_fin_de_l_entrainement) AS Date
    , Duree_min
    , Nom_de_l_activite
    , Effort_activite
    , Zone_FC_1
    , Zone_FC_2
    , Zone_FC_3
    , Zone_FC_4
    , Zone_FC_5
FROM {{ source('raw', 'whoop_train') }}
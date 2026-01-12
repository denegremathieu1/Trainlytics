# Trainlytics
Sport performance analysis - Analyse de l’impact de la récupération sur la performance

Une bonne récupération physiologique influence-t-elle la performance sportive ?

Objectifs :
 - Prévenir les risques de fatigue et de blessures
 - Trouver l’équilibre idéal dans son plan d'entraînement en restant à l’écoute de son corps

Outils de collectes massives de données :
  - Strava
  - Garmin
  - Whoop

DATASET 

Description :
Exports csv de données personnelles Strava, Garmin et Whoop , sur 3 ans de 2023 à 2026

6 tables de données & Colonnes clés :
Score de récupération % : indicateur de récupération
Variabilité de la fréquence cardiaque (ms) : mesure fine du système nerveux autonome
Performance Sommeil % : indicateur de sommeil
Durée du sommeil profond (min) : durée de sommeil profond
Puissance moyenne (W) : puissance moyenne développée sur le vélo
Training Stress Score (TSS) : estimation de la charge d'entraînement
FC moyenne (bpm) : fréquence cardiaque moyenne
Dénivelé positif, durée, température

APPROCHE

Outils :
BigQuery / DBT pour le stockage, nettoyage et transformation des données.
Python pour les relations de corrélation.
Looker/BI pour la réalisation du dashboard et les visualisations.
Étapes clés :
 - Exploration et nettoyage des données : compréhension, valeurs manquantes, uniformisation des données entre elles, identification des données clés WHOOP et Garmin/Strava
 - Transformation des données et exploration visuelle : fusionner les datasets par date, visualiser les séries temporelles (récupération, puissance, HRV), identifier les tendances
 - Analyse descriptive et segmentée : par corrélations (récupération VS NP, HRV vs Watts/BPM), par comparaisons de groupes (jours de bonne vs mauvaise récupération)
 - Insights et recommandations : confirmation ou non de l’hypothèse, identification de facteurs secondaires (sommeil, charge cumulative, durée des sorties, comportement)

HYPOTHESES

Une récupération élevée (score Whoop > 70%) est corrélée à une meilleure performance sur Strava (meilleur temps, puissance, cadence, vitesse moyenne).
Le sommeil profond (Whoop) est positivement corrélé à la variabilité de la fréquence cardiaque (HRV) et aux performances du lendemain.
La fréquence cardiaque au repos (Garmin) varie inversement avec la qualité du sommeil (Whoop).
La température ou l’humidité (Strava météo) influence la récupération physiologique (Whoop).
Les performances en extérieur sont significativement meilleures dans des conditions de température modérée (10–18°C).
Une régularité du sommeil (heures de coucher/lever stables) est associée à une meilleure constance de performance.

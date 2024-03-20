# Dacker technical test


## I. Ingestion & Préparation de la table orders:

#### Question 1:
cf section1_question1.sql
#### Question 2:
La colonne ID n'est pas une clé primaire, vu qu'on peut avoir plusieurs lignes par ID (ex: 2, 5), la clé primaire doit être unique pour chaque ligne.

#### Question 3:

Vu que à chaque nouvelle ligne, on vient appliquer des modification sur le statut de la commande. On peut écrire une requête pour avoir seulement la ligne la plus récente.
cf section3_question3.sql.

## II. Transformation & Etude des données:

### A. Etude des produits:

#### Question 1:
cf section2A_question1.sql

#### Question 2:
cf section2A_question2.sql

### B. Réconciliation paiements/montant de commande:
#### Question 1:
cf section2B_question1.sql

#### Question 2:
Effectivement, tout semble cohérent, d'ailleurs, même si nous avon l'ordre 2 où il y a un défaut de 50€, on voit bien un partial refunded et un remboursement de 50€ dans la table des transactions.

### C.Cohorts LTV:

#### Question1:
cf section2C_question1.sql

#### Question 2:
cf section2C_question2.sql

#### Question 3:

Ce type d'analyse permet de voir la progression des achats des clients, et ainsi analyser l'effet de tous les efforts de l'entreprise notamment sur les programmes de fidélisation et le marketing. On peut mettre cette étude plus en perspective en la raffinant encore, avec par exemple, la prise en compte des segments de clients et/ou des données démographiques, afin de déterminer les groupes sur lesqueles les campagnes publicitaires (ou programmes de fidélisation) ont eu plus d'effet, quels sont les groupes qu'on aimerai cibler d'avantage et ainsi de suite.

## IV. Architecture:

Si on veut adopter une approche en streaming, on peut mettre en place un worker, qui va lire les binlogs de la base de données, détecter les changements, et les pousser dans une topic pubsub, ensuite, une pipeline en Apache Beam par exemple permettre de pour chaque commande reçue déterminer le mois d'achat, et écrire le recorde de la commande à la fois dans la table des commandes ainsi que dans la table intermédiaire LTV, et un job (Soit avec un framework comme airflow ou dbt ou juste des scheduled queries de Bigquery) régulier avec un simple SUM et un GROUP BY sur la table intermédiaire LTV nous calculer la LTV actuelle, qui continuera à être mise à jour jusqu'à la fin du mois. 
Si on veut calculer la LTV en batch, on peut mettre en place un ETL, qui se branchera directement sur la DB, executer les requêtes précedentes, et charger les données dans des tables qui seront utilisées par la suite par l'outil de visualisation.


-- Projet Tifosi
-- Script des 10 requêtes de test

USE tifosi;


-- Requête 1 : afficher les noms des focaccias
-- But : trier les focaccias par ordre alphabétique croissant

SELECT nom
FROM focaccia
ORDER BY nom ASC;

-- Résultat attendu : les 8 focaccias classées par ordre alphabétique
-- Résultat obtenu : Américaine, Emmentalaccia, Gorgonzollaccia, Hawaienne, Mozaccia, Paysanne, Raclaccia et Tradizione
-- Commentaire : le résultat obtenu correspond au résultat attendu.


-- Requête 2 : compter le nombre total d'ingrédients
-- But : connaître le nombre d'ingrédients enregistrés

SELECT COUNT(*) AS nombre_ingredients
FROM ingredient;


-- Résultat attendu : 25 ingrédients
-- Résultat obtenu : 25 ingrédients
-- Commentaire : le résultat obtenu correspond au résultat attendu.


-- Requête 3 : calculer le prix moyen des focaccias
-- But : connaître le prix moyen d'une focaccia

SELECT AVG(prix) AS prix_moyen
FROM focaccia;


-- Résultat attendu : 10.375
-- Résultat obtenu : 10.375
-- Commentaire : le résultat obtenu correspond au résultat attendu.


-- Requête 4 : afficher les boissons avec leur marque
-- But : associer chaque boisson au nom de sa marque
-- et trier les résultats par nom de boisson

SELECT
    boisson.nom_boisson,
    marque.nom_marque
FROM boisson
JOIN marque
    ON boisson.id_marque = marque.id_marque
ORDER BY boisson.nom_boisson ASC;

-- Résultat attendu : 12 boissons associées à leur marque, par ordre alphabétique
-- Résultat obtenu : 12 boissons affichées avec leur marque
-- Commentaire : le résultat obtenu correspond au résultat attendu.


-- Requête 5 : afficher les ingrédients de la Raclaccia
-- But : retrouver les ingrédients qui composent cette focaccia

SELECT
    ingredient.nom AS nom_ingredient,
    comprend.quantite
FROM focaccia
JOIN comprend
    ON focaccia.id_focaccia = comprend.id_focaccia
JOIN ingredient
    ON comprend.id_ingredient = ingredient.id_ingredient
WHERE focaccia.nom = 'Raclaccia'
ORDER BY ingredient.nom ASC;


-- Résultat attendu : les ingrédients de la Raclaccia avec leurs quantités
-- Résultat obtenu : 7 ingrédients affichés
-- Commentaire : la requête retourne les ingrédients et les quantités enregistrés pour la Raclaccia.


-- Requête 6 : compter les ingrédients de chaque focaccia
-- But : afficher chaque focaccia avec son nombre d'ingrédients

SELECT
    focaccia.nom AS nom_focaccia,
    COUNT(comprend.id_ingredient) AS nombre_ingredients
FROM focaccia
LEFT JOIN comprend
    ON focaccia.id_focaccia = comprend.id_focaccia
GROUP BY focaccia.id_focaccia, focaccia.nom
ORDER BY focaccia.nom ASC;

-- Résultat attendu : 8 focaccias avec leur nombre d'ingrédients
-- Résultat obtenu : 8 lignes
-- Commentaire : le résultat obtenu correspond au résultat attendu.


-- Requête 7 : trouver la focaccia qui contient le plus d'ingrédients
-- But : identifier la focaccia ayant le plus grand nombre d'ingrédients

SELECT
    focaccia.nom AS nom_focaccia,
    COUNT(comprend.id_ingredient) AS nombre_ingredients
FROM focaccia
JOIN comprend
    ON focaccia.id_focaccia = comprend.id_focaccia
GROUP BY focaccia.id_focaccia, focaccia.nom
ORDER BY nombre_ingredients DESC
LIMIT 1;

-- Résultat attendu : Paysanne, avec 12 ingrédients
-- Résultat obtenu : Paysanne, avec 12 ingrédients
-- Commentaire : le résultat obtenu correspond au résultat attendu.


-- Requête 8 : trouver les focaccias contenant de l'ail
-- But : afficher les focaccias qui ont de l'ail parmi leurs ingrédients

SELECT DISTINCT
    focaccia.nom AS nom_focaccia
FROM focaccia
JOIN comprend
    ON focaccia.id_focaccia = comprend.id_focaccia
JOIN ingredient
    ON comprend.id_ingredient = ingredient.id_ingredient
WHERE ingredient.nom = 'Ail'
ORDER BY focaccia.nom ASC;

-- Résultat attendu : 4 focaccias
-- Résultat obtenu : Gorgonzollaccia, Mozaccia, Paysanne et Raclaccia
-- Commentaire : le résultat obtenu correspond au résultat attendu.


-- Requête 9 : trouver les ingrédients jamais utilisés
-- But : identifier les ingrédients qui ne sont associés à aucune focaccia

SELECT
    ingredient.nom AS nom_ingredient
FROM ingredient
LEFT JOIN comprend
    ON ingredient.id_ingredient = comprend.id_ingredient
WHERE comprend.id_ingredient IS NULL
ORDER BY ingredient.nom ASC;

-- Résultat attendu : Salami et Tomate cerise
-- Résultat obtenu : 2 ingrédients, Salami et Tomate cerise
-- Commentaire : le résultat obtenu correspond au résultat attendu.


-- Requête 10 : trouver les focaccias sans champignons
-- But : identifier les focaccias qui ne contiennent pas de champignons

SELECT
    focaccia.nom AS nom_focaccia
FROM focaccia
WHERE NOT EXISTS (
    SELECT 1
    FROM comprend
    JOIN ingredient
        ON comprend.id_ingredient = ingredient.id_ingredient
    WHERE comprend.id_focaccia = focaccia.id_focaccia
      AND ingredient.nom = 'Champignon'
)
ORDER BY focaccia.nom ASC;

-- Résultat attendu : Américaine et Hawaienne
-- Résultat obtenu : 2 focaccias, Américaine et Hawaienne
-- Commentaire : le résultat obtenu correspond au résultat attendu.


-- Projet Tifosi
-- Script d'insertion des données de test
-- Tables : ingredient, focaccia, marque et boisson

USE tifosi;


-- Insertion des ingrédients
INSERT IGNORE INTO ingredient (nom)
VALUES
    ('Ail'),
    ('Ananas'),
    ('Artichaut'),
    ('Bacon'),
    ('Base Tomate'),
    ('Base crème'),
    ('Champignon'),
    ('Chevre'),
    ('Cresson'),
    ('Emmental'),
    ('Gorgonzola'),
    ('Jambon cuit'),
    ('Jambon fumé'),
    ('Oeuf'),
    ('Oignon'),
    ('Olive noire'),
    ('Olive verte'),
    ('Parmesan'),
    ('Piment'),
    ('Poivre'),
    ('Pomme de terre'),
    ('Raclette'),
    ('Salami'),
    ('Tomate cerise'),
    ('Mozarella');


-- Insertion des focaccias
INSERT IGNORE INTO focaccia (nom, prix)
VALUES
    ('Mozaccia', 9.80),
    ('Gorgonzollaccia', 10.80),
    ('Raclaccia', 8.90),
    ('Emmentalaccia', 9.80),
    ('Tradizione', 8.90),
    ('Hawaienne', 11.20),
    ('Américaine', 10.80),
    ('Paysanne', 12.80);


-- Insertion des marques
INSERT IGNORE INTO marque (nom_marque)
VALUES
    ('Coca-cola'),
    ('Pepsico'),
    ('Monster'),
    ('Cristalline');

-- Insertion des boissons
INSERT IGNORE INTO boisson (nom_boisson, id_marque)
VALUES
    ('Coca-cola zéro', 1),
    ('Coca-cola original', 1),
    ('Fanta citron', 1),
    ('Fanta orange', 1),
    ('Capri-sun', 1),
    ('Pepsi', 2),
    ('Pepsi Max Zéro', 2),
    ('Lipton zéro citron', 2),
    ('Lipton Peach', 2),
    ('Monster energy ultra gold', 3),
    ('Monster energy ultra blue', 3),
    ('Eau de source', 4);



-- Association des focaccias avec leurs ingrédients
-- Les quantités sont exprimées en grammes, sauf indication contraire.

INSERT INTO comprend (id_focaccia, id_ingredient, quantite)
SELECT f.id_focaccia, i.id_ingredient, données.quantite
FROM (
    SELECT 1 AS id_focaccia, 'Base Tomate' AS nom_ingredient, 200 AS quantite
    UNION ALL SELECT 1, 'Mozarella', 50
    UNION ALL SELECT 1, 'Cresson', 20
    UNION ALL SELECT 1, 'Jambon fumé', 80
    UNION ALL SELECT 1, 'Ail', 2
    UNION ALL SELECT 1, 'Artichaut', 20
    UNION ALL SELECT 1, 'Champignon', 40
    UNION ALL SELECT 1, 'Parmesan', 50
    UNION ALL SELECT 1, 'Poivre', 1
    UNION ALL SELECT 1, 'Olive noire', 10

    UNION ALL SELECT 2, 'Base Tomate', 200
    UNION ALL SELECT 2, 'Gorgonzola', 50
    UNION ALL SELECT 2, 'Cresson', 20
    UNION ALL SELECT 2, 'Ail', 2
    UNION ALL SELECT 2, 'Champignon', 40
    UNION ALL SELECT 2, 'Parmesan', 50
    UNION ALL SELECT 2, 'Poivre', 1
    UNION ALL SELECT 2, 'Olive noire', 20

    UNION ALL SELECT 3, 'Base Tomate', 200
    UNION ALL SELECT 3, 'Raclette', 50
    UNION ALL SELECT 3, 'Cresson', 20
    UNION ALL SELECT 3, 'Ail', 2
    UNION ALL SELECT 3, 'Champignon', 40
    UNION ALL SELECT 3, 'Parmesan', 50
    UNION ALL SELECT 3, 'Poivre', 1

    UNION ALL SELECT 4, 'Base crème', 200
    UNION ALL SELECT 4, 'Emmental', 50
    UNION ALL SELECT 4, 'Cresson', 20
    UNION ALL SELECT 4, 'Champignon', 40
    UNION ALL SELECT 4, 'Parmesan', 50
    UNION ALL SELECT 4, 'Poivre', 1
    UNION ALL SELECT 4, 'Oignon', 20

    UNION ALL SELECT 5, 'Base Tomate', 200
    UNION ALL SELECT 5, 'Mozarella', 50
    UNION ALL SELECT 5, 'Cresson', 20
    UNION ALL SELECT 5, 'Jambon cuit', 80
    UNION ALL SELECT 5, 'Champignon', 80
    UNION ALL SELECT 5, 'Parmesan', 50
    UNION ALL SELECT 5, 'Poivre', 1
    UNION ALL SELECT 5, 'Olive noire', 10
    UNION ALL SELECT 5, 'Olive verte', 10

    UNION ALL SELECT 6, 'Base Tomate', 200
    UNION ALL SELECT 6, 'Mozarella', 50
    UNION ALL SELECT 6, 'Cresson', 20
    UNION ALL SELECT 6, 'Bacon', 80
    UNION ALL SELECT 6, 'Ananas', 40
    UNION ALL SELECT 6, 'Piment', 2
    UNION ALL SELECT 6, 'Parmesan', 50
    UNION ALL SELECT 6, 'Poivre', 1
    UNION ALL SELECT 6, 'Olive noire', 20

    UNION ALL SELECT 7, 'Base Tomate', 200
    UNION ALL SELECT 7, 'Mozarella', 50
    UNION ALL SELECT 7, 'Cresson', 20
    UNION ALL SELECT 7, 'Bacon', 80
    UNION ALL SELECT 7, 'Pomme de terre', 40
    UNION ALL SELECT 7, 'Parmesan', 50
    UNION ALL SELECT 7, 'Poivre', 1
    UNION ALL SELECT 7, 'Olive noire', 20

    UNION ALL SELECT 8, 'Base crème', 200
    UNION ALL SELECT 8, 'Chevre', 50
    UNION ALL SELECT 8, 'Cresson', 20
    UNION ALL SELECT 8, 'Pomme de terre', 80
    UNION ALL SELECT 8, 'Jambon fumé', 80
    UNION ALL SELECT 8, 'Ail', 2
    UNION ALL SELECT 8, 'Artichaut', 20
    UNION ALL SELECT 8, 'Champignon', 40
    UNION ALL SELECT 8, 'Parmesan', 50
    UNION ALL SELECT 8, 'Poivre', 1
    UNION ALL SELECT 8, 'Olive noire', 20
    UNION ALL SELECT 8, 'Oeuf', 50
) AS données
JOIN focaccia f ON f.id_focaccia = données.id_focaccia
JOIN ingredient i ON i.nom = données.nom_ingredient;


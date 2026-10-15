
-- Projet Tifosi
-- Script de création de la base de données

CREATE DATABASE IF NOT EXISTS tifosi;

USE tifosi;

-- Création de l'utilisateur du projet
CREATE USER IF NOT EXISTS 'tifosi'@'localhost'
IDENTIFIED BY 'Tifosi_Mdp_2026!';

GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';


-- Table des ingrédients
CREATE TABLE IF NOT EXISTS ingredient (
    id_ingredient INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_ingredient),
    UNIQUE (nom)
);


-- Table des focaccias
CREATE TABLE IF NOT EXISTS focaccia (
    id_focaccia INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prix DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (id_focaccia),
    UNIQUE (nom),
    CHECK (prix > 0)
);


-- Table d'association entre les focaccias et les ingrédients
CREATE TABLE IF NOT EXISTS comprend (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    quantite INT NOT NULL,
    PRIMARY KEY (id_focaccia, id_ingredient),
    CONSTRAINT fk_comprend_focaccia
        FOREIGN KEY (id_focaccia)
        REFERENCES focaccia(id_focaccia),
    CONSTRAINT fk_comprend_ingredient
        FOREIGN KEY (id_ingredient)
        REFERENCES ingredient(id_ingredient),
    CHECK (quantite > 0)
);


-- Table des marques
CREATE TABLE IF NOT EXISTS marque (
    id_marque INT NOT NULL AUTO_INCREMENT,
    nom_marque VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_marque),
    UNIQUE (nom_marque)
);


-- Table des boissons
CREATE TABLE IF NOT EXISTS boisson (
    id_boisson INT NOT NULL AUTO_INCREMENT,
    nom_boisson VARCHAR(100) NOT NULL,
    id_marque INT NOT NULL,
    PRIMARY KEY (id_boisson),
    CONSTRAINT fk_boisson_marque
        FOREIGN KEY (id_marque)
        REFERENCES marque(id_marque)
);


-- Table des menus
CREATE TABLE IF NOT EXISTS menu (
    id_menu INT NOT NULL,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL,
    id_focaccia INT NOT NULL,
    PRIMARY KEY (id_menu),
    CONSTRAINT fk_menu_focaccia
        FOREIGN KEY (id_focaccia)
        REFERENCES focaccia(id_focaccia),
    CHECK (prix > 0)
);


-- Table d'association entre les menus et les boissons
CREATE TABLE IF NOT EXISTS contient (
    id_menu INT NOT NULL,
    id_boisson INT NOT NULL,
    PRIMARY KEY (id_menu, id_boisson),
    CONSTRAINT fk_contient_menu
        FOREIGN KEY (id_menu)
        REFERENCES menu(id_menu),
    CONSTRAINT fk_contient_boisson
        FOREIGN KEY (id_boisson)
        REFERENCES boisson(id_boisson)
);

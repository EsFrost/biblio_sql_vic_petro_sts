-- Active: 1718374649866@@127.0.0.1@3306@biblio_sql
DROP DATABASE IF EXISTS biblio_sql;
CREATE DATABASE biblio_sql;
DROP TABLE IF EXISTS utilisateurs;
CREATE TABLE utilisateurs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    num_tel VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    amendes INT,
    niveau_acces INT NOT NULL
);
DROP TABLE IF EXISTS livres;
CREATE TABLE livres (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(255) NOT NULL,
    auteur VARCHAR(255) NOT NULL,
    dispo BOOLEAN
);
DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL
);
DROP TABLE IF EXISTS emprunts;

CREATE TABLE emprunts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    utilisateur_id INT NOT NULL,
    livre_id INT NOT NULL,
    date_emprunt DATE NOT NULL,
    date_retour DATE,
    delai_de_pret DATE,
    amende FLOAT,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateurs(id),
    FOREIGN KEY (livre_id) REFERENCES livres(id)
);
DROP TABLE IF EXISTS cat_livre;
CREATE TABLE cat_livre (
    id INT PRIMARY KEY AUTO_INCREMENT,
    livre_id INT NOT NULL,
    categorie_id INT NOT NULL,
    FOREIGN KEY (livre_id) REFERENCES livres(id),
    FOREIGN KEY (categorie_id) REFERENCES categories(id)
);
INSERT INTO utilisateurs (nom, prenom, adresse, num_tel, email, amendes, niveau_acces)
VALUES
    ('Doe', 'John', '123 Main St', '123-456-7890', 'jdoe@ex.com', 0, 0),
    ('Doe', 'Jane', '456 Oak St', '123-456-7890', 'jdoe@ex.com', 0, 0),
    ('Doe', 'Joe', '789 Elm St', '123-456-7890', 'jdoe@ex.com', 0, 1);
SELECT * FROM utilisateurs;
INSERT INTO categories (nom)
VALUES
    ('Roman'),
    ('Policier'),
    ('Science-fiction');
SELECT * FROM categories;
INSERT INTO livres (titre, auteur, dispo)
VALUES
    ('Le Seigneur des anneaux', 'Tolkien', 1),
    ('Le Puits', 'Tolkien', 1),
    ('Le retour du roi', 'Tolkien', 0);
SELECT * FROM livres;
INSERT INTO categories (nom)
VALUES
    ('Roman'),
    ('Policier'),
    ('Fantastique');
SELECT * FROM categories;
INSERT INTO cat_livre (livre_id, categorie_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 1),
    (3, 3);
SELECT * FROM cat_livre;
SELECT * FROM livres WHERE titre LIKE 'Le S%'; /* Titre */
SELECT * FROM livres WHERE auteur LIKE 'To%'; /* Auteur */
SELECT * FROM livres 
    INNER JOIN cat_livre
    ON livres.id = cat_livre.livre_id
    WHERE cat_livre.categorie_id = 1;
SELECT * FROM livres WHERE titre LIKE 'Le S%' OR auteur LIKE 'Le S%'; /* Titre et auteur, !ajouter categorie! */
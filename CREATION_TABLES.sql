-- Création de la base de données
CREATE DATABASE IF NOT EXISTS transport_logistique;

-- Création de la table "entrepots"
CREATE TABLE entrepots (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_entrepot VARCHAR(255),
    adresse VARCHAR(255),
    ville VARCHAR(255),
    country_code CHAR(2),
    FOREIGN KEY (country_code) REFERENCES countries(code)
);

-- Création de la table "expeditions"
CREATE TABLE expeditions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_expedition DATE,
    date_reception DATE,
    id_entrepot_source INT,
    id_entrepot_destination INT,
    poids DECIMAL(10, 2),
    statut VARCHAR(255),
    FOREIGN KEY (id_entrepot_source) REFERENCES entrepots(id),
    FOREIGN KEY (id_entrepot_destination) REFERENCES entrepots(id),
    id_country_source CHAR(2),
    id_country_destination CHAR(2),
    FOREIGN KEY (id_country_source) REFERENCES countries(code),
    FOREIGN KEY (id_country_destination) REFERENCES countries(code)
);

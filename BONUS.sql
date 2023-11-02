-- Ajoutez une table "clients"
CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255),
    adresse VARCHAR(255),
    ville VARCHAR(255),
    pays VARCHAR(255)
);

-- Ajoutez une table de jointure "expeditions_clients"
CREATE TABLE expeditions_clients (
    id_expedition INT,
    id_client INT,
    FOREIGN KEY (id_expedition) REFERENCES expeditions(id),
    FOREIGN KEY (id_client) REFERENCES clients(id)
);

-- Modifiez la table "expeditions" pour y ajouter une colonne "id_client"
ALTER TABLE expeditions
ADD COLUMN id_client INT,
ADD FOREIGN KEY (id_client) REFERENCES clients(id);

-- Ajoutez des données aux tables "clients" et "expeditions_clients"
INSERT INTO clients (nom, adresse, ville, pays) VALUES
    ('Client A', 'Adresse A1', 'Ville A', 'Pays A'),
    ('Client B', 'Adresse B1', 'Ville B', 'Pays B'),
    ('Client C', 'Adresse C1', 'Ville C', 'Pays C');

INSERT INTO expeditions_clients (id_expedition, id_client) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 2);

-- Écrivez des requêtes pour extraire les informations suivantes

-- Pour chaque client, affichez son nom, son adresse complète, le nombre total d'expéditions qu'il a envoyées et le nombre total d'expéditions qu'il a reçues.
SELECT c.nom, CONCAT(c.adresse, ', ', c.ville, ', ', c.pays) AS adresse_complete,
    COUNT(ec_sent.id_expedition) AS nombre_expeditions_envoyees,
    COUNT(ec_received.id_expedition) AS nombre_expeditions_recues
FROM clients c
LEFT JOIN expeditions_clients ec_sent ON c.id = ec_sent.id_client
LEFT JOIN expeditions_clients ec_received ON c.id = ec_received.id_client
GROUP BY c.id;

-- Pour chaque expédition, affichez son ID, son poids, le nom du client qui l'a initiée et le nom du client destinataire.
SELECT exp.id AS ID_expedition, exp.poids,
    c_sender.nom AS client_expediteur, c_receiver.nom AS client_destinataire
FROM expeditions exp
LEFT JOIN clients c_sender ON exp.id_client = c_sender.id
LEFT JOIN expeditions_clients ec ON exp.id = ec.id_expedition
LEFT JOIN clients c_receiver ON ec.id_client = c_receiver.id;

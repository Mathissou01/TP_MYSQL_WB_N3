-- Ajout de la table "clients"
CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255),
    adresse VARCHAR(255),
    ville VARCHAR(255),
    pays VARCHAR(255)
);

-- Ajout de la table de jointure "expeditions_clients"
CREATE TABLE expeditions_clients (
    id_expedition INT,
    id_client INT,
    FOREIGN KEY (id_expedition) REFERENCES expeditions(id),
    FOREIGN KEY (id_client) REFERENCES clients(id)
);

-- Modification de la table "expeditions" pour y ajouter une colonne "id_client"
ALTER TABLE expeditions
ADD COLUMN id_client INT,
ADD FOREIGN KEY (id_client) REFERENCES clients(id);

-- Ajout de données dans la table "clients"
INSERT INTO clients (nom, adresse, ville, pays) VALUES
    ('Client A', 'Adresse A', 'Ville A', 'FR'),
    ('Client B', 'Adresse B', 'Ville B', 'DE'),
    ('Client C', 'Adresse C', 'Ville C', 'IT'),
    ('Client D', 'Adresse D', 'Ville D', 'ES'),
    ('Client E', 'Adresse E', 'Ville E', 'TR');

-- Ajout de données dans la table "expeditions_clients"
INSERT INTO expeditions_clients (id_expedition, id_client) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 1),
    (6, 2),
    (7, 4),
    (8, 1),
    (9, 3),
    (10, 1),
    (11, 2),
    (12, 3),
    (13, 4),
    (14, 1),
    (15, 2),
    (16, 3),
    (17, 4),
    (18, 1),
    (19, 5),
    (20, 1),
    (21, 2),
    (22, 3),
    (23, 4),
    (24, 5),
    (25, 1),
    (26, 1),
    (27, 2),
    (28, 3);

-- Pour chaque client, affichez son nom, son adresse complète, le nombre total d'expéditions qu'il a envoyées et le nombre total d'expéditions qu'il a reçues.
SELECT 
    c.nom AS 'Nom du client',
    CONCAT(c.adresse, ', ', c.ville, ', ', c.pays) AS 'Adresse complète',
    COALESCE(sent.count, 0) AS 'Nombre d''expéditions envoyées',
    COALESCE(received.count, 0) AS 'Nombre d''expéditions reçues'
FROM clients c
LEFT JOIN (
    SELECT ec.id_client, COUNT(*) AS count
    FROM expeditions_clients ec
    JOIN expeditions e ON ec.id_expedition = e.id AND e.id_client = ec.id_client
    GROUP BY id_client
) AS sent ON c.id = sent.id_client
LEFT JOIN (
    SELECT ec.id_client, COUNT(*) AS count
    FROM expeditions_clients ec
    JOIN expeditions e ON ec.id_expedition = e.id AND e.id_client <> ec.id_client
    GROUP BY id_client
) AS received ON c.id = received.id_client;


-- Pour chaque expédition, affichez son ID, son poids, le nom du client qui l'a initiée et le nom du client destinataire.
SELECT 
    e.id AS 'ID de l''expédition',
    e.poids AS 'Poids',
    sender.nom AS 'Client expéditeur',
    receiver.nom AS 'Client destinataire',
    e.statut AS 'Statut'
FROM expeditions e
LEFT JOIN expeditions_clients ec ON e.id = ec.id_expedition
LEFT JOIN clients sender ON e.id_client = sender.id
LEFT JOIN clients receiver ON ec.id_client = receiver.id;

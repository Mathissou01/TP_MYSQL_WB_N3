-- Ajout de données dans la table "entrepots" en utilisant les codes de pays correspondants
INSERT INTO entrepots (nom_entrepot, adresse, ville, country_code) VALUES
    ('Entrepot A', 'Adresse A', 'Ville A', 'FR'),
    ('Entrepot B', 'Adresse B', 'Ville B', 'DE'),
    ('Entrepot C', 'Adresse C', 'Ville C', 'IT'),
    ('Entrepot D', 'Adresse D', 'Ville D', 'ES'),
    ('Entrepot E', 'Adresse E', 'Ville E', 'TR'),
    ('Entrepot F', 'Adresse F', 'Ville F', 'PT'),
    ('Entrepot G', 'Adresse G', 'Ville G', 'GR'),
    ('Entrepot H', 'Adresse H', 'Ville H', 'NL'),
    ('Entrepot I', 'Adresse I', 'Ville I', 'BE'),
    ('Entrepot J', 'Adresse J', 'Ville J', 'SE'),
    ('Entrepot K', 'Adresse K', 'Ville K', 'FR'),
    ('Entrepot L', 'Adresse L', 'Ville L', 'GR')

-- Ajout de données dans la table "expeditions" en utilisant les codes de pays correspondants pour les entrepôts source et destination
INSERT INTO expeditions (date_expedition, date_reception, id_entrepot_source, id_entrepot_destination, poids, statut, id_country_source, id_country_destination) VALUES
    ('2023-01-15', NULL, 1, 3, 250.5, 'En transit', 'FR', 'IT'),
    ('2023-02-20', '2023-02-22', 2, 4, 180.75, 'Livré', 'DE', 'ES'),
    ('2023-03-10', NULL, 3, 1, 300.0, 'En transit', 'IT', 'FR'),
    ('2023-04-05', NULL, 4, 2, 500.25, 'En transit', 'ES', 'DE'),
    ('2023-05-18', '2023-05-25', 5, 1, 150.0, 'Livré', 'ES', 'FR'),
    ('2023-06-22', NULL, 2, 5, 430.0, 'En transit', 'DE', 'FR'),
    ('2023-07-11', NULL, 4, 3, 275.0, 'En transit', 'ES', 'FR'),
    ('2023-08-30', NULL, 1, 4, 200.0, 'En transit', 'FR', 'ES'),
    ('2023-09-14', '2023-09-17', 3, 5, 350.0, 'Livré', 'IT', 'FR'),
    ('2023-10-19', NULL, 5, 2, 170.0, 'En transit', 'FR', 'DE'),
    ('2023-11-25', NULL, 2, 1, 310.0, 'En transit', 'DE', 'FR'),
    ('2023-12-30', '2024-01-02', 3, 4, 420.0, 'Livré', 'IT', 'ES'),
    ('2024-01-05', NULL, 4, 5, 250.0, 'En transit', 'ES', 'FR'),
    ('2024-02-10', NULL, 5, 3, 380.0, 'En transit', 'FR', 'IT'),
    ('2024-03-15', '2024-03-20', 1, 2, 290.0, 'Livré', 'FR', 'DE'),
    ('2024-04-20', NULL, 2, 3, 340.0, 'En transit', 'DE', 'IT'),
    ('2024-05-25', NULL, 3, 4, 270.0, 'En transit', 'IT', 'ES'),
    ('2024-06-30', '2024-07-05', 4, 5, 390.0, 'Livré', 'ES', 'FR'),
    ('2024-08-05', NULL, 5, 1, 330.0, 'En transit', 'FR', 'FR'),
    ('2024-08-06', NULL, 4, 1, 350.0, 'En transit', 'FR', 'KH'),
    ('2024-08-07', NULL, 5, 3, 310.0, 'En transit', 'KH', 'FR'),
    ('2024-10-05', '2024-10-08', 5, 1, 330.0, 'Livré', 'KH', 'KH'),
    ('2024-10-05', '2024-10-07', 1, 2, 850.0, 'Livré', 'FR', 'FR'),
    ('2024-12-08', NULL, 1, 11, 850.0, 'En transit', 'FR', 'FR'),
    ('2024-12-08', '2024-12-10', 1, 11, 850.0, 'Livré', 'FR', 'FR'),
    ('2024-02-08', '2024-02-10', 7, 12, 857.0, 'Livré', 'GR', 'GR')
    
--Update de ma table expedictions
UPDATE expeditions SET date_reception = '2023-01-16' WHERE id = "1"

UPDATE expeditions SET statut = 'En transit' WHERE id = "2"


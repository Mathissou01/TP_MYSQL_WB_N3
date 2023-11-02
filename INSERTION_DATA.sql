-- Ajout de données dans la table "entrepots"
INSERT INTO entrepots (nom_entrepot, adresse, ville, pays) VALUES
    ('Entrepot A', 'Adresse A', 'Ville A', 'Pays A'),
    ('Entrepot B', 'Adresse B', 'Ville B', 'Pays B'),
    ('Entrepot C', 'Adresse C', 'Ville C', 'Pays C'),
    ('Entrepot D', 'Adresse D', 'Ville D', 'Pays D'),
    ('Entrepot E', 'Adresse E', 'Ville E', 'Pays E');

-- Ajout de données dans la table "expeditions"
INSERT INTO expeditions (date_expedition, id_entrepot_source, id_entrepot_destination, poids, statut) VALUES
    ('2023-01-15', 1, 3, 250.5, 'En cours'),
    ('2023-02-20', 2, 4, 180.75, 'Livré'),
    ('2023-03-10', 3, 1, 300.0, 'En attente'),
    ('2023-04-05', 4, 2, 500.25, 'En cours'),
    ('2023-05-18', 5, 1, 150.0, 'Livré'),
    ('2023-06-22', 2, 5, 430.0, 'En cours'),
    ('2023-07-11', 4, 3, 275.0, 'En cours'),
    ('2023-08-30', 1, 4, 200.0, 'En attente'),
    ('2023-09-14', 3, 5, 350.0, 'Livré'),
    ('2023-10-19', 5, 2, 170.0, 'En attente');
   
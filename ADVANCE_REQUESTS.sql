-- Requetes avancées
-- Affichez les entrepôts qui ont envoyé au moins une expédition en transit.
SELECT DISTINCT e.id, e.nom_entrepot
FROM entrepots e
INNER JOIN expeditions exp ON e.id = exp.id_entrepot_source
WHERE exp.statut = 'En cours';

-- Affichez les entrepôts qui ont reçu au moins une expédition en transit.
SELECT DISTINCT e.id, e.nom_entrepot
FROM entrepots e
INNER JOIN expeditions exp ON e.id = exp.id_entrepot_destination
WHERE exp.statut = 'En cours';

-- Affichez les expéditions qui ont un poids supérieur à 100 kg et qui sont en transit.
SELECT *
FROM expeditions
WHERE poids > 100 AND statut = 'En cours';

-- Affichez le nombre d'expéditions envoyées par chaque entrepôt.
SELECT e.id, e.nom_entrepot, COUNT(exp.id) AS nombre_expeditions_envoyees
FROM entrepots e
LEFT JOIN expeditions exp ON e.id = exp.id_entrepot_source
GROUP BY e.id;

-- Affichez le nombre total d'expéditions en transit.
SELECT COUNT(*) AS nombre_total_expeditions_en_transit
FROM expeditions
WHERE statut = 'En cours';

-- Affichez le nombre total d'expéditions livrées.
SELECT COUNT(*) AS nombre_total_expeditions_livrees
FROM expeditions
WHERE statut = 'Livré';

-- Affichez le nombre total d'expéditions pour chaque mois de l'année en cours.
SELECT MONTH(date_expedition) AS mois, COUNT(*) AS nombre_expeditions
FROM expeditions
WHERE YEAR(date_expedition) = YEAR(CURDATE())
GROUP BY MONTH(date_expedition);

-- Affichez les entrepôts qui ont envoyé des expéditions au cours des 30 derniers jours.
SELECT DISTINCT e.id, e.nom_entrepot
FROM entrepots e
INNER JOIN expeditions exp ON e.id = exp.id_entrepot_source
WHERE exp.date_expedition >= CURDATE() - INTERVAL 30 DAY;

-- Affichez les entrepôts qui ont reçu des expéditions au cours des 30 derniers jours.
SELECT DISTINCT e.id, e.nom_entrepot
FROM entrepots e
INNER JOIN expeditions exp ON e.id = exp.id_entrepot_destination
WHERE exp.date_expedition >= CURDATE() - INTERVAL 30 DAY;

-- Affichez les expéditions qui ont été livrées dans un délai de moins de 5 jours ouvrables.
SELECT *
FROM expeditions
WHERE statut = 'Livré' AND DATEDIFF(date_expedition, CURDATE()) <= 5;

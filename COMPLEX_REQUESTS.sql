-- Requêtes complexes 
-- Affichez les expéditions en transit qui ont été initiées par un entrepôt situé en Europe et à destination d'un entrepôt situé en Asie.
SELECT exp.*
FROM expeditions exp
INNER JOIN entrepots ent_src ON exp.id_entrepot_source = ent_src.id
INNER JOIN entrepots ent_dest ON exp.id_entrepot_destination = ent_dest.id
WHERE ent_src.pays IN ('France', 'Germany', 'Spain', 'Italy', 'United Kingdom') -- Liste des pays européens
    AND ent_dest.pays IN ('China', 'Japan', 'India', 'South Korea') -- Liste des pays asiatiques
    AND exp.statut = 'En cours';

-- Affichez les entrepôts qui ont envoyé des expéditions à destination d'un entrepôt situé dans le même pays.
SELECT e.*
FROM entrepots e
INNER JOIN expeditions exp ON e.id = exp.id_entrepot_source
INNER JOIN entrepots dest ON exp.id_entrepot_destination = dest.id
WHERE e.pays = dest.pays;

-- Affichez les entrepôts qui ont envoyé des expéditions à destination d'un entrepôt situé dans un pays différent.
SELECT e.*
FROM entrepots e
INNER JOIN expeditions exp ON e.id = exp.id_entrepot_source
INNER JOIN entrepots dest ON exp.id_entrepot_destination = dest.id
WHERE e.pays != dest.pays;

-- Affichez les expéditions en transit qui ont été initiées par un entrepôt situé dans un pays dont le nom commence par la lettre "F" et qui pèsent plus de 500 kg.
SELECT exp.*
FROM expeditions exp
INNER JOIN entrepots ent ON exp.id_entrepot_source = ent.id
WHERE ent.pays LIKE 'F%' -- Pays dont le nom commence par la lettre "F"
    AND exp.poids > 500
    AND exp.statut = 'En cours';

-- Affichez le nombre total d'expéditions pour chaque combinaison de pays d'origine et de destination.
SELECT ent_src.pays AS pays_origine, ent_dest.pays AS pays_destination, COUNT(*) AS nombre_expeditions
FROM expeditions exp
INNER JOIN entrepots ent_src ON exp.id_entrepot_source = ent_src.id
INNER JOIN entrepots ent_dest ON exp.id_entrepot_destination = ent_dest.id
GROUP BY ent_src.pays, ent_dest.pays;

-- Affichez les entrepôts qui ont envoyé des expéditions au cours des 30 derniers jours et dont le poids total des expéditions est supérieur à 1000 kg.
SELECT e.id, e.nom_entrepot, SUM(exp.poids) AS poids_total
FROM entrepots e
INNER JOIN expeditions exp ON e.id = exp.id_entrepot_source
WHERE exp.date_expedition >= CURDATE() - INTERVAL 30 DAY
GROUP BY e.id
HAVING SUM(exp.poids) > 1000;

-- Affichez les expéditions qui ont été livrées avec un retard de plus de 2 jours ouvrables.
SELECT *
FROM expeditions
WHERE statut = 'Livré' AND DATEDIFF(date_expedition, CURDATE()) > 2;

-- Affichez le nombre total d'expéditions.
SELECT COUNT(*) AS nombre_total_expeditions
FROM expeditions;


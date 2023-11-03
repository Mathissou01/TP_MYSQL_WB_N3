-- Requêtes complexes 
-- Affichez les expéditions en transit qui ont été initiées par un entrepôt situé en Europe et à destination d'un entrepôt situé en Asie.
SELECT *
FROM expeditions AS e
JOIN entrepots AS source ON e.id_entrepot_source = source.id
JOIN entrepots AS dest ON e.id_entrepot_destination = dest.id
JOIN countries AS source_country ON e.id_country_source = source_country.code
JOIN countries AS dest_country ON e.id_country_destination = dest_country.code
WHERE source_country.continentcode = 'EU'  -- Entrepôt source en Europe
  AND dest_country.continentcode = 'AS'   -- Entrepôt destination en Asie
  AND e.statut = 'En transit';


-- Affichez les entrepôts qui ont envoyé des expéditions à destination d'un entrepôt situé dans le même pays.
-- !!
SELECT DISTINCT source.*
FROM expeditions AS e
JOIN entrepots AS source ON e.id_entrepot_source = source.id
JOIN entrepots AS dest ON e.id_entrepot_destination = dest.id
WHERE source.country_code = dest.country_code;
-- !!

-- Affichez les entrepôts qui ont envoyé des expéditions à destination d'un entrepôt situé dans un pays différent.
SELECT DISTINCT source.*
FROM expeditions AS e
JOIN entrepots AS source ON e.id_entrepot_source = source.id
JOIN entrepots AS dest ON e.id_entrepot_destination = dest.id
WHERE source.country_code != dest.country_code;

-- Affichez les expéditions en transit qui ont été initiées par un entrepôt situé dans un pays dont le nom commence par la lettre "F" et qui pèsent plus de 500 kg.

SELECT *
FROM expeditions AS e
JOIN entrepots AS source ON e.id_entrepot_source = source.id
JOIN countries AS source_country ON e.id_country_source = source_country.code
WHERE source_country.name LIKE 'F%' -- Pays dont le nom commence par la lettre 'F'
  AND e.poids > 500
  AND e.statut = 'En transit';

-- -----!!
-- Affichez le nombre total d'expéditions pour chaque combinaison de pays d'origine et de destination.
SELECT id_country_source, id_country_destination, COUNT(*) AS nombre_expeditions
FROM expeditions
GROUP BY id_country_source, id_country_destination;


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


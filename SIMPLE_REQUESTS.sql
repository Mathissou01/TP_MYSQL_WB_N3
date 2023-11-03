 -- Requetes de base
-- Affichez tous les entrepôts 
SELECT * FROM entrepots;

-- Affichez toutes les expéditions :
SELECT * FROM expeditions;

-- Affichez toutes les expéditions en transit (statut "En cours") :
SELECT * FROM expeditions WHERE statut = 'En cours';

-- Affichez toutes les expéditions livrées (statut "Livré") :
SELECT * FROM expeditions WHERE statut = 'Livré';

-- Affichez tout mes pays :
SELECT * FROM countries;

-- Quelques requêtes d'exemple sur le schéma crée
-- Joindre les données pour avoir les notes laissées par chaque user sur chaque jeu
SELECT
    u.pseudo,
    g.name,
    c.label,
    r.value
FROM
    user u
    JOIN rate r ON u.user_id = r.user_id
    JOIN game g ON g.game_id = r.game_id
    JOIN criterion c ON c.criterion_id = r.criterion_id;

-- Créer une vue (fenêtre sur la base). Cette vue est requêtable comme n'importe quelle table. Elle reflète en permanence l'état des tables sous-jacentes. Elle est stockée en mémoire RAM.
CREATE VIEW game_rating AS
SELECT
    u.pseudo,
    g.name,
    c.label,
    r.value
FROM
    user u
    JOIN rate r ON u.user_id = r.user_id
    JOIN game g ON g.game_id = r.game_id
    JOIN criterion c ON c.criterion_id = r.criterion_id;

-- Récupérer tous les jeux notés par 'enzo' (distinct)
SELECT
    DISTINCT name
FROM
    game_rating
WHERE
    pseudo = 'enzo';

-- Récupérer tous les jeux notés par 'julie'
SELECT
    DISTINCT name
FROM
    game_rating
WHERE
    pseudo = 'julie' -- Opérations ensemblistes
    -- UNION (OU)
    -- Récupérer les jeux notés par julie ou par enzo (jeux notés par l'un ou l'autre ou les 2)
SELECT
    DISTINCT name
FROM
    game_rating
WHERE
    pseudo = 'enzo'
UNION
SELECT
    DISTINCT name
FROM
    game_rating
WHERE
    pseudo = 'julie';

-- DIFFERENCE (NOT IN)
-- Récupérer les jeux notés par enzo mais pas par julie (jeux notés par l'un et non par l'autre) (Différence)
SELECT
    DISTINCT name
FROM
    game_rating
WHERE
    pseudo = 'enzo'
EXCEPT
SELECT
    DISTINCT name
FROM
    game_rating
WHERE
    pseudo = 'julie';

-- Récupérer les jeux notés par julie mais pas par enzo (jeux notés par l'un et non par l'autre) (Différence)
SELECT
    DISTINCT name
FROM
    game_rating
WHERE
    pseudo = 'julie'
EXCEPT
SELECT
    DISTINCT name
FROM
    game_rating
WHERE
    pseudo = 'enzo';

-- INTERSECTION (ET)
-- Récupérer les jeux notés par julie ET enzo (jeux notés en commun)
SELECT
    DISTINCT name
FROM
    game_rating
WHERE
    pseudo = 'enzo'
INTERSECT
SELECT
    DISTINCT name
FROM
    game_rating
WHERE
    pseudo = 'julie';

-- Compter le nombre de votes par jeu
SELECT
    name "Jeu",
    COUNT(*) "Nombre de votes"
FROM
    game_rating
GROUP BY
    name;

-- Compter le nombre de votes par jeu, pour les jeux ayant au moins 2 votes
SELECT
    name "Jeu",
    COUNT(*) "Nombre de votes"
FROM
    game_rating
GROUP BY
    name
HAVING
    COUNT(*) >= 2;

-- Regrouper les notes par jeu et afficher la liste des notes pour chaque jeu
SELECT
    g.name,
    GROUP_CONCAT(CONCAT(c.label, ': ', r.value)) "Rates"
FROM
    user u
    JOIN rate r ON u.user_id = r.user_id
    JOIN game g ON g.game_id = r.game_id
    JOIN criterion c ON c.criterion_id = r.criterion_id
GROUP BY
    g.name;
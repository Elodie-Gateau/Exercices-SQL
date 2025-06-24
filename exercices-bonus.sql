-- Bonus 1
SELECT
    *
FROM
    produits
ORDER BY
    prix DESC
LIMIT
    2;

-- Bonus 2
SELECT
    *
FROM
    utilisateurs
WHERE
    email LIKE "%@email.com";

-- Bonus 3
SELECT
    COUNT(*)
FROM
    utilisateurs;

-- Bonus 4
SELECT
    *
FROM
    produits
WHERE
    prix > '30.00'
    AND date_ajout >= '2025-06-21';

-- Bonus 5
SELECT
    *
FROM
    utilisateurs
WHERE
    date_inscription = (
        SELECT
            MAX(date_inscription)
        FROM
            utilisateurs
    );

-- Bonus 6
ALTER TABLE utilisateurs ADD ville VARCHAR(100);

INSERT INTO
    utilisateurs (nom, prenom, email, date_inscription, ville)
VALUES
    (
        'Gateau',
        'Jean-Pierre',
        'jeanpierre@email.com',
        '2025-06-07',
        'Boulogne'
    );

INSERT INTO
    utilisateurs (nom, prenom, email, date_inscription, ville)
VALUES
    (
        'Gateau',
        'Tartine',
        'tartine@email.com',
        '2025-06-17',
        'Boulogne'
    );

UPDATE utilisateurs
SET
    ville = "La Roche sur Yon"
WHERE
    email = "j.dupont@email.com";

UPDATE utilisateurs
SET
    ville = "Nantes"
WHERE
    email = "mohamed.benali@email.com";

-- Bonus 7
SELECT DISTINCT
    ville
FROM
    utilisateurs;

-- Bonus 8
SELECT
    *
FROM
    produits
WHERE
    prix BETWEEN '30' AND '100';
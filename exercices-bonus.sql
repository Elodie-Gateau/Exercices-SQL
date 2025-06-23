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
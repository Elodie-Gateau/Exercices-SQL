-- Exercice 1
SELECT
    *
from
    categories;

-- Exercice 2
SELECT
    r.titre,
    r.description
FROM
    recettes r;

-- Exercice 3
SELECT
    nom
FROM
    ingredients;

-- Exercice 4
SELECT
    r.titre,
    r.description,
    c.nom
FROM
    recettes r
    INNER JOIN categories c ON r.id_categorie = c.id
WHERE
    c.nom = "Entrée";

-- Exercice 5
INSERT INTO
    recettes (titre, description, id_categorie)
VALUES
    (
        'Soupe de légumes',
        'Soupe chaude et saine aux légumes de
saison',
        1
    );

-- Exercice 6
UPDATE recettes r
SET
    r.description = CONCAT (r.description, "Recette italienne classique.")
WHERE
    r.titre = "Pâtes à l'huile d'olive";

-- Exercice 7
DELETE FROM recettes
WHERE
    recettes.titre = "Crêpes sucrées";

-- Exercice 8
SELECT
    i.nom
FROM
    ingredients i
    INNER JOIN recette_ingredient ri ON ri.id_ingredient = i.id
WHERE
    ri.id_recette = 1;

-- Exercice 9
SELECT
    r.titre,
    c.nom
FROM
    recettes r
    INNER JOIN categories c ON r.id_categorie = c.id;

-- Exercice 10
SELECT
    r.titre,
    GROUP_CONCAT (i.nom SEPARATOR ", ") AS ingredients
FROM
    recettes r
    INNER JOIN recette_ingredient ri ON ri.id_recette = r.id
    INNER JOIN ingredients i ON ri.id_ingredient = i.id
GROUP BY
    r.titre;

-- Exercice 11
SELECT
    r.titre
FROM
    recettes r
    INNER JOIN recette_ingredient ri ON ri.id_recette = r.id
    INNER JOIN ingredients i ON ri.id_ingredient = i.id
WHERE
    i.nom = "Tomate";

-- Exercice 12
SELECT
    r.titre,
    GROUP_CONCAT (i.nom SEPARATOR ", ")
FROM
    recettes r
    LEFT JOIN recette_ingredient ri ON ri.id_recette = r.id
    LEFT JOIN ingredients i ON ri.id_ingredient = i.id
WHERE
    r.id NOT IN (
        SELECT
            ri2.id_recette
        FROM
            recette_ingredient ri2
            INNER JOIN ingredients i2 ON ri2.id_ingredient = i2.id
        WHERE
            i2.nom = "Sucre"
    )
GROUP BY
    r.titre;

-- Exercice 13
SELECT
    r.titre,
    COUNT(ri.id_ingredient) AS "nbre_ingredients"
FROM
    recettes r
    INNER JOIN recette_ingredient ri ON ri.id_recette = r.id
    INNER JOIN ingredients i ON ri.id_ingredient = i.id
GROUP BY
    r.titre;

-- Exercice 14
SELECT
    c.nom AS "categorie",
    COUNT(r.id) AS "nbre_recettes"
FROM
    categories c
    INNER JOIN recettes r ON r.id_categorie = c.id
GROUP BY
    c.nom;

-- Exercice 15
-- SELECT
--     i.nom AS "ingredient",
--     COUNT(ri.id_ingredient) AS "nbre_utilisation"
-- FROM
--     ingredients i
--     LEFT JOIN recette_ingredient ri ON ri.id_ingredient = i.id
-- GROUP BY
--     i.nom
-- HAVING
--     COUNT(ri.id_ingredient) >= 1;
SELECT DISTINCT
    i.nom
FROM
    ingredients i
    INNER JOIN recette_ingredient ri ON ri.id_ingredient = i.id
-- Etape 1
CREATE DATABASE entreprise;

USE entreprise;

-- Etape 2
CREATE TABLE
    departements (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nom VARCHAR(100)
    );

CREATE TABLE
    employes (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nom VARCHAR(100),
        prenom VARCHAR(100),
        email VARCHAR(150),
        id_departement INT,
        date_embauche DATE,
        FOREIGN KEY (id_departement) REFERENCES departements (id)
    );

-- Etape 3
INSERT INTO
    departements (nom)
VALUES
    ('Informatique'),
    ('Marketing'),
    ('Ressources humaines'),
    ('Finance');

INSERT INTO
    employes (nom, prenom, email, id_departement, date_embauche)
VALUES
    (
        'Durand',
        'Sophie',
        'sophie.durand@email.com',
        1,
        '2022-05-10'
    ),
    (
        'Morel',
        ' Julien',
        'julien.morel@email.com',
        1,
        '2023-03-15'
    ),
    (
        'Roche',
        'Claire',
        'claire.roche@email.com',
        2,
        '2021-08-20'
    ),
    (
        'Petit',
        'Karim',
        'karim.petit@email.com',
        3,
        '2020-11-01'
    ),
    (
        'Lopez',
        'Anna',
        'anna.lopez@email.com',
        4,
        '2024-01-10'
    ),
    (
        'Nguyen',
        'Thomas',
        'thomas.nguyen@email.com',
        2,
        '2022-12-05'
    );

-- Exercice 1
SELECT
    employes.nom,
    employes.prenom,
    departements.nom
FROM
    employes
    INNER JOIN departements ON employes.id_departement = departements.id;

-- Exercice 2
SELECT
    employes.nom,
    employes.prenom,
    departements.nom
FROM
    employes
    INNER JOIN departements ON employes.id_departement = departements.id
ORDER BY
    departements.nom;

-- Exercice 3
SELECT
    employes.nom,
    employes.prenom,
    departements.nom
FROM
    employes
    INNER JOIN departements ON employes.id_departement = departements.id
WHERE
    departements.nom = "Informatique";

-- Exercice 4
SELECT
    employes.nom,
    employes.prenom,
    employes.email,
    departements.nom
FROM
    employes
    INNER JOIN departements ON employes.id_departement = departements.id
WHERE
    employes.date_embauche >= '2022-01-01';

-- Exercice 5
SELECT
    departements.nom AS "departement",
    COUNT(*)
FROM
    employes
    INNER JOIN departements ON employes.id_departement = departements.id
GROUP BY
    departements.nom;

-- Exercice 6
SELECT
    departements.nom AS "departement",
    COUNT(*)
FROM
    employes
    INNER JOIN departements ON employes.id_departement = departements.id
GROUP BY
    departements.nom
HAVING
    COUNT(*) >= 2
    -- Exercice 7
UPDATE employes
SET
    id_departement = NULL
WHERE
    nom = 'Lopez';

SELECT
    employes.nom,
    employes.prenom,
    employes.email,
    departements.nom AS 'departement'
FROM
    employes
    LEFT JOIN departements ON employes.id_departement = departements.id;
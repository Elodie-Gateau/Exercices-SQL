-- Exercice 1
CREATE DATABASE formation_web;

USE formation_web;

-- Exercice 2
CREATE TABLE
    `formation_web`.`utilisateurs` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `nom` VARCHAR(100) NOT NULL,
        `prenom` VARCHAR(100) NOT NULL,
        `email` VARCHAR(150) NOT NULL,
        `date_inscription` DATE NOT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB;

-- Exercice 3
INSERT INTO
    `utilisateurs` (`nom`, `prenom`, `email`, `date_inscription`)
VALUES
    (
        'Dupont',
        'Jean',
        'jean.dupont@email.com',
        '2025-06-01'
    )
INSERT INTO
    `utilisateurs` (`nom`, `prenom`, `email`, `date_inscription`)
VALUES
    (
        'Martin',
        'Alice',
        'alice.martin@email.com',
        '2025-06-10'
    )
INSERT INTO
    `utilisateurs` (`nom`, `prenom`, `email`, `date_inscription`)
VALUES
    (
        'Benali',
        'Mohamed',
        'mohamed.benali@email.com',
        '2025-06-15'
    )
    -- Exercice 4
SELECT
    *
FROM
    utilisateurs;

SELECT
    prenom,
    email
FROM
    utilisateurs;

SELECT
    *
FROM
    utilisateurs
WHERE
    date_inscription > '2025-06-05';

SELECT
    *
FROM
    utilisateurs
WHERE
    prenom = 'Alice';

-- Exercice 5
UPDATE utilisateurs
SET
    email = 'j.dupont@email.com'
WHERE
    email = 'jean.dupont@email.com';

-- Exercice 6
DELETE FROM utilisateurs
WHERE
    email = 'alice.martin@email.com';

-- Exercice 7
CREATE TABLE
    `formation_web`.`produits` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `nom` VARCHAR(100) NOT NULL,
        `description` TEXT NOT NULL,
        `prix` DECIMAL(9, 2) NOT NULL,
        `date_ajout` DATE NOT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB;

-- Exercice 8
INSERT INTO
    `produits` (`nom`, `description`, `prix`, `date_ajout`)
VALUES
    (
        'Clavier mécanique',
        'Clavier avec rétroéclairage LED',
        '59.99',
        '2025-06-20'
    );

INSERT INTO
    `produits` (`nom`, `description`, `prix`, `date_ajout`)
VALUES
    (
        'Souris optique',
        'Souris sans fil',
        '29.50',
        '2025-06-21'
    );

INSERT INTO
    `produits` (`nom`, `description`, `prix`, `date_ajout`)
VALUES
    (
        'Écran 24 pouces',
        'Écran Full HD',
        '149.00',
        '2025-06-22'
    );

-- Exercice 9
SELECT
    *
FROM
    produits;

SELECT
    nom,
    prix
FROM
    produits;

SELECT
    *
FROM
    produits
WHERE
    prix > 50.00;

SELECT
    *
FROM
    produits
ORDER BY
    prix DESC;
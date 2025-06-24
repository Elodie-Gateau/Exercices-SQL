-- Exercice 8
SELECT
    employes.nom AS "Nom de l'employé",
    employes.prenom AS "Prénom de l'employé",
    departements.nom AS "Nom du département",
    employes.date_embauche AS "Date d'embauche"
FROM
    employes
    INNER JOIN departements ON id_departement = departements.id;

-- Exercice 9
SELECT
    employes.nom AS "Nom de l'employé",
    employes.prenom AS "Prénom de l'employé",
    departements.nom AS "Nom du département",
    employes.date_embauche AS "Date d'embauche"
FROM
    employes
    INNER JOIN departements ON id_departement = departements.id
ORDER BY
    employes.date_embauche;

-- Exercice 10
SELECT
    departements.nom,
    COUNT(employes.id)
FROM
    departements
    LEFT JOIN employes on departements.id = id_departement
GROUP BY
    departements.nom
HAVING
    COUNT(employes.id) = 0;

-- Exercice 11
SELECT
    employes.nom,
    employes.prenom,
    employes.email,
    employes.date_embauche,
    depsolo.nom
FROM
    (
        SELECT
            departements.nom,
            departements.id,
            COUNT(employes.id)
        FROM
            departements
            INNER JOIN employes ON departements.id = employes.id_departement
        GROUP BY
            departements.nom
        HAVING
            COUNT(employes.id) = 1
    ) AS depsolo
    INNER JOIN employes ON employes.id_departement = depsolo.id;

-- Exercice 12
SELECT
    departements.nom,
    COUNT(employes.id)
FROM
    departements
    INNER JOIN employes ON employes.id_departement = departements.id
GROUP BY
    departements.nom
ORDER BY
    COUNT(employes.id) DESC
LIMIT
    2;

-- Exercice 13
SELECT
    employes.nom,
    employes.prenom,
    (
        SELECT
            nbreemployes.nbredep
        FROM
            (
                SELECT
                    employes.id_departement,
                    COUNT(employes.id) AS nbredep
                FROM
                    employes
                GROUP BY
                    employes.id_departement
            ) AS nbreemployes
        WHERE
            nbreemployes.id_departement = employes.id_departement
    ) AS "Nombre d'employés dans le département"
FROM
    employes;

-- Exercice 14
SELECT
    YEAR (employes.date_embauche) AS "Année d'embauche",
    COUNT(employes.id)
FROM
    employes
GROUP BY
    YEAR (employes.date_embauche);

-- Exercice 15
SELECT
    e.nom,
    e.prenom,
    e.email,
    e.date_embauche
FROM
    employes e
WHERE
    e.date_embauche > (
        SELECT
            MIN(e1.date_embauche) AS min_embauche
        FROM
            employes e1
        WHERE
            e.id_departement = e1.id_departement
    )
    AND (
        SELECT
            COUNT(*)
        FROM
            employes e2
        WHERE
            e2.id_departement = e.id_departement
    ) > 1;
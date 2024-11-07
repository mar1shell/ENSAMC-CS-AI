-- TP1 DATABASE ORACLE
-- Auteur: mar1shell
-- Date: 05/11/2021

-- PS: The DB structure is created whithin the f1.sql file
-- SYSDATE: 05-NOV-2024

------------------- Activité 5 ------------------------

-- 1.Determinez si ces affirmations sont vraies ou faux

-- les fonctions de groupes agissent sur plusieurs lignes d'une table pour produire un seul résultat
-- VRAI

-- les fonctions de groupes intègrent les valeurs NULL dans leurs calculs
-- FAUX

-- La clause WHERE restreint les lignes avant que les fonctions de groupes ne soient appliquées
-- VRAI

-- 2.Affichez le salaire maximum, le salaire minimum, la somme des salaires et la moyenne des salaires des employés
-- Nommez respectivement les colonnes MAXIMUM, MINIMUM, SUM et AVERAGE
-- Arrondissez les valeurs à 0 décimales

SELECT
    ROUND(MAX(SAL)) MAXIMUM,
    ROUND(MIN(SAL)) MINMUM,
    ROUND(SUM(SAL)) SUM,
    ROUND(AVG(SAL)) AVERAGE
FROM
    EMP;

-- 3.Affichez le salaire maximum, minimum, la somme des salaires et la moyenne des salaires des employés pour chaque poste

SELECT
    JOB,
    ROUND(MAX(SAL)) MAXIMUM,
    ROUND(MIN(SAL)) MINMUM,
    ROUND(SUM(SAL)) SUM,
    ROUND(AVG(SAL)) AVERAGE
FROM
    EMP
GROUP BY
    JOB;

-- 4.Affichez la difference existante entre le salaire maximum et le salaire minimum, nommez la colone difference

SELECT
    MAX(SAL) - MIN(SAL) AS DIFFERENCE
FROM
    EMP;

-- 5.Affichez le matricule des différents managers et le niveau de salaire le plus bas de leurs employés
-- Excluez toute ligne ou le manager n'est pas identifé
-- Excluez tout groupe dans lequel le salaire minimum est inferieur a $1000
-- Triez les résultats par order décroissant des salaires

SELECT
    MGR.EMPNO,
    MIN(EMPLOYE.SAL)
FROM
    EMP MGR,
    EMP EMPLOYE
WHERE
    MGR.EMPNO = EMPLOYE.MGR
GROUP BY
    MGR.EMPNO
HAVING
    MIN(EMPLOYE.SAL) >= 1000
ORDER BY
    MIN(EMPLOYE.SAL) DESC;

-- 6.Ecrivez une requete pour affichez le département, le nombre d'employés et le salaire moyenne
-- pour tous les employes de ce departement
-- Nommez les colones CODE DEPARTEMENT, NOMBRE D'EMPLOYES et SALAIRE MOYEN respectivement

SELECT
    DEPT.DEPTNO  "CODE Département",
    COUNT(ENAME) "Nombre d'Employés",
    AVG(SAL)     "Salaire moyenne"
FROM
    DEPT,
    EMP
WHERE
    DEPT.DEPTNO = EMP.DEPTNO
GROUP BY
    DEPT.DEPTNO;

------------------- Activité 6 ------------------------

-- 1.Affichez le departement qui ne comprend aucun employé?

SELECT
    DEPTNO,
    DNAME
FROM
    DEPT
WHERE
    DEPTNO NOT IN (
        SELECT
            DISTINCT DEPTNO
        FROM
            EMP
    );

-- 2.Affichez le nom et la date d'embauche de tous les employés travaillent dans le même département que le Blake a l'exception de Blake

SELECT
    ENAME,
    HIREDATE
FROM
    EMP
WHERE
    DEPTNO = (
        SELECT
            DEPTNO
        FROM
            EMP
        WHERE
            LOWER(ENAME) = 'blake'
    )
    AND LOWER(ENAME) <> 'blake';

-- 3.Affichez le matricule, le nom et le salaire de tous les employés qui gange plus que le salaire moyen
-- Triez les résultats par ordre décroissant des salaires

SELECT
    EMPNO,
    ENAME,
    SAL
FROM
    EMP
WHERE
    SAL > (
        SELECT
            AVG(SAL)
        FROM
            EMP
    )
ORDER BY
    SAL DESC;

-- 4.Affichez matricule et nom de tous les employes qui travaillent dans le meme departement que tout employe dont le nom contient T

SELECT
    EMPNO,
    ENAME
FROM
    EMP
WHERE
    DEPTNO IN (
        SELECT
            DEPTNO
        FROM
            EMP
        WHERE
            ENAME LIKE '%T%'
    );

-- 5.Affichez le matricule, le nom et le salaire de tous les employés qui gagnent plus que le salaire moyen
-- et qui travaiellent dans un departement avec tous employe dans le nom contient un T

SELECT
    EMPNO,
    ENAME,
    SAL
FROM
    EMP
WHERE
    SAL > (
        SELECT
            AVG(SAL)
        FROM
            EMP
    )
    AND DEPTNO IN (
        SELECT
            DEPTNO
        FROM
            EMP
        WHERE
            ENAME LIKE '%T%'
    );

-- 6.Affichez le nom, le numéro de departement et le poste de tous les employes dont le departement est situe a DALLAS

SELECT
    ENAME,
    DEPTNO,
    JOB
FROM
    EMP
WHERE
    DEPTNO = (
        SELECT
            DEPTNO
        FROM
            DEPT
        WHERE
            UPPER(LOC) = 'DALLAS'
    );

-- 7.Affichez le nom et le salaire de tous les employes dont le manager est KING

SELECT
    ENAME,
    SAL
FROM
    EMP
WHERE
    MGR = (
        SELECT
            EMPNO
        FROM
            EMP
        WHERE
            UPPER(ENAME) = 'KING'
    );

-- 8.Affichez le numéro de département, le nom et le poste de tous les employes travillent dans le departement des ventes salaires SALES

SELECT
    DEPTNO,
    ENAME,
    JOB
FROM
    EMP
WHERE
    DEPTNO = (
        SELECT
            DEPTNO
        FROM
            DEPT
        WHERE
            UPPER(DNAME) = 'SALES'
    );

-- 9.Affichez les employés qui percoivent un slaire supérieur a tout employé dont le post est clerk
-- Triez le résultat par order décroissant des salaires

SELECT
    ENAME
FROM
    EMP
WHERE
    SAL > ALL (
        SELECT
            SAL
        FROM
            EMP
        WHERE
            UPPER(JOB) = 'CLERK'
    )
ORDER BY
    SAL DESC;

------------------- Activité 7 ------------------------

-- 1.Insérer des donnés dans la table debt et emp

INSERT INTO DEPT (
    DEPTNO,
    DNAME,
    LOC
) VALUES (
    50,
    'FINANCE',
    CASA
);

INSERT INTO DEPT (
    DEPTNO,
    DNAME
) VALUES (
    60,
    'PERSONNEL'
);

INSERT INTO DEPT (
    DEPTNO,
    DNAME
) VALUES (
    70,
    'INFO'
);

INSERT INTO EMP (
    EMPNO,
    ENAME,
    JOB,
    MGR,
    HIREDATE,
    SAL,
    COMM,
    DEPTNO
) VALUES (
    8100,
    AKRAM,
    MANAGER,
    7839,
    '21-AVR-2015',
    2700,
    100,
    50
);

INSERT INTO EMP (
    EMPNO,
    ENAME,
    JOB,
    MGR,
    HIREDATE,
    SAL,
    DEPTNO
) VALUES (
    8200,
    LAILA,
    CLARK,
    7566,
    '12-MAR-2015',
    1950,
    60
);

INSERT INTO EMP (
    EMPNO,
    ENAME,
    JOB,
    MGR,
    HIREDATE,
    SAL,
    DEPTNO
) VALUES (
    8300,
    SARA,
    SALESMAN,
    7698,
    '18-MAR-2015',
    1800,
    30
);

-- 2.Verifiez le contenu de chaque table

SELECT
    *
FROM
    EMP;

SELECT
    *
FROM
    DEPT;

-- 3.Changez le nom du departement personnel en RH

UPDATE DEPT
SET
    DNAME = 'RH'
WHERE
    UPPER(DNAME) = 'PERSONNEL';

-- 4.Remplacez le nom de l'employé 8100 par KARIM

UPDATE EMP
SET
    ENAME = 'KARIM'
WHERE
    EMPNO = 8100;

-- 5.Saisissez un salaire de 1400 pour tous les employés ayant un salaire inférieur a 1200

UPDATE EMP
SET
    SAL = 1400
WHERE
    SAL < 1200;

-- 6.Verifiez

SELECT
    *
FROM
    EMP;

-- 7.Supprimez l'employe 8300

DELETE FROM EMP
WHERE
    EMPNO = 8300;

-- 8.Verifiez

SELECT
    *
FROM
    EMP;

-- 9.Videz entirement la table EMP

DELETE FROM EMP;

-- 10.Verifiez

SELECT
    *
FROM
    EMP;

-- 11.Annuler toutes les operations

ROLLBACK;

------------------- Activité 8 ------------------------

-- 1.Initialisez une session sqlplus avec le nom d'utilisateur et le mot de passe de votre choix

-- 2.Affichez le nom de l'utilisateur connecté

SHOW USER;

-- 3.Affichez la date courante

SELECT
    SYSDATE
FROM
    DUAL;

-- 4.Affichez la liste de toutes les tables de votre base de données

SELECT
    TABLE_NAME
FROM
    USER_TABLES;

-- 5.Créez la table SERVICE d'après le modèle suivant et vérifiez sa création:
-- ID INT(2); NOM VARCHAR(25)

CREATE TABLE SERVICE (
    ID INT(2) PRIMARY KEY,
    NOM VARCHAR(25)
);

SELECT
    *
FROM
    SERVICE;

-- 6.Créez la table EMPLOYE d'après le modele suivant et vérifiez sa création:
-- ID NUMBER(7); NOM VARCHAR2(25); SALAIRE NUMBER(4); ID_SERVICE NUMBER(2)

CREATE TABLE EMPLOYE (
    ID NUMBER(7) PRIMARY KEY,
    NOM VARCHAR2(25),
    SALAIRE NUMBER(4),
    ID_SERVICE NUMBER(2),
    FOREIGN KEY (ID_SERVICE) REFERENCES SERVICE(ID)
);

-- 7.Modifiez la table EMPLOYE pour pouvoir allonger la taille des noms des employés
-- Vérifiez votre modification: NOM VARCHAR2(30)

ALTER TABLE EMPLOYE MODIFY (
    NOM VARCHAR2(30)
);

DESCRIBE EMPLOYE;

-- 8.Verifiez que les tables sont bien enregistrés dans la base de données

SELECT
    TABLE_NAME
FROM
    USER_TABLES;

-- 9.Modifiez la table EMPLOYE, ajoutez une colone  FONCTION VARCHAR2(25);

ALTER TABLE EMPLOYE
    ADD (
        FONVTION VARCHAR2(25)
    );

-- 10.Supprimez la colonne salaire de EMPLOYE et Verifiez

ALTER TABLE EMPLOYE DROP COLUMN SALAIRE;

DESCRIBE EMPLOYE;

-- 11.Créez la table EMPLOYE2 sur la base de la structure et des donees de la table EMP
-- mais n'incluez que les columns EMPNO, ENAME, DEPTNO
-- Nommez ces columns respectivement ID_EMP, NOM et ID_SERVICE.

CREATE TABLE EMPLOYE2 AS (
    SELECT
        EMPNO  AS ID_EMP,
        ENAME  AS NOM,
        DEPTNO AS ID_SERVICE
    FROM
        EMP
);

-- 12.Supprimez la table EMPLOYE

DROP TABLE EMPLOYE;

-- 13.Renommez la table EMPLOYE2 en EMPLOYE

RENAME EMPLOYE2 TO EMPLOYE;

-- 14.Ajoutez une contrainte PRIMARY KEY de niveau table dans la table EMPLOYE en utilisant la colonne ID_EMP

ALTER TABLE EMPLOYE
    ADD (
        CONSTRAINT EMPLOYE_ID_EMP_PK PRIMARY KEY(ID_EMP)
    );

-- 15.Ajoutez une contrainte PRIMARY KEY de niveau table dans la table EMPLOYE en utilisant la colonne ID

ALTER TABLE SERVICE
    ADD (
        CONSTRAINT SERVICE_ID_PK PRIMARY KEY(ID)
    );

-- 16.Ajoutez une clé etranger dans la table EMPLOYE qui permettra de controler que l'employé n'est pas associé a un service inexistant

ALTER TABLE EMPLOYE
    ADD (
        CONSTRAINT EMPLOYE_ID_SERVICE_FK FOREIGN KEY(ID_SERVICE) REFERENCES SERVICE(ID)
    );

-- 17.Ajoutez une contrainte NOT NULL a la colonne NOM de la table EMPLOYE

ALTER TABLE EMPLOYE
    ADD (
        CONSTRAINT EMPLOYE_NOM_NN NOT NULL(NOM)
    );
-- TP1 DATABASE ORACLE
-- Auteur: mar1shell
-- Date: 15/10/2021

-- PS: The DB structure is created whithin the f1.sql file
-- SYSDATE: 15-OCT-2024

------------------- Activité 1 ------------------------

-- structure table dept

SELECT
    *
FROM
    DEPT;

-- structure table emp

SELECT
    *
FROM
    EMP;

-- Nom de chaque employe concaténé par "a un salaire de" et le salaire de l'employé

SELECT
    ENAME
    || ' a un salaire de '
    || SAL
FROM
    EMP;

-- Afficher tous led donnees de table dept dans une seule colone
-- separer chaque colone par une virgule
-- Nommez la colone "THE_OUTPOUT"

SELECT
    DEPTNO
    || ','
    || DNAME
    || ','
    || LOC AS THE_OUTPUT
FROM
    DEPT;

------------------- Activité 2 ------------------------

-- Afficher nom, poste et date d'entrée des employés embauchés entre 20 fevrier 2010
-- et le 1 mai 2012; classez le résultat par date d'embauche croissante

SELECT
    ENAME,
    JOB,
    HIREDATE
FROM
    EMP
WHERE
    HIREDATE BETWEEN '20-FEB-2010' AND '01-MAY-2012'
ORDER BY
    HIREDATE;

-- Afficher nom et date d'embauche de chaque employé entré en 2010

SELECT
    ENAME,
    HIREDATE
FROM
    EMP
WHERE
    HIREDATE BETWEEN '01-JAN-2010' AND '31-DEC-2010';

-- Affichez le nom, le salaire et la commission de tous les employés
-- qui precoivent des commissions; Triez dans l'ordre décroissant des salaires et des commission

SELECT
    ENAME,
    SAL,
    COMM
FROM
    EMP
WHERE
    COMM IS NOT NULL
ORDER BY
    SAL DESC,
    COMM DESC;

-- Affichez nom de tous les employés qui ont le nom contient deux T et travaillent
-- dans le département 20 ou dont le manager est 7566

SELECT
    ENAME
FROM
    EMP
WHERE
    (ENAME LIKE '%T%T%'
    AND DEPTNO = 20)
    OR MGR = 7566;

-- Nom des vendeurs par order decroissant du ratio commission/salaire

SELECT
    ENAME
FROM
    EMP
WHERE
    JOB = 'SALESMAN'
ORDER BY
    COMM/SAL DESC;

-- Nom des vendeurs dont la commission < 25% du salaire

SELECT
    ENAME
FROM
    EMP
WHERE
    JOB = 'SALESMAN'
    AND COMM < SAL * 0.25;

-- Creez une liste unique de tous les postes du département 30

SELECT
    DISTINCT JOB
FROM
    EMP
WHERE
    DEPTNO = 30;

-- Affichez le nom, le poste et le salaire de tous les 'CLERK' et 'ACCOUNT'
-- dont le salaire est différent de 1000, 3000 ou 5000

SELECT
    ENAME,
    JOB,
    SAL
FROM
    EMP
WHERE
    JOB IN ('CLERK', 'ACCOUNT')
    AND SAL NOT IN (1000, 3000, 5000);

-- Affichez le nom, salaire et commission de tous les empolyés qui ont une commission
-- de plus de 10% de leur salaire

SELECT
    ENAME,
    SAL,
    COMM
FROM
    EMP
WHERE
    COMM >= 0.1 * SAL;

------------------- Activité 3 ------------------------

-- Affichez le matricule, le nom, le salaire et le salaire augmenté de 15%
-- sous la forme d'un nombre entier et nommez cette colone New Salary

SELECT
    EMPNO,
    ENAME,
    SAL,
    ROUND(SAL * 1.15) AS "New Salary"
FROM
    EMP;

-- Modifiez la dernière requête en ajoutant une colone dans laquelle l'ancien salaires
-- est soustrait du nouveau salaire et nommez cette colone Increase

SELECT
    EMPNO,
    ENAME,
    SAL,
    ROUND(SAL * 1.15)       AS "New Salary",
    ROUND(SAL * 1.15) - SAL AS INCREASE
FROM
    EMP;

-- Affichez le nom de chaque employé et calculez le nombre de mois travaillés depuis
-- la date d'embauche jusqu'à aujourd'hui; nommez la colonne MONTHS_WORKED
-- Classez les résultats en fonction du nombre de mois d'ancienneté
-- Arrondissez le nombre de mois à l'entier le plus proche

SELECT
    ENAME,
    ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS_WORKED
FROM
    EMP
ORDER BY
    MONTHS_WORKED;

-- Affichez les informations suivantes pour chaque employé: <nom> <veut> <3 fois sont salaires>
-- Nommez la colonne "Salaire de Rêve"

SELECT
    ENAME
    || ' veut '
    || SAL * 3
    || ' fois son salaire' AS "Salaire de Rêve"
FROM
    EMP;

-- Affichez le nom et le salaire de tous les empolyés
-- Le salaire sera formaté de manière a avoir une longuer de 15 caractères
-- la valeur du salaire étant complétée par des espaces à gauche
-- Nommez la colonne SALARY

SELECT
    ENAME,
    LPAD(SAL, 15) AS SALARY
FROM
    EMP;

-- Afficher le nom et le salaire plus la commission de tous les employés
-- en gérant les valeurs NULL; Nommez la colonne SAL + COMM

SELECT
    ENAME,
    SAL + NVL(COMM, 0) AS "SAL + COMM"
FROM
    EMP;

-- Afficher les noms, les salaires et les dates d'embauche de tous les employés
-- embauchés entre 2010 et 2011

SELECT
    ENAME,
    SAL,
    HIREDATE
FROM
    EMP
WHERE
    HIREDATE BETWEEN '01-JAN-2010' AND '31-DEC-2011';

------------------- Activité 4 ------------------------

-- Afficher le nom, numéro de département et nom de département de chaque employé

SELECT
    ENAME,
    EMP.DEPTNO,
    DNAME
FROM
    EMP,
    DEPT
WHERE
    EMP.DEPTNO = DEPT.DEPTNO;

-- Créez une liste unique de tous les postes du département 30

SELECT
    DISTINCT JOB
FROM
    EMP
WHERE
    DEPTNO = 30;

-- Afficher le nom, le nom du département et la localisation de chaque employé qui touchent une commission

SELECT
    ENAME,
    DNAME,
    LOC
FROM
    EMP,
    DEPT
WHERE
    EMP.DEPTNO = DEPT.DEPTNO
    AND COMM IS NOT NULL;

-- Afficher le nom et le nom de département de chaque employé dont le nom contient la lettre A

SELECT
    ENAME,
    DNAME
FROM
    EMP,
    DEPT
WHERE
    EMP.DEPTNO = DEPT.DEPTNO
    AND ENAME LIKE '%A%';

-- Affichee le nom, le poste, le numéro département et le nom de département
-- de tous les employés basés à Dallas

SELECT
    ENAME,
    JOB,
    EMP.DEPTNO,
    DNAME
FROM
    EMP,
    DEPT
WHERE
    EMP.DEPTNO = DEPT.DEPTNO
    AND LOC = 'DALLAS';

-- Afficher le nom et le matricule des employes et de leur manager
-- Nommez les colones "NOM_EMPLOYE", "CODE_EMPLOYE", "NOM_MANAGER", "CODE_MANAGER"

SELECT
    EM.ENAME AS NOM_EMPLOYE,
    EM.EMPNO AS CODE_EMPLOYE,
    MGR.ENAME AS NOM_MANAGER,
    MGR.EMPNO AS CODE_MANAGER
FROM
    EMP EM,
    EMP MGR
WHERE
    EM.MGR = MGR.EMPNO;

-- Affichez les noms et date d'embauche des employés et de leur manager
-- pour tous les employés ayant été embauchés avant leur manager
-- Nommez les colones "Employee", "Emp_Hiredate", "Manager", "Mgr_Hiredate"

SELECT
    EM.ENAME    AS EMPLOYEE,
    EM.HIREDATE AS EMP_HIREDATE,
    MGR.ENAME    AS MANAGER,
    MGR.HIREDATE AS MGR_HIREDATE
FROM
    EMP EM,
    EMP MGR
WHERE
    EM.MGR = MGR.EMPNO
    AND EM.HIREDATE < MGR.HIREDATE;
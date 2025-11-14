# 1 - Se connecter en tant que SYS, par la suite, affichez la structure de la vue DBA_users.

sqlplus / as sysdba

desc DBA_users;

 Name					   Null?    Type
 ------------------------  -------- -------
 USERNAME				   NOT NULL VARCHAR2(128)
 USER_ID				   NOT NULL NUMBER
 PASSWORD					    VARCHAR2(4000)
 ACCOUNT_STATUS 			   NOT NULL VARCHAR2(32)
 LOCK_DATE					    DATE
 EXPIRY_DATE					    DATE
 DEFAULT_TABLESPACE			   NOT NULL VARCHAR2(30)
 TEMPORARY_TABLESPACE			   NOT NULL VARCHAR2(30)
 LOCAL_TEMP_TABLESPACE				    VARCHAR2(30)
 CREATED				   NOT NULL DATE
 PROFILE				   NOT NULL VARCHAR2(128)
 INITIAL_RSRC_CONSUMER_GROUP			    VARCHAR2(128)
 EXTERNAL_NAME					    VARCHAR2(4000)
 PASSWORD_VERSIONS				    VARCHAR2(17)
 EDITIONS_ENABLED				    VARCHAR2(1)
 AUTHENTICATION_TYPE				    VARCHAR2(8)
 PROXY_ONLY_CONNECT				    VARCHAR2(1)
 COMMON 					    VARCHAR2(3)
 LAST_LOGIN					    TIMESTAMP(9) WITH TIME ZONE
 ORACLE_MAINTAINED				    VARCHAR2(1)
 INHERITED					    VARCHAR2(3)
 DEFAULT_COLLATION				    VARCHAR2(100)
 IMPLICIT					    VARCHAR2(3)
 ALL_SHARD					    VARCHAR2(3)
 PASSWORD_CHANGE_DATE				    DATE

# 2 - A partir la vue DBA_users, afficher les noms et les statuts des utilisateurs de votre base de données ?

SELECT username, account_status FROM dba_users;

 USERNAME	ACCOUNT_STATUS
 --------------- --------------------
 SYS		OPEN
 SYSTEM		OPEN
 XS$NULL 	EXPIRED & LOCKED
 OJVMSYS 	LOCKED
 LBACSYS 	LOCKED
 OUTLN		LOCKED
 SYS$UMF 	LOCKED
 DBSNMP		LOCKED
 APPQOSSYS	LOCKED
 DBSFWUSER	LOCKED
 GGSYS		LOCKED
 
 USERNAME	ACCOUNT_STATUS
 --------------- --------------------
 ANONYMOUS	EXPIRED & LOCKED
 CTXSYS		EXPIRED & LOCKED
 DVSYS		LOCKED
 DVF		LOCKED
 GSMADMIN_INTERN LOCKED
 AL
 
 MDSYS		LOCKED
 OLAPSYS 	LOCKED
 XDB		LOCKED
 WMSYS		LOCKED
 
 USERNAME	ACCOUNT_STATUS
 --------------- --------------------
 GSMCATUSER	LOCKED
 MDDATA		LOCKED
 SYSBACKUP	LOCKED
 REMOTE_SCHEDULE LOCKED
 R_AGENT
 
 GSMUSER 	LOCKED
 SYSRAC		LOCKED
 GSMROOTUSER	LOCKED
 OPS$ORACLE	OPEN
 SI_INFORMTN_SCH LOCKED
 
 USERNAME	ACCOUNT_STATUS
 --------------- --------------------
 EMA
 
 AUDSYS		LOCKED
 DIP		LOCKED
 ORDPLUGINS	LOCKED
 SYSKM		LOCKED
 ORDDATA 	LOCKED
 ORACLE_OCM	LOCKED
 SYSDG		LOCKED
 ORDSYS		LOCKED
 
 37 rows selected.

# 3 - Créez les deux utilisateurs suivants :
#    | Nom de l’utilisateur | Mt de passe | Quota |
#    | :--- | :--- | :--- |
#    | rami | ok | 5m on users |
#    | u5 | ok | 10m on users |

CREATE USER C##RAMI IDENTIFIED BY ok QUOTA 5M ON users;

 User created.

CREATE USER C##U5 IDENTIFIED BY ok QUOTA 10M ON users;

 User created.

# 4 - Affichez les informations de création de Rami, par exemple : USERNAME, CREATED, DEFAULT_TABLESPACE.

SELECT username, created, default_tablespace FROM dba_users WHERE username='C##RAMI';

 USERNAME	CREATED   DEFAULT_TABLESPACE
 ---------  --------  ------------------------------
 C##RAMI 	13-OCT-25 USERS

# 5 - Essayez à se connecter en tant que Rami, que constatez-vous ?

conn C##RAMI/ok;

 ERROR:
 ORA-01045: user C##RAMI lacks CREATE SESSION privilege; logon denied

 Warning: You are no longer connected to ORACLE.

# 6 - En tant que SYS, accordez les privilèges nécessaires pour la connexion de Rami.

GRANT CREATE SESSION TO C##RAMI;

 Grant succeeded.

# 7 - Essayez à se connecter en tant que Rami, que constatez-vous ?

conn C##RAMI/ok;

 Connected.

# 8 - En tant que Rami, essayer de donner le privilège create session à u5, que constatez-vous ?

GRANT CREATE SESSION TO C##U5;

 *
 ERROR at line 1:
 ORA-01031: insufficient privileges
 
# 9 - En tant que SYS, réaccordez les privilèges create session à Rami avec l'option with admin option.

conn / as sysdba;

 Connected.

GRANT CREATE SESSION TO C##RAMI WITH ADMIN OPTION;

 Grant succeeded.

# 10 - En tant que Rami, essayez de donner le privilège create session à u5, que constatez-vous ?

conn C##RAMI/ok;

 Connected.

GRANT CREATE SESSION TO C##U5;

 Grant succeeded.

# 11 - Essayez à se connecter en tant que u5, que constatez-vous ?

conn C##U5/ok;

 Connected.

# 12 - En tant que u5, changez le mot de passe à test puis connectez-vous en tant que u5 avec le nouveau mot de passe? que constatez-vous ?

ALTER USER C##U5 IDENTIFIED BY test;

 User altered.

conn C##U5/test;
    
 Connected.

# 13 - En tant que SYS, donnez à Rami le privilège create table pour la création des tables.

conn / as sysdba;

 Connected.

GRANT CREATE TABLE TO C##RAMI;

 Grant succeeded.

# 14 - On se connecte en tant que Rami pour la création de la table employe (code number(2)).

conn C##RAMI/ok;

 Connected.

CREATE TABLE employe (code NUMBER(2));

 Table created.

# 15 - Insérez qlq lignes dans votre table EMPLOYE.
#     Insert into employe values(10);
#     Insert into employe values(20);

INSERT INTO employe VALUES (10);
INSERT INTO employe VALUES (20);

 2 rows created.

# 16 - En tant que SYS, Sélectionnez la liste des privilèges accordés à RAMI en exécutant la requête ci-dessous et notez le résultat:
#     select PRIVILEGE from dba_sys_privs where GRANTEE='RAMI';

conn / as sysdba;

 Connected.

SELECT PRIVILEGE FROM dba_sys_privs WHERE GRANTEE='C##RAMI';

 PRIVILEGE
 ------------------------------
 CREATE SESSION
 CREATE TABLE

 2 rows selected.

# 17 - Sélectionnez l'espace consommé par cette table avec la requête ci-dessous et notez le résultat:
#     Select bytes from user_segments where segment_name='EMPLOYE';

SELECT bytes FROM user_segments WHERE segment_name='EMPLOYE';

     BYTES
 ----------
     65536


# 18 - Sélectionnez le nombre d'extent de la table employe avec la requête ci-dessous et notez le résultat:
#     SELECT segment_name, segment_type, extents
#     FROM DBA_SEGMENTS WHERE segment_name ='EMPLOYE'

conn / as sysdba;

 Connected.

SELECT segment_name, segment_type, extents FROM DBA_SEGMENTS WHERE segment_name='EMPLOYE';

 SEGMENT_NAME  SEGMENT_TYPE	EXTENTS
 ------------- ------------- -------
 EMPLOYE	   TABLE		1

# 19 - Afficher la taille de tablespace users ?

SELECT tablespace_name, bytes/1024/1024 AS size_mb FROM dba_data_files WHERE tablespace_name='USERS';

 TABLESPACE_NAME	 SIZE_MB
 ------------------- ----------
 USERS			     5

# 20 - Afficher l'espace réservé alloué de tablespace user à rami.

SELECT tablespace_name, SUM(bytes)/1024/1024 AS allocated_mb FROM dba_segments WHERE owner='C##RAMI' GROUP BY tablespace_name;

 TABLESPACE_NAME	 ALLOCATED_MB
 ------------------- -------------
 USERS			     .0625

# 21 - Déduire l'espace restant à rami après ses activités ci-dessus.

SELECT (50 - SUM(bytes)/1024/1024) AS free_space_mb FROM dba_segments WHERE owner='C##RAMI' GROUP BY tablespace_name;

 FREE_SPACE_MB
 --------------
 49.9375

# 22 - En tant que SYS, créez un autre utilisateur Siri avec le mot de passe test et les privilèges nécessaires de connexion?

CREATE USER C##SIRI IDENTIFIED BY test QUOTA 15M ON users;

 User created.

GRANT CREATE SESSION TO C##SIRI;

 Grant succeeded.

# 23 - Se connecter en tant que Siri, essayez de consulter la table employe de Rami ? que constatez-vous ? et comment corriger la situation ?

conn C##SIRI/test;

 Connected.

SELECT * FROM C##RAMI.EMPLOYE;

 *
 ERROR at line 1:
 ORA-00942: table or view does not exist

# Correction de la situation en tant que Rami

conn C##RAMI/ok;

 Connected.

GRANT SELECT ON EMPLOYE TO C##SIRI;

 Grant succeeded.

conn C##SIRI/test;

 Connected.

SELECT * FROM C##RAMI.EMPLOYE;

   CODE
 ----------
	10
	10

# 24 - En tant que sys, supprimez l'utilisateur Rami et vérifiez le résultat ?

conn / as sysdba;

 Connected.

DROP USER C##RAMI CASCADE;

 User dropped.

SELECT * FROM dba_users WHERE username='C##RAMI';

 no rows selected

# 25 - Affichez l'espace libre disponible dans le tablespace "USERS".

SELECT tablespace_name, tablespace_size - used_space AS free_space_mb FROM dba_tablespace_usage_metrics WHERE tablespace_name='USERS';

 TABLESPACE_NAME 	       FREE_SPACE_MB
 ----------------------- -------------
 USERS				           4193958

# 26 - Identifiez les segments avec le plus grand espace libre non utilisé dans le tablespace "USERS".

// format segement_name col

col segment_name format a20

SELECT segment_name, bytes/1024/1024 AS size_mb FROM dba_segments WHERE tablespace_name='USERS' ORDER BY bytes DESC;

 SEGMENT_NAME		SIZE_MB
 -------------------- ----------
 SI_IMAGE_FORMATS_TAB	  .0625
 SYS_C006183		  .0625
 SI_VALUES_TAB		  .0625
 ORDDCM_INTERNAL_TAGS	  .0625
 ORDDCM_DOC_TYPES	  .0625
 ORDDCM_INSTALL_DOCS	  .0625
 ORDDCM_VR_DT_MAP	  .0625
 ORDDCM_ANON_RULE_TYP	  .0625
 ES
 
 ORDDCM_ANON_ACTION_T	  .0625
 
 SEGMENT_NAME		SIZE_MB
 -------------------- ----------
 YPES
 
 ORDDCM_PREFS_DEF_VAL	  .0625
 UES_TAB
 
 ORDDCM_PREFS_VALID_V	  .0625
 ALUES_TAB
 
 ORDDCM_PREFS_LOOKUP	  .0625
 SYS_C006063		  .0625
 SYS_C006064		  .0625
 
 SEGMENT_NAME		SIZE_MB
 -------------------- ----------
 SYS_C006066		  .0625
 ORDDCM_INTERNAL_TAGS	  .0625
 _PK
 
 DOC_TYPES_PK		  .0625
 DOC_TYPES_UK		  .0625
 ORDDCM_I_DOCS_PK	  .0625
 ORDDCM_VR_DT_MAP_PK1	  .0625
 ORDDCM_ANON_R_TYPES_	  .0625
 PK1
 
 
 SEGMENT_NAME		SIZE_MB
 -------------------- ----------
 ORDDCM_ANON_A_TYPES_	  .0625
 PK1
 
 SYS_FK0000063445N000	  .0625
 07$
 
 SYS_FK0000063445N000	  .0625
 09$
 
 SYS_C006181		  .0625
 SYS_C006182		  .0625
 
 SEGMENT_NAME		SIZE_MB
 -------------------- ----------
 SI_FEATURES_TAB 	  .0625
 
 27 rows selected.

# 27 - Réduisez la taille du tablespace "USERS" en libérant de l'espace inutilisé.

ALTER DATABASE DATAFILE '/opt/oracle/oradata/ORCLCDB/users01.dbf' RESIZE 10M;

 Database altered.

# 28 - Cherchez les différentes méthodes connexion en tant que sys (précisez trois méthodes) ?

# Méthode 1 : Connexion en tant que SYSDBA avec SQL*Plus et en utilisant l'authentification OS
sqlplus / as sysdba

# Méthode 2 : Connexion en tant que SYSDBA avec SQL*Plus en utilisant un nom d'utilisateur et un mot de passe
sqlplus sys/password as sysdba

# Méthode 3 : Connexion en tant que SYSDBA avec SQL Developer en utilisant un nom d'utilisateur et un mot de passe
# Ouvrez SQL Developer, créez une nouvelle connexion, entrez "sys" comme nom d'utilisateur, le mot de passe, et sélectionnez "SYSDBA" dans le menu

# 29 - Comment créer un fichier de mots de passe du système d'exploitation en utilisant la commande orapwd sur les plateformes Unix et Windows ?

# Sur Linux :

orapwd file=$ORACLE_HOME/dbs/orapw$ORACLE_SID password=1945 entries=10

# 30 - Quelles sont les étapes nécessaires pour générer un fichier de mots de passe OS avec la commande orapwd, que ce soit sur Unix ou sur Windows ?

# Étapes nécessaires pour générer un fichier de mots de passe OS avec la commande orapwd :
# 1. Ouvrez une invite de commande ou un terminal.
# 2. Assurez-vous que la variable d'environnement ORACLE_HOME est définie correctement.
# 3. Exécutez la commande orapwd avec les paramètres requis.    

# 31 - Quels sont les paramètres requis pour exécuter correctement la commande orapwd et créer un fichier de mots de passe du système d'exploitation sur les environnements Unix et Windows ?

# Paramètres requis pour exécuter correctement la commande orapwd :
# - file : Spécifie le chemin et le nom du fichier de mots de passe à créer.
# - password : Définit le mot de passe pour l'utilisateur SYS.
# - entries : Indique le nombre maximum d'entrées (utilisateurs) que le fichier peut contenir.
# - force (optionnel) : Si le fichier existe déjà, cette option permet de le remplacer.
# - ignorecase (optionnel) : Permet de rendre les comparaisons de noms d'utilisateur insensibles à la casse.
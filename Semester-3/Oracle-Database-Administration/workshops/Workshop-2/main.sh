# 1 - Connectez en tant que sys et créez un fichier spool tpDataFile.txt

sqlplus / as sysdba

spool /opt/oracle/oradata/Workshops/tpDataFile.txt;

# 2 - Affichez les structures des vues systèmes dba_tablespaces et v$tablespace

desc dba_tablespaces;

 Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 TABLESPACE_NAME			   NOT NULL VARCHAR2(30)
 BLOCK_SIZE				   NOT NULL NUMBER
 INITIAL_EXTENT 				    NUMBER
 NEXT_EXTENT					    NUMBER
 MIN_EXTENTS				   NOT NULL NUMBER
 MAX_EXTENTS					    NUMBER
 MAX_SIZE					    NUMBER
 PCT_INCREASE					    NUMBER
 MIN_EXTLEN					    NUMBER
 STATUS 					    VARCHAR2(9)
 CONTENTS					    VARCHAR2(21)
 LOGGING					    VARCHAR2(9)
 FORCE_LOGGING					    VARCHAR2(3)
 EXTENT_MANAGEMENT				    VARCHAR2(10)
 ALLOCATION_TYPE				    VARCHAR2(9)
 PLUGGED_IN					    VARCHAR2(3)
 SEGMENT_SPACE_MANAGEMENT			    VARCHAR2(6)
 DEF_TAB_COMPRESSION				    VARCHAR2(8)
 RETENTION					    VARCHAR2(11)
 BIGFILE					    VARCHAR2(3)
 PREDICATE_EVALUATION				    VARCHAR2(7)
 ENCRYPTED					    VARCHAR2(3)
 COMPRESS_FOR					    VARCHAR2(30)
 DEF_INMEMORY					    VARCHAR2(8)
 DEF_INMEMORY_PRIORITY				    VARCHAR2(8)
 DEF_INMEMORY_DISTRIBUTE			    VARCHAR2(15)
 DEF_INMEMORY_COMPRESSION			    VARCHAR2(17)
 DEF_INMEMORY_DUPLICATE 			    VARCHAR2(13)
 SHARED 					    VARCHAR2(13)
 DEF_INDEX_COMPRESSION				    VARCHAR2(8)
 INDEX_COMPRESS_FOR				    VARCHAR2(13)
 DEF_CELLMEMORY 				    VARCHAR2(14)
 DEF_INMEMORY_SERVICE				    VARCHAR2(12)
 DEF_INMEMORY_SERVICE_NAME			    VARCHAR2(1000)
 LOST_WRITE_PROTECT				    VARCHAR2(7)
 CHUNK_TABLESPACE				    VARCHAR2(1)

DESC V$TABLESPACE;

 Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 TS#						    NUMBER
 NAME						    VARCHAR2(30)
 INCLUDED_IN_DATABASE_BACKUP			    VARCHAR2(3)
 BIGFILE					    VARCHAR2(3)
 FLASHBACK_ON					    VARCHAR2(3)
 ENCRYPT_IN_BACKUP				    VARCHAR2(3)
 CON_ID 					    NUMBER

# 3 - A partir de la vue dba_tablespaces, affichez le nom, l'état et le type de tablespace

SELECT TABLESPACE_NAME, STATUS, CONTENTS FROM DBA_TABLESPACES;

TABLESPACE_NAME 	       STATUS	 CONTENTS
------------------------------ --------- ---------------------
SYSTEM			       ONLINE	 PERMANENT
SYSAUX			       ONLINE	 PERMANENT
UNDOTBS1		       ONLINE	 UNDO
TEMP			       ONLINE	 TEMPORARY
USERS			       ONLINE	 PERMANENT

# 4 - Créez des tabelspaces permanents ci-dessous et vérifiez le résultat:
# S1 associé a f1.dbf de 50M dans le répertoire DATA
# S2 associé a f2.dbf de 10M dans le répertoire DATA
# S3 associé a f3.dbf de 10M dans le répertoire DATA

CREATE TABLESPACE S1 DATAFILE /opt/oracle/oradata/Workshops/data/f1.dbf SIZE 50M;
CREATE TABLESPACE S2 DATAFILE /opt/oracle/oradata/Workshops/data/f2.dbf SIZE 10M;
CREATE TABLESPACE S3 DATAFILE /opt/oracle/oradata/Workshops/data/f3.dbf SIZE 10M;

SELECT TABLESPACE_NAME, STATUS, CONTENTS FROM DBA_TABLESPACES;

TABLESPACE_NAME 	       STATUS	 CONTENTS
------------------------------ --------- ---------------------
SYSTEM			       ONLINE	 PERMANENT
SYSAUX			       ONLINE	 PERMANENT
UNDOTBS1		       ONLINE	 UNDO
TEMP			       ONLINE	 TEMPORARY
USERS			       ONLINE	 PERMANENT
S1			       ONLINE	 PERMANENT
S2			       ONLINE	 PERMANENT
S3			       ONLINE	 PERMANENT

# 6. Afficher la structure de la vues système dba_data_files.

desc dba_data_files;

 Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 FILE_NAME					    VARCHAR2(513)
 FILE_ID					    NUMBER
 TABLESPACE_NAME				    VARCHAR2(30)
 BYTES						    NUMBER
 BLOCKS 					    NUMBER
 STATUS 					    VARCHAR2(9)
 RELATIVE_FNO					    NUMBER
 AUTOEXTENSIBLE 				    VARCHAR2(3)
 MAXBYTES					    NUMBER
 MAXBLOCKS					    NUMBER
 INCREMENT_BY					    NUMBER
 USER_BYTES					    NUMBER
 USER_BLOCKS					    NUMBER
 ONLINE_STATUS					    VARCHAR2(7)
 LOST_WRITE_PROTECT				    VARCHAR2(7)

# 7. A partir de la vue dba_data_files, Affichez les tablespaces et les fichiers associés ?

SELECT FILE_NAME, TABLESPACE_NAME FROM DBA_DATA_FILES;

 FILE_NAME      TABLESPACE_NAME
-------------- --------------------
/opt/oracle/oradata/ORCLCDB/system01.dbf SYSTEM

/opt/oracle/oradata/ORCLCDB/sysaux01.dbf SYSAUX

/opt/oracle/oradata/ORCLCDB/undotbs01.dbf UNDOTBS1


FILE_NAME  TABLESPACE_NAME
---------- -------------------------------- 

/opt/oracle/oradata/ORCLCDB/users01.dbf USERS

/opt/oracle/oradata/Workshops/data/f1.dbf S1

/opt/oracle/oradata/Workshops/data/f2.dbf S2

/opt/oracle/oradata/Workshops/data/f3.dbf S3


# 8. Mettez le tablespace S3 en lecture seule et vérifiez le résultat ?

ALTER TABLESPACE S3 READ ONLY;

Tablespace altered.

SELECT TABLESPACE_NAME, STATUS FROM DBA_TABLESPACES;

TABLESPACE_NAME      STATUS
-------------------- ---------
SYSTEM		     ONLINE
SYSAUX		     ONLINE
UNDOTBS1	     ONLINE
TEMP		     ONLINE
USERS		     ONLINE
S1		     ONLINE
S2		     ONLINE
S3		     READ ONLY

# 9. Augmentez la taille de fichier associé au tablespace S2 par 5m d’espace supplémentaire et vérifiez le résultat ?

ALTER DATABASE DATAFILE '/opt/oracle/oradata/Workshops/data/f2.dbf' RESIZE 15M;

Database altered.

SELECT FILE_NAME, BYTES/1024/1024 AS SIZE_MB FROM DBA_DATA_FILES;

FILE_NAME                                  SIZE_MB
--------------------------------           ----------
/opt/oracle/oradata/ORCLCDB/system01.dbf       910
/opt/oracle/oradata/ORCLCDB/sysaux01.dbf       670
/opt/oracle/oradata/ORCLCDB/undotbs01.dbf      330
/opt/oracle/oradata/ORCLCDB/users01.dbf        5
/opt/oracle/oradata/Workshops/data/f1.dbf      50
/opt/oracle/oradata/Workshops/data/f2.dbf      15
/opt/oracle/oradata/Workshops/data/f3.dbf      10

# 10.Ajoutez un fichier supplémentaire f4.dbf de 15m au tablespace S2, puis vérifiez le résultat ?

ALTER TABLESPACE S2 ADD DATAFILE '/opt/oracle/oradata/Workshops/data/f4.dbf' SIZE 15M;

Tablespace altered.

SELECT FILE_NAME, TABLESPACE_NAME, BYTES/1024/1024 AS SIZE_MB FROM DBA_DATA_FILES;


FILE_NAME                              TABLESPACE_NAME 	SIZE_MB   
----------------------                -------------------- ----------
/opt/oracle/oradata/ORCLCDB/system01.dbf SYSTEM			    910
/opt/oracle/oradata/ORCLCDB/sysaux01.dbf SYSAUX			    670
/opt/oracle/oradata/ORCLCDB/undotbs01.dbf UNDOTBS1		    330
/opt/oracle/oradata/ORCLCDB/users01.dbf USERS			      5
/opt/oracle/oradata/Workshops/data/f1.dbf S1			     50
/opt/oracle/oradata/Workshops/data/f2.dbf S2			     15
/opt/oracle/oradata/Workshops/data/f4.dbf S2			     15
/opt/oracle/oradata/Workshops/data/f3.dbf S3			     10
/opt/oracle/oradata/ORCLCDB/undotbs01.dbf UNDOTBS1		    330
/opt/oracle/oradata/ORCLCDB/users01.dbf USERS			      5
/opt/oracle/oradata/Workshops/data/f1.dbf S1			     50
/opt/oracle/oradata/Workshops/data/f2.dbf S2			     15
/opt/oracle/oradata/Workshops/data/f4.dbf S2			     15
/opt/oracle/oradata/Workshops/data/f3.dbf S3			     10
/opt/oracle/oradata/ORCLCDB/undotbs01.dbf UNDOTBS1		    330
/opt/oracle/oradata/Workshops/data/f2.dbf S2			     15
/opt/oracle/oradata/Workshops/data/f4.dbf S2			     15
/opt/oracle/oradata/Workshops/data/f3.dbf S3			     10

# 11.Essayez de créer une table formation (titre varchar2(20)) dans le tablespace S3 ? que se passe-t-il ? quoi faire pour
# exécuter correctement cette requête ? proposer une solution pour la création de la table formation dans le tablespace
# S3.

CREATE TABLE formation (titre VARCHAR2(20)) TABLESPACE S3;

CREATE TABLE formation (titre VARCHAR2(20)) TABLESPACE S3
*
ERROR at line 1:
ORA-01647: tablespace 'S3' is read-only, cannot allocate space in it

// Solution: Mettre le tablespace S3 en mode read write

ALTER TABLESPACE S3 READ WRITE;

Tablespace altered.

CREATE TABLE formation (titre VARCHAR2(20)) TABLESPACE S3;

Table created.

# 12.Insérez les deux lignes suivantes (php, html) dans la table formation ?

INSERT INTO formation (titre) VALUES ('php');
INSERT INTO formation (titre) VALUES ('html');

2 rows created.

# 13.Mettez le tablespace S3 hors ligne ? puis essayez d’afficher le contenu de la table formation ? que se passe-t-il ?
# quoi faire pour exécuter correctement cette requête ?

ALTER TABLESPACE S3 OFFLINE;

Tablespace altered.

SELECT * FROM formation;

SELECT * FROM formation
              *
ERROR at line 1:
ORA-00376: file 15 cannot be read at this time
ORA-01110: data file 15: '/opt/oracle/oradata/Workshops/data/f3.dbf'

# 14.Supprimerez uniquement le tablespace S1 et garder le fichier associé, puis vérifiez-le résultat ?

DROP TABLESPACE S1;

Tablespace dropped.

SELECT TABLESPACE_NAME, STATUS FROM DBA_TABLESPACES;

TABLESPACE_NAME      STATUS
-------------------- ---------
SYSTEM		     ONLINE
SYSAUX		     ONLINE
UNDOTBS1	     ONLINE
TEMP		     ONLINE
USERS		     ONLINE
S2		     ONLINE
S3		     OFFLINE

SELECT FILE_NAME, TABLESPACE_NAME FROM DBA_DATA_FILES;


    FILE_NAME                              TABLESPACE_NAME
----------------------                --------------------
/opt/oracle/oradata/ORCLCDB/system01.dbf  SYSTEM
/opt/oracle/oradata/ORCLCDB/sysaux01.dbf  SYSAUX
/opt/oracle/oradata/ORCLCDB/undotbs01.dbf UNDOTBS1
/opt/oracle/oradata/ORCLCDB/users01.dbf   USERS
/opt/oracle/oradata/Workshops/data/f2.dbf S2
/opt/oracle/oradata/Workshops/data/f4.dbf S2
/opt/oracle/oradata/Workshops/data/f3.dbf S3

# 15.Supprimerez le tablespace S2 et le fichier associé, puis vérifiez-le résultat ?

DROP TABLESPACE S2 INCLUDING CONTENTS AND DATAFILES;

Tablespace dropped.

SELECT TABLESPACE_NAME, STATUS FROM DBA_TABLESPACES;

TABLESPACE_NAME      STATUS
-------------------- ---------
SYSTEM		     ONLINE
SYSAUX		     ONLINE
UNDOTBS1	     ONLINE
TEMP		     ONLINE
USERS		     ONLINE
S3		     OFFLINE

SELECT FILE_NAME, TABLESPACE_NAME FROM DBA_DATA_FILES;

FILE_NAME                     TABLESPACE_NAME
----------------------        --------------------
/opt/oracle/oradata/ORCLCDB/system01.dbf  SYSTEM
/opt/oracle/oradata/ORCLCDB/sysaux01.dbf  SYSAUX
/opt/oracle/oradata/ORCLCDB/undotbs01.dbf  UNDOTBS1
/opt/oracle/oradata/ORCLCDB/users01.dbf   USERS
/opt/oracle/oradata/Workshops/data/f3.dbf  S3

# 16.Créer un répertoire Data2 à coté de répertoire Data.

mkdir /opt/oracle/oradata/Workshops/data2

# 17.Proposez les étapes à suivre pour déplacer le fichier de données associé au tablespace S3 dans le répertoire Data2,
# testez l’impact de votre proposition sur le contenu de la table formation, Que contactez-vous ?

-- Etape 1: Mettre le tablespace S3 hors ligne

ALTER TABLESPACE S3 OFFLINE;

-- Etape 2: Copier le fichier f3.dbf dans le répertoire data2

cp /opt/oracle/oradata/Workshops/data/f3.dbf /opt/oracle/oradata/Workshops/data2/f3.dbf


-- Etape 3: Modifier le chemin du fichier de données dans la base de données

alter tablespace S3 rename datafile '/opt/oracle/oradata/Workshops/data/f3.dbf' to '/opt/oracle/oradata/Workshops/data2/f3.dbf';

-- Etape 4: Supprimer le fichier f3.dbf du répertoire data

rm /opt/oracle/oradata/Workshops/data/f3.dbf

-- Etape 5: Mettre le tablespace S3 en ligne

ALTER TABLESPACE S3 ONLINE;

# 18 - Quelle est la différence entre un tablespace permanent et un tablespace d’annulation ?

-- Un tablespace permanent est utilisé pour stocker les objets de la base de données tels que les tables et les index.
-- Un tablespace d’annulation est utilisé pour stocker les informations nécessaires pour annuler les transactions en cours.
-- Les tablespaces d’annulation sont essentiels pour maintenir l’intégrité des données lors des opérations de modification.

# 19 - Afficher le tablespace d’annulation de votre base de donnés ?

SELECT TABLESPACE_NAME, STATUS, CONTENTS FROM DBA_TABLESPACES WHERE CONTENTS = 'UNDO';

TABLESPACE_NAME      STATUS    CONTENTS
-------------------- --------- ---------------------
UNDOTBS1	     ONLINE    UNDO


# 20 - Décrire les étapes de basculement entre les tablespaces d’annulation ?

-- Etape 1: Créer un nouveau tablespace d’annulation

CREATE UNDO TABLESPACE undo2;

Tablespace created.

-- Etape 2: Modifier le paramètre de l’instance pour utiliser le nouveau tablespace d’annulation

ALTER SYSTEM SET UNDO_TABLESPACE = undo2 SCOPE=BOTH;

System altered.

-- Etape 3: Mettre le nouveau tablespace d’annulation en ligne

ALTER TABLESPACE undo2 ONLINE;

Tablespace altered.

-- Etape 4: Supprimer l’ancien tablespace d’annulation

DROP TABLESPACE UNDOTBS1 INCLUDING CONTENTS AND DATAFILES;

Tablespace dropped.

# 21 - Créez un tablespace DATA02 d’annulation.

CREATE UNDO TABLESPACE DATA02 DATAFILE '/opt/oracle/oradata/Workshops/data2/undo02.dbf' SIZE 20M;

Tablespace created.

# 22 - Basculer le tablespace DATA02 comme tablespace d’annulation de votre base de données ?

ALTER SYSTEM SET UNDO_TABLESPACE = DATA02 SCOPE=BOTH;

System altered.

# 23 - Décrire avec un exemple le fonctionnement de système OMF ?

-- OMF (Oracle Managed Files) est un système de gestion automatique des fichiers de la base de données Oracle.
-- Lorsqu’OMF est activé, Oracle crée et gère automatiquement les fichiers de
-- données, les fichiers de contrôle et les fichiers de journalisation dans des emplacements prédéfinis.
-- Par exemple, si vous créez une nouvelle table dans un tablespace, Oracle créera
-- automatiquement le fichier de données associé dans le répertoire OMF sans que vous ayez à spécifier manuellement le chemin du fichier.
-- Pour activer OMF, vous devez définir les paramètres suivants dans le fichier de configuration de l’instance Oracle:
-- DB_CREATE_FILE_DEST: Spécifie le répertoire où Oracle créera les fichiers de
-- données, les fichiers de contrôle et les fichiers de journalisation.
-- DB_CREATE_ONLINE_LOG_DEST_n: Spécifie les répertoires où Oracle
-- créera les fichiers de journalisation en ligne.
-- Exemple:

ALTER SYSTEM SET DB_CREATE_FILE_DEST = '/opt/oracle/oradata/Workshops/omf' SCOPE=BOTH;
ALTER SYSTEM SET DB_CREATE_ONLINE_LOG_DEST_1 = '/opt/oracle/oradata/Workshops/omf' SCOPE=BOTH;

-- Après avoir défini ces paramètres, vous pouvez créer des tablespaces et des fichiers de données sans spécifier les chemins de fichiers.
-- Par exemple:

CREATE TABLESPACE omf_tablespace;

Tablespace created.

-- Oracle créera automatiquement un fichier de données dans le répertoire OMF spécifié.
-- Vous pouvez vérifier la création automatique des fichiers en consultant la vue DBA_DATA_FILES:

SELECT FILE_NAME, TABLESPACE_NAME FROM DBA_DATA_FILES WHERE TABLESPACE_NAME = 'OMF_TABLESPACE';

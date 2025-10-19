# 1 - Afficher les structures des vues système v$log et v$logfile

desc v$log;

 Name			 Null?     Type
 -------------- ---------- -----------------
 GROUP# 					    NUMBER
 THREAD#					    NUMBER
 SEQUENCE#					    NUMBER
 BYTES						    NUMBER
 BLOCKSIZE					    NUMBER
 MEMBERS					    NUMBER
 ARCHIVED					    VARCHAR2(3)
 STATUS 					    VARCHAR2(16)
 FIRST_CHANGE#					NUMBER
 FIRST_TIME					    DATE
 NEXT_CHANGE#					NUMBER
 NEXT_TIME					    DATE
 CON_ID 					    NUMBER

desc v$logfile;

 Name			 Null?     Type
 -------------- ---------- -----------------
 GROUP# 					    NUMBER
 MEMBER					        VARCHAR2(512)
 STATUS 					    VARCHAR2(16)
 TYPE						    VARCHAR2(7)
 CON_ID 					    NUMBER

# 2 - A partir de la vue système v$log, Affichez le nom, l’état de chaque groupe de journalisation ?

SELECT GROUP#, STATUS FROM v$log;

GROUP#      STATUS
---------- ----------------
	 1     INACTIVE
	 2     INACTIVE
	 3     CURRENT

# 3 - Basculer entre les groupes et vérifiez le résultat via la vue système v$log?

ALTER SYSTEM SWITCH LOGFILE;

 System altered.

SELECT GROUP#, STATUS FROM v$log;

GROUP#      STATUS
---------- ----------------
     1     CURRENT
     2     INACTIVE
     3     ACTIVE

# 4 - Affichez les fichiers de journalisation depuis la vue système v$logfile

SELECT GROUP#, MEMBER, STATUS FROM v$logfile;

 GROUP#  MEMBER  STATUS
 --------- ------- -------------------------
 3 /opt/oracle/oradata/ORCLCDB/redo03.log
 2 /opt/oracle/oradata/ORCLCDB/redo02.log
 1 /opt/oracle/oradata/ORCLCDB/redo01.log

# 5 - Créer un répertoire nommé log sur la partition

mkdir log

# 6 - Ajoutez un groupe de journalisation nommé 4 avec un seul membre log41.log dans le répertoire log et vérifiez le résultat

ALTER DATABASE ADD LOGFILE GROUP 4 ('/opt/oracle/oradata/Workshops/Workshop3/log/log41.log') SIZE 50M;

 database altered.

# 7 - En respectant les conventions d’appellations ci-dessous, ajoutez un membre à chaque groupe
# de fichiers de journalisation de votre base de données dans le répertoire log, puis vérifiez le
# résultat :
# ▪ Ajoutez un membre au groupe 1 : log12.log
# ▪ Ajoutez un membre au groupe 2 : log22.log
# ▪ Ajoutez un membre au groupe 4 : log42.log

ALTER DATABASE ADD LOGFILE MEMBER '/opt/oracle/oradata/Workshops/Workshop3/log/log12.log' TO GROUP 1;

 database altered.

ALTER DATABASE ADD LOGFILE MEMBER '/opt/oracle/oradata/Workshops/Workshop3/log/log22.log' TO GROUP 2;

 database altered.

ALTER DATABASE ADD LOGFILE MEMBER '/opt/oracle/oradata/Workshops/Workshop3/log/log42.log' TO GROUP 4;

 database altered.

SELECT GROUP#, MEMBER, STATUS FROM v$logfile;

    GROUP#  MEMBER                                      STATUS
    --------- ---------------------------------------- -------------------------
    3 /opt/oracle/oradata/ORCLCDB/redo03.log
    2 /opt/oracle/oradata/ORCLCDB/redo02.log
    2 /opt/oracle/oradata/Workshops/Workshop3/log/log22.log
    1 /opt/oracle/oradata/ORCLCDB/redo01.log
    1 /opt/oracle/oradata/Workshops/Workshop3/log/log12.log
    4 /opt/oracle/oradata/Workshops/Workshop3/log/log41.log
    4 /opt/oracle/oradata/Workshops/Workshop3/log/log42.log

# 8 - Essayez de supprimer le membre log41.log que se passe-t-il ?

ALTER DATABASE DROP LOGFILE MEMBER '/opt/oracle/oradata/Workshops/Workshop3/log/log41.log';

 ALTER DATABASE DROP LOGFILE MEMBER '/opt/oracle/oradata/Workshops/Workshop3/log/log41.log'
 *
 ERROR at line 1:
 ORA-00362: member is required to form a valid logfile in group 4
 ORA-01517: log member: '/opt/oracle/oradata/Workshops/Workshop3/log/log41.log'

# 9 - Supprimer le membre log42.log ? et vérifiez le résultat

ALTER DATABASE DROP LOGFILE MEMBER '/opt/oracle/oradata/Workshops/Workshop3/log/log42.log';

 database altered.

# 10 - Exécutez puis expliquez la requête suivante :

Select name, log_mode from V$database;

 NAME	  LOG_MODE
 --------- ------------
 ORCLCDB   NOARCHIVELOG


# La requête affiche le nom de la base de données et son mode de journalisation. Le mode de journalisation "NOARCHIVELOG" signifie que la base de données ne conserve pas

# 11 - Citez la différence entre le mode Archivelog et noArchivelog?

# En mode ARCHIVELOG, Oracle Database enregistre toutes les modifications apportées à la base de données dans des fichiers de journalisation (redo logs) et archive ces fichiers lorsqu'ils sont pleins. Cela permet de récupérer la base de données jusqu'à un point précis dans le temps en cas de panne.

# En mode NOARCHIVELOG, Oracle Database ne conserve pas les fichiers de journalisation une fois qu'ils sont remplis. Cela signifie qu'il n'est pas possible de récupérer la base de données à un point précis dans le temps, ce qui peut entraîner une perte de données en cas de panne.


# 12 - Comment rendre une base de données en mode ARCHIVLELOG ? (étape par étape)

SHUTDOWN IMMEDIATE;

 Database closed.
 Database dismounted.
 ORACLE instance shut down.

STARTUP MOUNT;

 ORACLE instance started.
 
 Total System Global Area 4848614352 bytes
 Fixed Size		    9145296 bytes
 Variable Size		  956301312 bytes
 Database Buffers	 3875536896 bytes
 Redo Buffers		    7630848 bytes
 
 Database mounted.

ALTER DATABASE ARCHIVELOG;

 Database altered.

ALTER DATABASE OPEN;

 Database altered.


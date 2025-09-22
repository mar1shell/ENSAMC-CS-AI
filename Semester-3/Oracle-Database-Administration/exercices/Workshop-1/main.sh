# 1 - Affichez le service de l'instance de DB:

sqlplus / as sysdba

SELECT instance_name, status, database_status, host_name FROM v$instance;


# 2 - assurez vous que l'instance est démarrée:

INSTANCE_NAME	 STATUS       DATABASE_STATUS
---------------- ------------ -----------------
HOST_NAME
----------------------------------------------------------------
ORCLCDB 	 OPEN	      ACTIVE
b65cbdbedafb

# 3 - lancer la commande SQL*Plus en tant qu'administrateur et connectez-vous à la base de données en tant que sys:

sqlplus / as sysdba

# 4 - Afficher le login de l'utilisateur connecté:

show user;
USER is "SYS"

# 5 - Créez un fichier spool:

spool tp1.txt

# 6 - Afficher la structure de vue système v$instance:

desc v$instance

Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 INSTANCE_NUMBER				    NUMBER
 INSTANCE_NAME					    VARCHAR2(16)
 HOST_NAME					        VARCHAR2(64)
 VERSION					        VARCHAR2(17)
 VERSION_LEGACY 				    VARCHAR2(17)
 VERSION_FULL					    VARCHAR2(17)
 STARTUP_TIME					    DATE
 STATUS 					        VARCHAR2(12)
 PARALLEL					        VARCHAR2(3)
 THREAD#					        NUMBER
 ARCHIVER					        VARCHAR2(7)
 LOG_SWITCH_WAIT				    VARCHAR2(15)
 LOGINS 					        VARCHAR2(10)
 SHUTDOWN_PENDING				    VARCHAR2(3)
 DATABASE_STATUS				    VARCHAR2(17)
 INSTANCE_ROLE					    VARCHAR2(18)
 ACTIVE_STATE					    VARCHAR2(9)
 BLOCKED					        VARCHAR2(3)
 CON_ID 					        NUMBER
 INSTANCE_MODE					    VARCHAR2(11)
 EDITION					        VARCHAR2(7)
 FAMILY 					        VARCHAR2(80)
 DATABASE_TYPE					    VARCHAR2(15)

 # 7 - Affichez les informations de l'instance à partir de la vue v$instance, et interprétez les résultats:

SELECT instance_name, status, database_status, edition FROM v$instance;

INSTANCE_NAME	 STATUS       DATABASE_STATUS	EDITION
---------------- ------------ ----------------- -------
ORCLCDB 	 OPEN	      ACTIVE		EE

# 8 - Affichez la structure de vue systeme v$database:

desc v$database;

 Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 DBID						    NUMBER
 NAME						    VARCHAR2(9)
 CREATED					    DATE
 RESETLOGS_CHANGE#				    NUMBER
 RESETLOGS_TIME 				    DATE
 PRIOR_RESETLOGS_CHANGE#			    NUMBER
 PRIOR_RESETLOGS_TIME				    DATE
 LOG_MODE					    VARCHAR2(12)
 CHECKPOINT_CHANGE#				    NUMBER
 ARCHIVE_CHANGE#				    NUMBER
 CONTROLFILE_TYPE				    VARCHAR2(7)
 CONTROLFILE_CREATED				    DATE
 CONTROLFILE_SEQUENCE#				    NUMBER
 CONTROLFILE_CHANGE#				    NUMBER
 CONTROLFILE_TIME				    DATE
 OPEN_RESETLOGS 				    VARCHAR2(11)
 VERSION_TIME					    DATE
 OPEN_MODE					    VARCHAR2(20)
 PROTECTION_MODE				    VARCHAR2(20)
 PROTECTION_LEVEL				    VARCHAR2(20)
 REMOTE_ARCHIVE 				    VARCHAR2(8)
 ACTIVATION#					    NUMBER
 SWITCHOVER#					    NUMBER
 DATABASE_ROLE					    VARCHAR2(16)
 ARCHIVELOG_CHANGE#				    NUMBER
 ARCHIVELOG_COMPRESSION 			    VARCHAR2(8)
 SWITCHOVER_STATUS				    VARCHAR2(20)
 DATAGUARD_BROKER				    VARCHAR2(8)
 GUARD_STATUS					    VARCHAR2(7)
 SUPPLEMENTAL_LOG_DATA_MIN			    VARCHAR2(8)
 SUPPLEMENTAL_LOG_DATA_PK			    VARCHAR2(3)
 SUPPLEMENTAL_LOG_DATA_UI			    VARCHAR2(3)
 FORCE_LOGGING					    VARCHAR2(39)
 PLATFORM_ID					    NUMBER
 PLATFORM_NAME					    VARCHAR2(101)
 RECOVERY_TARGET_INCARNATION#			    NUMBER
 LAST_OPEN_INCARNATION# 			    NUMBER
 CURRENT_SCN					    NUMBER
 FLASHBACK_ON					    VARCHAR2(18)
 SUPPLEMENTAL_LOG_DATA_FK			    VARCHAR2(3)
 SUPPLEMENTAL_LOG_DATA_ALL			    VARCHAR2(3)
 DB_UNIQUE_NAME 				    VARCHAR2(30)
 STANDBY_BECAME_PRIMARY_SCN			    NUMBER
 FS_FAILOVER_MODE				    VARCHAR2(19)
 FS_FAILOVER_STATUS				    VARCHAR2(22)
 FS_FAILOVER_CURRENT_TARGET			    VARCHAR2(30)
 FS_FAILOVER_THRESHOLD				    NUMBER
 FS_FAILOVER_OBSERVER_PRESENT			    VARCHAR2(7)
 FS_FAILOVER_OBSERVER_HOST			    VARCHAR2(512)
 CONTROLFILE_CONVERTED				    VARCHAR2(3)
 PRIMARY_DB_UNIQUE_NAME 			    VARCHAR2(30)
 SUPPLEMENTAL_LOG_DATA_PL			    VARCHAR2(3)
 MIN_REQUIRED_CAPTURE_CHANGE#			    NUMBER
 CDB						    VARCHAR2(3)
 CON_ID 					    NUMBER
 PENDING_ROLE_CHANGE_TASKS			    VARCHAR2(512)
 CON_DBID					    NUMBER
 FORCE_FULL_DB_CACHING				    VARCHAR2(3)
 SUPPLEMENTAL_LOG_DATA_SR			    VARCHAR2(3)

# 9 - Affichez les informations de la base de données à partir de la vue v$database et interpretez les résultats:

SELECT name, cdb, open_mode from v$database;

NAME	  CDB OPEN_MODE
--------- --- --------------------
ORCLCDB   YES READ WRITE

# 10 - A partir de la console sqlplus et en tant que sys, arrêtez la base de données dans la mode immediate? et notez les étapes d'arrêt de la base de données:

shutdown immediate;

Database closed.
Database dismounted.
ORACLE instance shut down.

# 11 - Démarrez l'instance dans le mode nomount et notez la taille allouée à l'instance:

startup nomount;

ORACLE instance started.

Total System Global Area 4848614352 bytes
Fixed Size		    9145296 bytes
Variable Size		  956301312 bytes
Database Buffers	 3875536896 bytes
Redo Buffers		    7630848 bytes

# 12 - Tapez la requete select instance_name, status from v$instance; interprétez les résultats:

SELECT instance_name, startup_time, status from v$instance;

INSTANCE_NAME	 STARTUP_T STATUS
---------------- --------- ------------
ORCLCDB 	 22-SEP-25 STARTED

# 13 - Basculez la base de données en mode mount puis dans le mode open. Vérifiez le statut de chaque état et notez vos observations:

alter database mount;

Database altered.

SELECT instance_name, startup_time, status from v$instance;

INSTANCE_NAME	 STARTUP_T STATUS
---------------- --------- ------------
ORCLCDB 	 22-SEP-25 MOUNTED

alter database open;

Database altered.

SELECT instance_name, startup_time, status from v$instance;

INSTANCE_NAME	 STARTUP_T STATUS
---------------- --------- ------------
ORCLCDB 	 22-SEP-25 OPEN

# 14 - Tapez les commandes deux suivantes et comparez les résultats:

select * from v$sga;

NAME			  VALUE     CON_ID
-------------------- ---------- ----------
Fixed Size		9145296 	 0
Variable Size	      956301312 	 0
Database Buffers     3875536896 	 0
Redo Buffers		7630848 	 0

show sga;

Total System Global Area 4848614352 bytes
Fixed Size		    9145296 bytes
Variable Size		  956301312 bytes
Database Buffers	 3875536896 bytes
Redo Buffers		    7630848 bytes

# 15 - Afficher la structure de vue système v$process:

desc v$process;

Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 ADDR						    RAW(8)
 PID						    NUMBER
 SOSID						    VARCHAR2(24)
 SPID						    VARCHAR2(24)
 STID						    VARCHAR2(24)
 EXECUTION_TYPE 				    VARCHAR2(20)
 PNAME						    VARCHAR2(5)
 USERNAME					    VARCHAR2(15)
 SERIAL#					    NUMBER
 TERMINAL					    VARCHAR2(30)
 PROGRAM					    VARCHAR2(48)
 TRACEID					    VARCHAR2(255)
 TRACEFILE					    VARCHAR2(513)
 BACKGROUND					    VARCHAR2(1)
 LATCHWAIT					    VARCHAR2(16)
 LATCHSPIN					    VARCHAR2(16)
 PGA_USED_MEM					    NUMBER
 PGA_ALLOC_MEM					    NUMBER
 PGA_FREEABLE_MEM				    NUMBER
 PGA_MAX_MEM					    NUMBER
 NUMA_DEFAULT					    NUMBER
 NUMA_CURR					    NUMBER
 CPU_USED					    NUMBER
 CON_ID 					    NUMBER

# 16 - Affichez les informations de processus:

SELECT pname, username, PGA_USED_MEM FROM v$process;

PNAME USERNAME	      PGA_USED_MEM
----- --------------- ------------
				 0
PMON  oracle		   1976165
CLMN  oracle		   1976165
PSP0  oracle		   1959389
VKTM  oracle		   1956205
GEN0  oracle		   1996565
MMAN  oracle		   1959389
TT00  oracle		  19080901
GEN1  oracle		   1960381
SCMN  oracle		   1824445
DIAG  oracle		   1956605

PNAME USERNAME	      PGA_USED_MEM
----- --------------- ------------
OFSD  oracle		   2428581
SCMN  oracle		   1824445
DBRM  oracle		   3619853
VKRM  oracle		   1959469
SVCB  oracle		   2070069
PMAN  oracle		   1962005
DIA0  oracle		   6910645
DBW0  oracle		   8861733
LGWR  oracle		   2153437
CKPT  oracle		   2018325
LG00  oracle		   1824749

PNAME USERNAME	      PGA_USED_MEM
----- --------------- ------------
SMON  oracle		   2262157
LG01  oracle		   1824749
TT01  oracle		   1824445
RECO  oracle		   2508493
TT02  oracle		   1824445
LREG  oracle		   3230205
SMCO  oracle		   1956189
PXMN  oracle		   1959389
MMNL  oracle		   1976013
MMON  oracle		   6180821
D000  oracle		   2165085

PNAME USERNAME	      PGA_USED_MEM
----- --------------- ------------
S000  oracle		   1481565
TMON  oracle		   1959389
      oracle		   6857557
W000  oracle		   1973341
W001  oracle		   1916261
AQPC  oracle		   1961941
W002  oracle		   1824445
P000  oracle		   1843037
P001  oracle		   1847389
P002  oracle		   1773645
P003  oracle		   1773645

PNAME USERNAME	      PGA_USED_MEM
----- --------------- ------------
P004  oracle		   1468645
P005  oracle		   1468645
P006  oracle		   1468645
P007  oracle		   1468645
P008  oracle		   1468645
P009  oracle		   1468645
P00A  oracle		   1468645
P00B  oracle		   1468645
P00C  oracle		   1468645
P00D  oracle		   1468645
P00E  oracle		   1468645

PNAME USERNAME	      PGA_USED_MEM
----- --------------- ------------
P00F  oracle		   1468645
CJQ0  oracle		   3228357
W005  oracle		   1936621
M000  oracle		  27156701
W003  oracle		   2811053
M001  oracle		  27482517
M002  oracle		   2089077
W006  oracle		   1824445
M004  oracle		   2023149
W007  oracle		   1916261
W008  oracle		   1824445

PNAME USERNAME	      PGA_USED_MEM
----- --------------- ------------
W009  oracle		   1916077
W00A  oracle		   1850565
W00B  oracle		   1916077
M003  oracle		   2096501
W00C  oracle		   1824445
W00D  oracle		   1916077
QM02  oracle		   1830197
Q001  oracle		   5297605
W00E  oracle		   1916077
W00F  oracle		   1916077
Q004  oracle		   3094333

PNAME USERNAME	      PGA_USED_MEM
----- --------------- ------------
W004  oracle		   1850565

78 rows selected.

# 17 - fermez le fichier spool et quittez SQL*Plus:

spool off;
exit;

# 18 - Affichez le contenu du fichier tp1.txt:

# 19 - Analyse des commandes suivantes:

# - a

SELECT component, current_size from v$memory_dynamic_components order by 2 desc;

COMPONENT							 CURRENT_SIZE
---------------------------------------------------------------- ------------
SGA Target							   4848615424
DEFAULT buffer cache						   3741319168
PGA Target							   1627389952
shared pool							    855638016
Shared IO Pool							    134217728
large pool							     67108864
java pool							     33554432
unified pga pool							    0
KEEP buffer cache							    0
RECYCLE buffer cache							    0
DEFAULT 2K buffer cache 						    0

COMPONENT							 CURRENT_SIZE
---------------------------------------------------------------- ------------
DEFAULT 4K buffer cache 						    0
DEFAULT 8K buffer cache 						    0
DEFAULT 16K buffer cache						    0
DEFAULT 32K buffer cache						    0
Data Transfer Cache							    0
In-Memory Area								    0
In Memory RW Extension Area						    0
In Memory RO Extension Area						    0
ASM Buffer Cache							    0
memoptimize buffer cache						    0
streams pool								    0

22 rows selected.

# - b:

SELECT pname, description FROM v$process_memory;

desc v$bgprocess;                     

 Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 PADDR						    RAW(8)
 PSERIAL#					    NUMBER
 NAME						    VARCHAR2(5)
 DESCRIPTION					    VARCHAR2(64)
 ERROR						    NUMBER
 TYPE						    VARCHAR2(5)
 PRIORITY					    VARCHAR2(8)
 CON_ID 					    NUMBER

# - c:

SELECT pid, spid, program, username from v$process order by program;

       PID SPID
---------- ------------------------
PROGRAM 					 USERNAME
------------------------------------------------ ---------------
	 1
PSEUDO

	39 9189
oracle@b65cbdbedafb (AQPC)			 oracle

	57 9326
oracle@b65cbdbedafb (CJQ0)			 oracle
........
........

# 20 - Interprétez techniquement les variables suivantes:

$ORACLE_HOME: c'est le répertoire d'installation principal pour les fichiers binaires Oracle.

$ORACLE_BASE: c'est le répertoire de base pour tous les fichiers Oracle, y compris les bases de données, les journaux, les fichiers de configuration, etc.

$ORACLE_SID: c'est l'identifiant de système Oracle qui identifie de manière unique une instance de base de données Oracle spécifique sur un système.

# 21 - Aficher leurs valeurs:

# Voir fichier script.sh dans le meme répertoire pour le script.
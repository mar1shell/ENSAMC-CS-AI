# 1 - Localisez les emplacements des fichiers init.ora et spfile

SHOW PARAMETER spfile;

 NAME				     TYPE	 VALUE
 ---------------------- -------- ------------------------------
 spfile				     string	 /opt/oracle/product/19c/dbhome_1/dbs/spfileORCLCDB.ora
						 
SHOW PARAMETER pfile;

 NAME				     TYPE	 VALUE
 ---------------------- -------- ------------------------------
 spfile				     string	 /opt/oracle/product/19c/dbhome_1/dbs/spfileORCLCDB.ora


# 2 - Donnez les différentes possibilités pour visualiser les paramètres d’initialisation d’une instance ?

# SQL> SHOW PARAMETER <nom_paramètre>;
# SQL> SELECT * FROM V$PARAMETER WHERE NAME='<nom_paramètre>';
# SQL> SELECT * FROM V$SPPARAMETER WHERE NAME='<nom_paramètre>';
# SQL> SELECT * FROM V$SYSTEM_PARAMETER WHERE NAME='<nom_paramètre>';

# 3 - Listez et affichez les valeurs des variables db_name et sga_target de fichier init.ora quel est l’intérêt de chaque variable ?

SHOW PARAMETER db_name;

 NAME				     TYPE	 VALUE
 ----------------------  ------  ------------------------------
 db_name 			     string	 ORCLCDB

SHOW PARAMETER sga_target;

 NAME				     TYPE	 VALUE
 ----------------------- ---  ------------------------------
 sga_target			     big integer 4624M

# db_name : Nom de la base de données
# sga_target : Taille totale de la SGA (System Global Area)

# 4 - Affichez les valeurs des variables sga_target et db_name en utilisant pfile sur le serveur ?

SELECT NAME, VALUE, ISDEFAULT, ISMODIFIED, ISSYS_MODIFIABLE FROM V$PARAMETER WHERE NAME IN ('sga_target', 'db_name');

 NAME  VALUE   ISDEFAULT  ISMODIFIED  ISSYS_MODIFIABLE
 ----- ------- ---------- ----------- ------------------
 sga_target 4848615424 FALSE	  FALSE      IMMEDIATE
 db_name ORCLCDB FALSE	  FALSE      FALSE

# 5 - Modifiez la valeur de la variable sga_target du fichier init.ora SQL ALTER SYSTEM SET sga_target=New_Value SCOPE=memory;

ALTER SYSTEM SET sga_target=4400M SCOPE=MEMORY;

 System altered.

# 6 - Affichez la valeur actuelle de la variable sga_target, que constatez-vous ?

SHOW PARAMETER sga_target;

 NAME				     TYPE	 VALUE
 ----------------------- ---  ------------------------------
 sga_target			     big integer 4400M

# 7 - Redémarrez l’instance avec la commande startup force. (En mode avec les commande shutdown et startup)

SHUTDOWN IMMEDIATE;

 Database closed.
 Database dismounted.
 ORACLE instance shut down.

STARTUP;

 ORACLE instance started.

 Total System Global Area 5368705448 bytes
 Fixed Size		    9146792 bytes
 Variable Size		  956301312 bytes
 Database Buffers	 4395630592 bytes
 Redo Buffers		    7626752 bytes
 Database mounted.
 Database opened.

# 8 - Affichez la valeur actuelle de la variable sga_target, que constatez-vous ?

SHOW PARAMETER sga_target;

 NAME				     TYPE	 VALUE
 ----------------------- ---  ------------------------------
 sga_target			     big integer 4624M

# 9 - Modifiez la valeur actuelle de la variable sga_target en une nouvelle valeur avec SQL ALTER SYSTEM SET sga_target=New_Value SCOPE=spfile;

ALTER SYSTEM SET sga_target=4500M SCOPE=SPFILE;

 System altered.

# 10 - Affichez la valeur actuelle de la variable sga_target, que constatez-vous ?

SHOW PARAMETER sga_target;

 NAME				     TYPE	 VALUE
 ----------------------- ---  ------------------------------
 sga_target			     big integer 4500M

# 11 - Redémarrez l’instance avec la commande startup force et affichez la valeur actuelle de la variable sga_target ? Que constatez-vous ?

SHUTDOWN IMMEDIATE;

 Database closed.
 Database dismounted.
 ORACLE instance shut down.

STARTUP;

 ORACLE instance started.

 Total System Global Area 4731173504 bytes
 Fixed Size		    9144960 bytes
 Variable Size		  905969664 bytes
 Database Buffers	 3808428032 bytes
 Redo Buffers		    7630848 bytes
 Database mounted.
 Database opened.

# 12 - Essayez de modifier variables db_block_size au niveau de la mémoire, que constatez-vous ?

ALTER SYSTEM SET db_block_size=16384 SCOPE=MEMORY;

                 *
 ERROR at line 1:
 ORA-02095: specified initialization parameter cannot be modified

# 13 - Localisez l’emplacement des fichiers spfile ?

SHOW PARAMETER spfile;

 NAME				     TYPE	 VALUE
 ---------------------- -------- ------------------------------
 spfile				     string	 /opt/oracle/product/19c/dbhome_1/dbs/spfileORCLCDB.ora

# 14 - Affichez les emplacements des fichiers de contrôle de votre base de données ? et notez le nombre de fichiers de contrôle :

SHOW PARAMETER control_files;

NAME				     TYPE	 VALUE
----------------------- -------- ------------------------------
control_files			 string	 /opt/oracle/oradata/ORCLCDB/control01.ctl

# 15 - Sauvegardez le fichier de contrôle en trace puis vérifiez le contenu du fichier créé.

ALTER DATABASE BACKUP CONTROLFILE TO TRACE;

Database altered.

-- Le fichier de trace est généralement situé dans le répertoire spécifié par l'initialisation parameter USER_DUMP_DEST. Vous pouvez vérifier ce répertoire avec la commande suivante :

SHOW PARAMETER user_dump_dest;

 NAME				     TYPE	  VALUE
 ----------------------- -------- ------------------------------
 user_dump_dest		     string	  /opt/oracle/product/19c/dbhome_1/rdbms/log

# 16 - Voir PDF;




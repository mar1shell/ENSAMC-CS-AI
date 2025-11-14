# 1 - A l'aide de l'Assistant de Configuration Oracle Net, supprimez le listener par défaut (s'il existe) puis recréez un autre listener nommée DEMO?

lsnrctl stop

 LSNRCTL for Linux: Version 19.0.0.0.0 - Production on 10-NOV-2025 13:43:22

 Copyright (c) 1991, 2019, Oracle.  All rights reserved.
 
 Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=IPC)(KEY=EXTPROC1)))
 The command completed successfully

lsnrctl status

 LSNRCTL for Linux: Version 19.0.0.0.0 - Production on 10-NOV-2025 13:43:34

 Copyright (c) 1991, 2019, Oracle.  All rights reserved.
 
 Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=IPC)(KEY=EXTPROC1)))
 TNS-12541: TNS:no listener
  TNS-12560: TNS:protocol adapter error
   TNS-00511: No listener
    Linux Error: 2: No such file or directory
 Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=0.0.0.0)(PORT=1521)))
 TNS-12541: TNS:no listener
  TNS-12560: TNS:protocol adapter error
   TNS-00511: No listener
    Linux Error: 111: Connection refused

vi /opt/oracle/product/19c/dbhome_1/network/admin/listener.ora

# inside listener.ora file, add the following lines:
 # ------------------------------------------------------------------
 # This is the new listener entry for DEMO
 # ------------------------------------------------------------------
 DEMO =
   (DESCRIPTION =
     (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))
   )

lsnrctl start DEMO
 
 LSNRCTL for Linux: Version 19.0.0.0.0 - Production on 10-NOV-2025 13:55:06

 Copyright (c) 1991, 2019, Oracle.  All rights reserved.
 
 Starting /opt/oracle/product/19c/dbhome_1/bin/tnslsnr: please wait...
 
 TNSLSNR for Linux: Version 19.0.0.0.0 - Production
 System parameter file is /opt/oracle/product/19c/dbhome_1/network/admin/listener.ora
 Log messages written to /opt/oracle/diag/tnslsnr/1751548852dd/demo/alert/log.xml
 Listening on: (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=0.0.0.0)(PORT=1521)))
 
 Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=0.0.0.0)(PORT=1521)))
 STATUS of the LISTENER
 ------------------------
 Alias                     DEMO
 Version                   TNSLSNR for Linux: Version 19.0.0.0.0 - Production
 Start Date                10-NOV-2025 13:55:06
 Uptime                    0 days 0 hr. 0 min. 0 sec
 Trace Level               off
 Security                  ON: Local OS Authentication
 SNMP                      OFF
 Listener Parameter File   /opt/oracle/product/19c/dbhome_1/network/admin/listener.ora
 Listener Log File         /opt/oracle/diag/tnslsnr/1751548852dd/demo/alert/log.xml
 Listening Endpoints Summary...
   (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=0.0.0.0)(PORT=1521)))
 The listener supports no services
 The command completed successfull

lsnrctl status

 LSNRCTL for Linux: Version 19.0.0.0.0 - Production on 10-NOV-2025 13:55:38
 
 Copyright (c) 1991, 2019, Oracle.  All rights reserved.
 
 Connecting to (ADDRESS=(PROTOCOL=tcp)(HOST=)(PORT=1521))
 STATUS of the LISTENER
 ------------------------
 Alias                     DEMO
 Version                   TNSLSNR for Linux: Version 19.0.0.0.0 - Production
 Start Date                10-NOV-2025 13:55:06
 Uptime                    0 days 0 hr. 0 min. 32 sec
 Trace Level               off
 Security                  ON: Local OS Authentication
 SNMP                      OFF
 Listener Parameter File   /opt/oracle/product/19c/dbhome_1/network/admin/listener.ora
 Listener Log File         /opt/oracle/diag/tnslsnr/1751548852dd/demo/alert/log.xml
 Listening Endpoints Summary...
   (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=0.0.0.0)(PORT=1521)))
   (DESCRIPTION=(ADDRESS=(PROTOCOL=tcps)(HOST=1751548852dd)(PORT=5500))(Security=(my_wallet_directory=/opt/oracle/admin/ORCLCDB/xdb_wallet))(Presentation=HTTP)(Session=RAW))
 Services Summary...
 Service "433d4e5e39830c52e063020011acd672" has 1 instance(s).
   Instance "ORCLCDB", status READY, has 1 handler(s) for this service...
 Service "ORCLCDB" has 1 instance(s).
   Instance "ORCLCDB", status READY, has 1 handler(s) for this service...
 Service "ORCLCDBXDB" has 1 instance(s).
   Instance "ORCLCDB", status READY, has 1 handler(s) for this service...
 Service "orapdb1" has 1 instance(s).
   Instance "ORCLCDB", status READY, has 1 handler(s) for this service...
 The command completed successfully

# 2 - Vérifier l'état de listener à travers les services de votre machines ?

systemctl status oracle-listener

# 3 - Exécutez l'utilitaire lsnrctl, puis arrêtez le listener? vérifiez son statut à partir la liste du service ?

lsnrctl

 LSNRCTL for Linux: Version 19.0.0.0.0 - Production on 10-NOV-2025 13:56:43
 
 Copyright (c) 1991, 2019, Oracle.  All rights reserved.
 
 Welcome to LSNRCTL, type "help" for information.

LSNRCTL> stop

 Connecting to (ADDRESS=(PROTOCOL=tcp)(HOST=)(PORT=1521))
 The command completed successfully

LSNRCTL> status

 Connecting to (ADDRESS=(PROTOCOL=tcp)(HOST=)(PORT=1521))
 TNS-12541: TNS:no listener
  TNS-12560: TNS:protocol adapter error
   TNS-00511: No listener
    Linux Error: 111: Connection refused

# 4 - A partir l'utilitaire lsnrctl, affichez les infos de votre listener ?

LSNRCTL> show

 The following operations are available after show
 An asterisk (*) denotes a modifier or extended command:
 
 rawmode                              displaymode                          
 rules                                trc_file                             
 trc_directory                        trc_level                            
 log_file                             log_directory                        
 log_status                           current_listener                     
 inbound_connect_timeout              startup_waittime                     
 snmp_visible                         save_config_on_stop                  
 dynamic_registration                 enable_global_dynamic_endpoint       
 oracle_home                          pid                                  
 connection_rate_limit                valid_node_checking_registration     
 registration_invited_nodes           registration_excluded_nodes          
 remote_registration_address          

# 5 - A partir l'utilitaire lsnrctl, démarrez le listener ?

LSNRCTL> start

 Starting /opt/oracle/product/19c/dbhome_1/bin/tnslsnr: please wait...

 TNSLSNR for Linux: Version 19.0.0.0.0 - Production
 System parameter file is /opt/oracle/product/19c/dbhome_1/network/admin/listener.ora
 Log messages written to /opt/oracle/diag/tnslsnr/1751548852dd/listener/alert/log.xml
 Listening on: (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=1751548852dd)(PORT=1521)))
 
 Connecting to (ADDRESS=(PROTOCOL=tcp)(HOST=)(PORT=1521))
 STATUS of the LISTENER
 ------------------------
 Alias                     LISTENER
 Version                   TNSLSNR for Linux: Version 19.0.0.0.0 - Production
 Start Date                10-NOV-2025 13:58:58
 Uptime                    0 days 0 hr. 0 min. 1 sec
 Trace Level               off
 Security                  ON: Local OS Authentication
 SNMP                      OFF
 Listener Parameter File   /opt/oracle/product/19c/dbhome_1/network/admin/listener.ora
 Listener Log File         /opt/oracle/diag/tnslsnr/1751548852dd/listener/alert/log.xml
 Listening Endpoints Summary...
   (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=1751548852dd)(PORT=1521)))
 The listener supports no services
 The command completed successfully

# 6 - Dans la machine serveur, assurez-vous que le listener est créé et que l'instance est démarrée?

sqlplus / as sysdba

SQL> select status from v$instance;

 STATUS
 ----------------
 OPEN

# 7 - Vérifier la connexion physique entre les deux machines avec la commande ping (même classe IP, désactiver le pare de feu, anti-virus, etc.)

ping 172.17.0.2

 PING 172.17.0.2 (172.17.0.2) 56(84) bytes of data.
 64 bytes from 172.17.0.2: icmp_seq=1 ttl=64 time=0.068 ms
 64 bytes from 172.17.0.2: icmp_seq=2 ttl=64 time=0.037 ms
 64 bytes from 172.17.0.2: icmp_seq=3 ttl=64 time=0.036 ms
 64 bytes from 172.17.0.2: icmp_seq=4 ttl=64 time=0.031 ms
 ^C
 --- 172.17.0.2 ping statistics ---
 4 packets transmitted, 4 received, 0% packet loss, time 3084ms
 rtt min/avg/max/mdev = 0.031/0.043/0.068/0.014 ms

# 8 - Se connecter en tant que sys à partir la machine serveur, puis créez un utilisateur y1/y1 (users est tablespce par défaut avec un qouta de 10m) ? par la suite, affectez les rôles connect et resource à yl?

sqlplus / as sysdba

SQL> CREATE USER C##yl IDENTIFIED BY yl DEFAULT TABLESPACE users  QUOTA 10M ON users;

 User created.

SQL> GRANT connect, resource TO C##yl;

Grant succeeded.

# 9 - Se connecter en tant que yl à partir la machine server, puis créez la table employe(code number(2)) ? Insérez qlq lignes dans la table employe, puis vérifiez le résultat avec la commande select * from employe; ?

SQL> CONNECT C##yl/yl;

 Connected.

SQL> CREATE TABLE employe (code NUMBER(2));

 Table created.

SQL> INSERT INTO employe (code) VALUES (1);
INSERT INTO employe (code) VALUES (2);
INSERT INTO employe (code) VALUES (3);

 1 row created.
 1 row created.
 1 row created.

SQL> SELECT * FROM employe;

       CODE
----------
         1
         2
         3

# 10 - Dans la machine client, créez un alias de connexion vers la machine serveur ?
# 11 - Testez la connectivité du client vers le serveur aves les deux méthodes: easy connect et alias de connexion? que constatez-vous ?
# 12 - Se connecter en tant que yl à partir la machine client, puis afficher la structure de la table employe avec la commande Desc? Insérez qlq lignes dans la table employe, puis vérifiez le résultat avec la commande Select?
# 13 - En tant que sys, activez l'audit sur les commandes suivantes (insert, update et delete) pour la table y1.employe par Access ?
# 14 - se connecter en tant que yl à partir la machine client, puis insérez qlq lignes dans la table employe, puis vérifiez le résultat ? par la suite, supprimez toutes les lignes de la table ?
# 15 - En tant que sys, affichez les informations pertinentes de la table dba_audit_trail, et évaluez le résultat ? (le nom de l'utilisateur, le nom de la machine, le système d'exploitation, etc.)
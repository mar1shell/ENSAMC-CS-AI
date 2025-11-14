# 1 - Se connectez en tant que SYS, par la suite, affichez la structure de la vue dba_users et dba_roles

sqlplus / as sysdba

DESC dba_users;

 Name					   Null?    Type
 ------------------------- -------- ----------------------------
 USERNAME				   NOT NULL VARCHAR2(128)
 USER_ID				   NOT NULL NUMBER
 PASSWORD					        VARCHAR2(4000)
 ACCOUNT_STATUS 		   NOT NULL VARCHAR2(32)
 LOCK_DATE					        DATE
 EXPIRY_DATE					    DATE
 DEFAULT_TABLESPACE		   NOT NULL VARCHAR2(30)
 TEMPORARY_TABLESPACE	   NOT NULL VARCHAR2(30)
 LOCAL_TEMP_TABLESPACE				VARCHAR2(30)
 CREATED				   NOT NULL DATE
 PROFILE				   NOT NULL VARCHAR2(128)
 INITIAL_RSRC_CONSUMER_GROUP	    VARCHAR2(128)
 EXTERNAL_NAME					    VARCHAR2(4000)
 PASSWORD_VERSIONS				    VARCHAR2(17)
 EDITIONS_ENABLED				    VARCHAR2(1)
 AUTHENTICATION_TYPE				VARCHAR2(8)
 PROXY_ONLY_CONNECT				    VARCHAR2(1)
 COMMON 					        VARCHAR2(3)
 LAST_LOGIN					        TIMESTAMP(9) WITH TIME ZONE
 ORACLE_MAINTAINED				    VARCHAR2(1)
 INHERITED					        VARCHAR2(3)
 DEFAULT_COLLATION				    VARCHAR2(100)
 IMPLICIT					        VARCHAR2(3)
 ALL_SHARD					        VARCHAR2(3)
 PASSWORD_CHANGE_DATE				DATE

DESC dba_roles;

Name					   Null?    Type
 ------------------------- -------- ----------------------------
 ROLE					   NOT NULL VARCHAR2(128)
 ROLE_ID				   NOT NULL NUMBER
 PASSWORD_REQUIRED				    VARCHAR2(8)
 AUTHENTICATION_TYPE				VARCHAR2(11)
 COMMON 					        VARCHAR2(3)
 ORACLE_MAINTAINED				    VARCHAR2(1)
 INHERITED					        VARCHAR2(3)
 IMPLICIT					        VARCHAR2(3)
 EXTERNAL_NAME					    VARCHAR2(4000)

# 2 - A partir la vue dba_users, afficher le nom et l'état de chaque utilisateur (username, account_status)

// format column

SET LINESIZE 100
SET PAGESIZE 50
COLUMN username FORMAT A20

SELECT username, account_status FROM dba_users;

 USERNAME	            ACCOUNT_STATUS
--------------------    --------------------------------
 SYS		            OPEN
 SYSTEM		            OPEN
 XS$NULL 	            EXPIRED & LOCKED
 DBSNMP		            LOCKED
 APPQOSSYS	            LOCKED
 GSMCATUSER	            LOCKED
 MDDATA		            LOCKED
 DBSFWUSER	            LOCKED
 SYSBACKUP	            LOCKED
 REMOTE_SCHEDULER_AGENT LOCKED
 NT 
 GGSYS		            LOCKED
 ANONYMOUS		        EXPIRED & LOCKED
 GSMUSER 	            LOCKED
 SYSRAC		            LOCKED
 GSMROOTUSER		    LOCKED
 CTXSYS		            EXPIRED & LOCKED
 OPS$ORACLE	            OPEN
 OJVMSYS 	            LOCKED
 DVSYS		            LOCKED
 DVF		            LOCKED
 SI_INFORMTN_SCHEMA     LOCKED
 AUDSYS		            LOCKED
 GSMADMIN_INTERNAL      LOCKED
 DIP		            LOCKED
 ORDPLUGINS	            LOCKED
 LBACSYS 	            LOCKED
 MDSYS		            LOCKED
 OLAPSYS 	            LOCKED
 SYSKM		            LOCKED
 ORDDATA 	            LOCKED
 OUTLN		            LOCKED
 SYS$UMF 	            LOCKED
 ORACLE_OCM	            LOCKED
 XDB		            LOCKED
 WMSYS		            LOCKED
 SYSDG		            LOCKED
 ORDSYS		            LOCKED

37 rows selected.

# 3 - Affichez les noms des rôles par défaut de votre base de données ?

SELECT role FROM dba_roles;

 ROLE
 ----------------------------------------------------------------------------------------------------
 CONNECT
 RESOURCE
 DBA
 PDB_DBA
 AUDIT_ADMIN
 AUDIT_VIEWER
 SELECT_CATALOG_ROLE
 EXECUTE_CATALOG_ROLE
 CAPTURE_ADMIN
 EXP_FULL_DATABASE
 IMP_FULL_DATABASE
 CDB_DBA
 APPLICATION_TRACE_VIEWER
 LOGSTDBY_ADMINISTRATOR
 DBFS_ROLE
 GSMUSER_ROLE
 GSMROOTUSER_ROLE
 AQ_ADMINISTRATOR_ROLE
 AQ_USER_ROLE
 DATAPUMP_EXP_FULL_DATABASE
 DATAPUMP_IMP_FULL_DATABASE
 ADM_PARALLEL_EXECUTE_TASK
 PROVISIONER
 XS_SESSION_ADMIN
 XS_NAMESPACE_ADMIN
 XS_CACHE_ADMIN
 XS_CONNECT
 OEM_MONITOR
 GATHER_SYSTEM_STATISTICS
 OPTIMIZER_PROCESSING_RATE
 DBMS_MDX_INTERNAL
 BDSQL_ADMIN
 BDSQL_USER
 RECOVERY_CATALOG_OWNER
 RECOVERY_CATALOG_OWNER_VPD
 RECOVERY_CATALOG_USER
 EM_EXPRESS_BASIC
 EM_EXPRESS_ALL
 SYSUMF_ROLE
 SCHEDULER_ADMIN
 HS_ADMIN_SELECT_ROLE
 HS_ADMIN_EXECUTE_ROLE
 HS_ADMIN_ROLE
 GLOBAL_AQ_USER_ROLE
 OEM_ADVISOR
 JAVAUSERPRIV
 GSMADMIN_ROLE

 ROLE
 ----------------------------------------------------------------------------------------------------
 GSM_POOLADMIN_ROLE
 GDS_CATALOG_SELECT
 GGSYS_ROLE
 XDBADMIN
 XDB_SET_INVOKER
 AUTHENTICATEDUSER
 XDB_WEBSERVICES
 XDB_WEBSERVICES_WITH_PUBLIC
 XDB_WEBSERVICES_OVER_HTTP
 SODA_APP
 DATAPATCH_ROLE
 WM_ADMIN_ROLE
 JAVAIDPRIV
 JAVASYSPRIV
 JAVADEBUGPRIV
 EJBCLIENT
 JMXSERVER
 DBJAVASCRIPT
 JAVA_ADMIN
 CTXAPP
 ORDADMIN
 OLAP_XS_ADMIN
 OLAP_DBA
 OLAP_USER
 DV_SECANALYST
 RDFCTX_ADMIN
 LBAC_DBA
 DV_REALM_OWNER
 DV_MONITOR
 DV_ADMIN
 DV_OWNER
 DV_ACCTMGR
 DV_PUBLIC
 DV_PATCH_ADMIN
 DV_STREAMS_ADMIN
 DV_GOLDENGATE_ADMIN
 DV_XSTREAM_ADMIN
 DV_GOLDENGATE_REDO_ACCESS
 DV_AUDIT_CLEANUP
 DV_DATAPUMP_NETWORK_LINK
 DV_POLICY_OWNER
 DV_REALM_RESOURCE

 89 rows selected.

# 4 - Créez deux utilisateurs avec les informations suivantes: u1/u1 et u2/u2

CREATE USER C##u1 IDENTIFIED BY u1;

 User created.

CREATE USER C##u2 IDENTIFIED BY u2;

 User created.

# 5 - Créez un rôle r1?

CREATE ROLE C##r1;

 Role created.

# 6 - Donnez les rôles connect et resource à r1, puis affectez r1 à u1?

GRANT CONNECT, RESOURCE TO C##r1;

Grant succeeded.

GRANT C##r1 TO C##u1;

Grant succeeded.

# 7 - Affectez les rôles connect et resource à u2?

GRANT CONNECT, RESOURCE TO C##u2;

Grant succeeded.

# 8 - Essayez de se connecter en tant que u1 puis en tant que u2? par la suite comparez les résultats avec les conclusions de l'atelier précédant?

connect C##u1/u1;

 Connected.

connect C##u2/u2;

 Connected.

# 9 - En tant que SYS, supprimer le rôle r1 ? puis essayez de se connecter en tant que u1? que constatez-vous?

connect / as sysdba;

 Connected.

DROP ROLE C##r1;

 Role dropped.

connect C##u1/u1;

 *ERROR:
 ORA-01045: user C##U1 lacks CREATE SESSION privilege; logon denied

 Warning: You are no longer connected to ORACLE.

# 10 - Affichez la structure de la table système dba_profiles?

desc dba_profiles;

 Name						       Null?	Type
 --------------------------------  -------- ------------------------------------
 PROFILE					       NOT NULL VARCHAR2(128)
 RESOURCE_NAME					   NOT NULL VARCHAR2(32)
 RESOURCE_TYPE					            VARCHAR2(8)
 LIMIT							            VARCHAR2(128)
 COMMON 						            VARCHAR2(3)
 INHERITED						            VARCHAR2(3)
 IMPLICIT						            VARCHAR2(3)

# 11 - En se basant sur la structure de dba_profiles, affichez les noms de profils de votre base de données ?

SELECT DISTINCT profile FROM dba_profiles;

 PROFILE
 ----------------------------------------------------------------------------------------------------
 DEFAULT
 ORA_STIG_PROFILE

# 12 - Affichez les ressources de profils sans répétition et expliquez l'intérêt de chaque ressource ?

SELECT DISTINCT resource_name FROM dba_profiles;

 RESOURCE_NAME
 --------------------------------
 PASSWORD_LIFE_TIME
 CPU_PER_CALL
 CONNECT_TIME
 IDLE_TIME
 PASSWORD_VERIFY_FUNCTION
 SESSIONS_PER_USER
 PRIVATE_SGA
 CPU_PER_SESSION
 PASSWORD_LOCK_TIME
 FAILED_LOGIN_ATTEMPTS
 LOGICAL_READS_PER_SESSION
 PASSWORD_REUSE_TIME
 PASSWORD_REUSE_MAX
 COMPOSITE_LIMIT
 LOGICAL_READS_PER_CALL
 INACTIVE_ACCOUNT_TIME
 PASSWORD_GRACE_TIME
 
 17 rows selected.

# voir cours pour les explications

# 13 - Créez un profil p1 avec les caractéristiques suivantes : Nombre de tentation de connexion 1 Verrouillage après tentation 5mn

CREATE PROFILE C##p1 LIMIT
  FAILED_LOGIN_ATTEMPTS 2
  PASSWORD_LOCK_TIME 5;

# 14 - Créez un utilisateur u3/u3 en l'assignant le profil p1?

CREATE USER C##u3 IDENTIFIED BY u3 PROFILE C##p1;

 User created.

# 15 - Affectez les rôles connect et resource à u3?

GRANT CONNECT, RESOURCE TO C##u3;

Grant succeeded.

# 16 - Essayez deux fois à se connecter en tant u3 avec un mot de passe erroné, que constatez-vous?

connect C##u3/wrongpassword;

 *ERROR:
 ORA-01017: invalid username/password; logon denied

connect C##u3/wrongpassword;

 *ERROR:
 ORA-01017: invalid username/password; logon denied

connect C##u3/u3;

 ERROR:
 ORA-28000: The account is locked.

# 17 - Supprimez le profil p1, puis vérifiez le profil de u3 ?

DROP PROFILE C##p1;
 
 ERROR at line 1:
 ORA-02382: profile C##P1 has users assigned, cannot drop without CASCADE

DROP PROFILE C##p1 CASCADE;

 Profile dropped.

SELECT username, profile FROM dba_users WHERE username = 'C##U3';

 USERNAME	     PROFILE
 -------------------- --------------------
 C##U3		     DEFAULT

# 18 - Créez un profil p2 avec les caractéristiques suivantes : Nombre session: 1 CONNECT TIME:2

CREATE PROFILE C##p2 LIMIT
  SESSIONS_PER_USER 1
  CONNECT_TIME 2;

 Profile created.

# 19 - Exécutez la commande suivante : Alter system set resource_limit=true scope=both;

ALTER SYSTEM SET resource_limit = TRUE SCOPE = BOTH;

 System altered.

# 20 - Créez un utilisateur u4/u4 en l'assignant le profil p2? donnez à u4 les rôles connect et resource?

CREATE USER C##u4 IDENTIFIED BY u4 PROFILE C##p2;

 User created.

GRANT CONNECT, RESOURCE TO C##u4;

 Grant succeeded.

# 21 - Ouvrez une session en tant que u4? Que constatez-vous ?

connect C##u4/u4;

 Connected.

# 22 - Gardez la première session et veuillez ouvrir une autre console SQLplus pour se connectez en tant que u4? Que constatez-vous?

connect C##u4/u4;

 ERROR:
 ORA-02391: exceeded simultaneous SESSIONS_PER_USER limit
 
 Warning: You are no longer connected to ORACLE.

# 23 - En tant que SYS, Exécutez la commande suivante : Alter system set resource_limit false scope=both;

ALTER SYSTEM SET resource_limit = FALSE SCOPE = BOTH;

 System altered.

# 24 - Par suite, refaire les questions 21 et 22? Que constatez-vous?

connect C##u4/u4;

 Connected.

connect C##u4/u4;

 Connected.

# 25 - Supprimez le profil p2, puis vérifiez le profil de u4?

DROP PROFILE C##p2 CASCADE;

 Profile dropped.

SELECT username, profile FROM dba_users WHERE username = 'C##U4';

 USERNAME	     PROFILE
 --------------- --------------------
 C##U4		     DEFAULT

# 26 - Proposer un profile p3 qui contrôle la complexité de mot de passe à 4 caractères.

CREATE OR REPLACE FUNCTION check_4_chars (
  p_username IN VARCHAR2,
  p_password IN VARCHAR2,
  p_old_password IN VARCHAR2
) RETURN BOOLEAN
IS
BEGIN
  IF LENGTH(p_password) < 4 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Le mot de passe doit avoir au moins 4 caractères');
  END IF;
  
  RETURN TRUE;
END;/

 Function created.

CREATE PROFILE C##p3 LIMIT
  PASSWORD_VERIFY_FUNCTION check_4_chars;

 Profile created.

# 27 - Créez un utilisateur u5/u5 en l'assignant le profil p3? donnez à u5 les rôles connect et resource? que constates vous et comment corriger la situation.

CREATE USER C##u5 IDENTIFIED BY u5 PROFILE C##p3;

 ERROR at line 1:
 ORA-28003: password verification for the specified password failed
 ORA-20001: Le mot de passe doit avoir au moins 4 caracteres

CREATE USER C##u5 IDENTIFIED BY u5555 PROFILE C##p3;

 User created.

GRANT CONNECT, RESOURCE TO C##u5;

 Grant succeeded.

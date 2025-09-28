# Linux - TP 2
# Date: 01/11/2024
# Author: mar1shell

# 1.Votre compte d'utilisateur est-il défini dans le fichier /etc/passwd? Pourquoi? Il y a-t-il d'autres alternatives? 

: "
Oui, mon compte d'utilisateur est défini dans le fichier /etc/passwd. 
Le fichier /etc/passwd contient les informations sur les comptes d'utilisateurs du système, y compris les noms d'utilisateur, les identifiants d'utilisateur, les identifiants de groupe, les répertoires de démarrage, les shells par défaut, etc. 
Il existe d'autres alternatives pour stocker les informations des comptes d'utilisateurs, telles que le fichier /etc/shadow qui stocke les mots de passe chiffrés des utilisateurs."

# 2.Quel est le répertoire de connexion de root?

less /etc/passwd # on consulte le fichier /etc/passwd pour trouver le répertoire de connexion de root
# Le répertoire de connexion de root est /root.

# 3.Quel est le shell par défaut de root?

less /etc/passwd # on consulte le fichier /etc/passwd pour trouver le shell par défaut de root
# Le shell par défaut de root est /bin/bash.

# 4.Quelle est la particularité de l’utilisateur nobody? Et de l’utilisateur shutdown?

less /etc/passwd # on consulte le fichier /etc/passwd pour trouver les particularités des utilisateurs nobody et shutdown

: "
L'utilisateur nobody est un utilisateur système utilisé par certains services pour exécuter des tâches sans privilèges. 
Il est généralement utilisé pour restreindre l'accès aux ressources système.
L'utilisateur shutdown est un utilisateur système qui est utilisé pour arrêter ou redémarrer le système. 
Il a les permissions nécessaires pour effectuer ces opérations."

# 5.Quels sont les utilisateurs définis dans /etc/passwd qui font partie du même groupe que l'administrateur?

less /etc/passwd # on consulte le fichier /etc/passwd pour trouver les utilisateurs définis qui font partie du même groupe que l'administrateur
# Les utilisateurs définis dans /etc/passwd qui font partie du même groupe que l'administrateur sont généralement les utilisateurs du groupe "sudo" ou "adm"
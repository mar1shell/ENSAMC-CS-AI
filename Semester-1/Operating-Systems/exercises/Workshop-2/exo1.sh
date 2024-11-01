# Linux - TP 2
# Date: 25/10/2024
# Author: mar1shell

# 1.Est-il possible de faire une copie du fichier etc/passwd? est-il possible de supprimer ou de modifier le fichier /etc/passwd?
: "
Oui, il est possible de faire une copie du fichier /etc/passwd. Pour cela, on peut utiliser la commande cp /etc/passwd /etc/passwd.bak. Il est possible de supprimer ou de modifier le fichier /etc/passwd si on a les droits nécessaires. Pour supprimer le fichier /etc/passwd, on peut utiliser la commande rm /etc/passwd. Pour modifier le fichier /etc/passwd, on peut utiliser un éditeur de texte comme nano ou vim.
on ne peut pas modifier le fichier /etc/passwd car il est protégé par le système. Pour le supprimer, il faut être root.
root a les droits nécessaires pour supprimer ou modifier le fichier /etc/passwd."

sudo vim /etc/passwd # pour modifier le fichier /etc/passwd

# 2.verifiez votre id et les groupes auxquels vous appartenez.

id

# mon id est 1000 et je suis dans les groups suivants: mar1shell, adm, cdrom, sudo, dip, plugdev, lpadmin, sambashare

# 3.créez un fichier txt qui soit lisible par tout le monde, mais non modifiable meme par vous.

vim file.txt # pour créer un fichier txt et ajouter du contenu

chmod 444 file.txt # pour rendre le fichier file.txt lisible par tout le monde, mais non modifiable

#  4.Créer un répertoire nommé "Top-Secret", dont le contenu est visible uniquement par vous-même.
# Les fichiers placés dans ce répertoire sont-ils lisibles par d’autres membres de votre groupe?

mkdir Top-Secret -m go-r # pour créer un répertoire nommé "Top-Secret", dont le contenu est visible uniquement par vous-même

# Les fichiers placés dans ce répertoire ne sont pas lisibles par d’autres membres de votre groupe.

# 5.Créer un répertoire nommé "Tentative" tel que les autres utilisateurs ne puissent pas lister son contenu mais
# puissent lire les fichiers qui y sont placés.

mkdir Tentative -m o-r # pour créer un répertoire nommé "Tentative" tel que les autres utilisateurs ne puissent pas lister son contenu mais puissent lire les fichiers qui y sont placés

# 6.Chercher dans le répertoire /usr/bin des exemples de commandes ayant la permission SUID.
# De quel genre de commande s’agit-il?

find /usr/bin -perm -4000 -type f

: "
Les commandes ayant la permission SUID sont des commandes qui s'exécutent avec les droits de l'utilisateur propriétaire du fichier exécutable. Cela signifie que ces commandes s'exécutent avec les privilèges de l'utilisateur propriétaire du fichier, et non avec les privilèges de l'utilisateur qui les exécute.
ils sont: /usr/bin/chsh, /usr/bin/chfn, /usr/bin/mount, /usr/bin/umount, /usr/bin/sudo, /usr/bin/su, /usr/bin/passwd, /usr/bin/gpasswd, /usr/bin/newgrp, /usr/bin/chage, /usr/bin/chfn, /usr/bin/chsh"
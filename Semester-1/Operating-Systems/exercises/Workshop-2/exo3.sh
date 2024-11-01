# Linux - TP 2
# Date: 01/11/2024
# Author: mar1shell

: '
Définir le lot de commandes à exécuter pour créer 4 utilisateurs en suivant les règles suivantes:
- Création de 2 groupes.
- Les premier et deuxième utilisateurs sont membres du premier groupe.
- Les troisième et quatrième utilisateurs sont membres du second groupe.
- Le deuxième utilisateur est aussi membre du second groupe.
- Le quatrième utilisateur est aussi membre du premier groupe.
- Outre leur répertoire de travail, les utilisateurs ont accès à un répertoire commun /home/groupe1 et/ou
/home/groupe2 suivant leur groupe. Dans ce répertoire, ils peuvent écrire, créer des fichiers mais ne peuvent
pas effacer les fichiers.'

# 1. Détaillez les étapes de création des groupes, des utilisateurs et des répertoires en indiquant quels fichiers vous
# utilisez et quelles commandes vous utilisez sur ces fichiers.

# Création des groupes

sudo groupadd groupe1 # Création du groupe "groupe1"
sudo groupadd groupe2 # Création du groupe "groupe2"

# Création des utilisateurs

sudo useradd -m -g groupe1 user1 # Création du premier utilisateur "user1" et ajout au groupe "groupe1"
sudo useradd -m -g groupe1 -G groupe2 user2 # Création du deuxième utilisateur "user2" et ajout au groupe "groupe1"
sudo useradd -m -g groupe2 user3 # Création du troisième utilisateur "user3" et ajout au groupe "groupe2"
sudo useradd -m -g groupe2 -G groupe1 user4 # Création du quatrième utilisateur "user4" et ajout au groupe "groupe2"

# Création des répertoires communs

sudo mkdir /home/groupe1 # Création du répertoire commun "/home/groupe1"
sudo mkdir /home/groupe2 # Création du répertoire commun "/home/groupe2"

# Attribution des permissions sur les répertoires communs

sudo chown root:groupe1 /home/groupe1 # Attribution du groupe "groupe1" au répertoire "/home/groupe1"
sudo chmod 1770 /home/groupe1 # Attribution des permissions en lecture, écriture et exécution pour le propriétaire et le groupe sur le répertoire "/home/groupe1"
# Les utilisateurs du groupe "groupe1" peuvent écrire, créer des fichiers mais ne peuvent pas effacer les fichiers

sudo chown root:groupe2 /home/groupe2 # Attribution du groupe "groupe2" au répertoire "/home/groupe2"
sudo chmod 1770cd 
 /home/groupe2 # Attribution des permissions en lecture, écriture et exécution pour le propriétaire et le groupe sur le répertoire "/home/groupe2"

# 2.Modifiez les profils des utilisateurs pour qu'au login, le répertoire d'accueil sur lequel il souhaite travailler lui
# soit demandé (s'il entre U, il sera sous son répertoire, s'il entre G, il sera sous le répertoire de son groupe). 

# Ajoutez ce script dans le fichier ~/.bash_profile ou ~/.bashrc de chaque utilisateur

# script pour demander le répertoire de travail à l'utilisateur

echo "Choisissez votre répertoire de travail:"
echo "U - Votre répertoire personnel"
echo "G - Répertoire de votre groupe"

read -p "Entrez votre choix (U/G): " choix # Demande à l'utilisateur de choisir le répertoire de travail

if [ "$choix" == "U" ]; then # Si l'utilisateur choisit son répertoire personnel (U) on le redirige vers son répertoire personnel
    cd ~
elif [ "$choix" == "G" ]; then # Si l'utilisateur choisit le répertoire de son groupe (G) on le redirige vers le répertoire de son groupe
    if groups | grep -q "groupe1"; then # Vérifie si l'utilisateur appartient au groupe "groupe1"
        cd /home/groupe1 # Redirige l'utilisateur vers le répertoire "/home/groupe1"
    elif groups | grep -q "groupe2"; then # Vérifie si l'utilisateur appartient au groupe "groupe2"
        cd /home/groupe2 # Redirige l'utilisateur vers le répertoire "/home/groupe2"
    else # Si l'utilisateur n'appartient à aucun groupe avec un répertoire commun
        echo "Vous n'appartenez à aucun groupe avec un répertoire commun." # Affiche un message d'erreur
    fi
else
    echo "Choix invalide. Vous restez dans le répertoire actuel." # Affiche un message d'erreur en cas de choix invalide
fi
# Linux - TP1
# Date: 18/10/2024
# Author: mar1shell

# 1.Determinez nom de la machine hote

echo "Nom de la machine hote: $(hostname)"

# 2.Detrminez le nom de l'utilisateur avec lequel je suis connecte

echo "Nom de l'utilisateur: $(whoami)"

# 3.Determinez le repertoire par défaut de votre session dans la hiérarchie des répertoires

echo "Repertoire par défaut de votre session: $HOME"

# 4. Y a-t-il des fichier, des répertoires dans ce répertoire?

echo "Liste des fichiers et répertoires dans $HOME:"
ls $HOME
# oui il y a des fichiers et des répertoires

# 5.je suis ailleurs et je veux revenir dans mon répertoire personnel

cd $HOME
# ou bien:
cd -
# ou bien:
cd

# 6.Entrez du texte dans un fichier nommé "fichier_1" qui n'existe pas encore

vim fichier_1
# ou bien:
nano fichier_1
# vous pouvez utiliser n'importe quel éditeur de texte

# Entrez du texte dans le fichier et sauvegardez

# 7.listes le contenu de fichier_1

cat fichier_1

# 8.lister le repertoire courant

ls

# 9.Lister le contenu du repertoire /bin et /dev

ls /bin
ls /dev

# 10.créer sous votre répertoire deux sous-répertoires nommés "Cours" et "Travaux"

mkdir Cours Travaux

# 11.se positionner dans le répertoire "Cours"

cd Cours

# 12.Lister le contenu du répertoire courant

ls

# 13.revenir dans le répertoire de départ et detruire Cours

cd ..
rmdir Cours

# 14.créer un fichier nommé "fichier_2"

touch fichier_2

# 15.copier chaque fichier en un autre qui porte le même nom avec l'extension .old

cp fichier_1 fichier_1.old
cp fichier_2 fichier_2.old

# 16.créer un répertoire "Ancien"

mkdir Ancien

# 17.déplacer les fichiers .old dans le répertoire "Ancien"

mv fichier_1.old fichier_2.old Ancien 

# 18.effacer tous les fichiers crées .old sans effacer le répertoire "Ancien"

rm Ancien/fichier_1.old Ancien/fichier_2.old
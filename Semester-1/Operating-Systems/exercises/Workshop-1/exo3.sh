# Linux - TP1
# Date: 18/10/2024
# Author: mar1shell

# 1.allez dans le repertoire personnel 

cd $HOME
# ou bien:
cd -
# ou bien:
cd

# 2.créez un repertoire CommandesLinux

mkdir CommandesLinux

# 3.allez dans le repertoire CommandesLinux

cd CommandesLinux

# 4.créez l'arborescence cours1/cours2/cours3/cours4

mkdir -p cours1/cours2/cours3/cours4

# 5.Listez le contenu du repertoire de facçon récursive

ls -R

# 6.supprimez le répertoire cours1. est-ce possible?

rmdir cours1
# non, ce n'est pas possible car le répertoire n'est pas vide

# 7.supprimez l'arborescence de répertoire cours1/cours2/cours3/cours4 puis vérifiez en listant le répertoire de facon recursive

rmdir -p cours1
ls -R

# 8. Allez dans le dossier CommandesLinux et créez les répertoires suivants :
#Code : .
#|--couleur
#|  `--froide
#`--forme
#   |--angle
#   `--courbe 

cd $HOME/CommandesLinux
mkdir -p couleur/froide forme/angle forme/courbe

# 9.copiez le fichier /etc/services dans votre répertoire CommandesLinux

cp /etc/services ~/CommandesLinux

# 10.A qui appartient le fichier que vous venez de copier? Quelle est sa date de sa dernière modification?

ls -l ~/CommandesLinux/services
# le fichier appartient à root et sa date de dernière modification est le 18 octobre 2024

# 11.créez les fichiers rond.txt, triangle.txt, carre.txt, rectangle.txt, vert.txt et bleu.txt dans le répertoire forme

touch rond.txt triangle.txt carre.txt rectangle.txt vert.txt bleu.txt

# 12.deplacez le fichie rond.txt dans le repertoire courbe et les fichiers triangle.txt, carre.txt, rectangle.txt dans le repertoire angle

mv rond.txt forme/courbe
mv triangle.txt carre.txt rectangle.txt forme/angle

# 13.Déplacez les fichiers vert.txt et bleu.txt dans le repertoire froide

mv vert.txt bleu.txt couleur/froide

# 14.allez dans le repertoire couleur et afficher le contenu du repertoire de facon récursive

cd couleur
ls -R

# 15.copier le repertoire sous le nom chaude. Est-ce possible? Comment?

cp -r froide chaude
# oui, c'est possible en utilisant l'option -r pour copier de manière récursive

# 16.allez dans le répertoire chaude et renommez bleu.txt en rouge.txt et vert.txt en jaune.txt

cd chaude
mv bleu.txt rouge.txt
mv vert.txt jaune.txt

# 17.remontez dans le répertoire CommandesLinux et renommez le repertoire couleur en peinture
# est-il besoin de spécifer une option particuliere a la commande mv?

cd ..
mv couleur peinture
# non, il n'est pas nécessaire de spécifier une option particulière

# 18.listez la totalite de l'arborescence de CommandesLinux

ls -R

# 19.affichez le contenu du fichier /etc/issue. que contient-il?

cat /etc/issue
# le fichier contient la version de la distribution Linux
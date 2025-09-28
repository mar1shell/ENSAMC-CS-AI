# Linux - TP1
# Date: 18/10/2024
# Author: mar1shell

# 1.indiquez par une commande dans quel répertoire vous vous trouvez

pwd

# 2.allez dans le répertoire /usr/share/doc puis verifiez le chemin de votre répertoire courant
 
cd /usr/share/doc
pwd

# 4.allez dans votre répertoire personnel sans taper le chemin complet

cd
# ou bien
cd ~
# ou bien 
cd $HOME

# 5.retournez dans votre répertoire précédent sans taper le chemin complet

cd ..

# 6.retournez dans votre répertoire personnel et listez son contenu

cd
ls

# 7.listez tous les fichiers meme cachés

ls -a

# 8.affichez de facon détaillé le contenu du répertoire /usr sans changer le répertoire 

ls -l /usr

# 9.affichez l'arborescence de fichier contenues dans /var sans changer le répertoire

ls -R /var

# 10.affichez de facon detaille le contenu du répertoire /var/log en classant les fichiers du plus vieux au plus recent

ls -ltr
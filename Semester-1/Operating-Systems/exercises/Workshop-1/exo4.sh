# Linux - TP1
# Date: 18/10/2024
# Author: mar1shell

# 1.créez dans votre répertoire ~ un repertoire "experience" qui contient le fichier chute_libre
# ajoutez une ligne de texte dans chute_libre

cd ~
mkdir experience
cd experience
vim chute_libre # ajouter le texte

# 2.dans votre home directory créez un lien physique appelé projectile vers le fichier chute_libre
# comparez les contenus de experience/chute_libre et projectile

cd ~
ln experience/chute_libre projectile
diff experience/chute_libre projectile # les fichiers sont identiques

# 3.notez les droits que vous avez actuellemnt sur le fichier ~/projectil. modifiez les droits pour avoir
# ces permissions: rw-r-----; quels sont les droits d'acces sur projectile?

ls -l projectile
chmod 640 experience/chute_libre
ls -l projectile # rw-r-----

# 4.supprimez le fichier experience/chute_libre puis consultez le contenu du fichier projectil. que constatez-vous?

rm experience/chute_libre
less projectil #projectil existe encore avce le meme contenu

# 5.apres avoir supprimez le fichier projectile refaites les question 1, 2 et 3 mais au lieu de faire un lien physique faites un lien symbolique

cd experience
vim chute_libre # ajouter un ligne
cd ~
ln -s experience/chute_libre projectile

# 6.quelle est la difference entre un lien physique et un lien symbolique?

# la différence entre un lien physique et un lien symbolique est que le lien physique pointe vers le fichier lui-même tandis que le lien symbolique pointe vers le chemin du fichier

# 7.faites un lien physique dans votre home directory avec le nom cherche qur /usr/bin/find. que se passe-t-il? 
# en deduire dans quel cas un lien physique ne peut pas etre cree? que faut il faire pour creer un lien physique dans ce cas?

ln /usr/bin/find cherche # erreur: Operation not permitted
# un lien physique ne peut pas être créé si l'utilisateur n'a pas les permissions nécessaires pour le fichier source
# pour créer un lien physique dans ce cas, il faut utiliser sudo
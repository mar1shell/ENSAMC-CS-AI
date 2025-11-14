# I - IMPORTATION DU FICHIER JSON

# 1 - Exportez le fichier restaurants.json dans une nouvelle base de données et dans une collection qui porte le  même nom « resto » 

# 2 - Interrogez cette collection afin de voir à quoi ressemble un document de la collection restaurants. Utilisez la méthode "findOne()". 

# 3 -  Dressez un schéma approximatif (MCD) de cette base de données.

# II -  FILTRER ET PROJETER LES DONNEES

# 1 - Récupérez les informations sur tous les restaurants dans le quartier (borough) de Manhattan. 

# 2 - Cherchez parmi ces restaurants ceux qui font de la cuisine Marocaine.

# 3 - Même chose, mais n'afficher que les noms des restaurants.

# 4 - Cherchez parmi les restaurants dans le quartier de Manhattan qui sont spécialisés dans les fruits de mer << Seafood >>.

# 5 - Récupérer les restaurants de cuisine << Italian >> dont le nom contient Pizza, qui ont des scores inférieurs à 10 et qui n'ont pas de score supérieur à 10.

# 6 - Chercher les restaurants qui ont un grade 'C' avec un score inférieur à 30.

# 7 - Chercher les noms et quartiers des restaurants dont la dernière inspection (la plus récente, donc la première de la liste) a donné un grade 'C'.

# III - DISTINCT

# 1 - Quels sont les différentes spécialités des restaurants de la ville de New York? 
# 2 - Quels sont les différents grades de notation des restaurants ?

# IV CREER UNE SEQUENCE D'OPERATIONS AVEC AGGREGATE

# 1 -  Reprendre la dernière requête find et la formuler avec la commande aggregate en utilisant les opérateurs $match et $project.

# 2 - Utliser des variables pour factoriser le filtre de la requête précédente (varMatch).

# 3 - A la suite de cette dernière requête, trier le résultat par nom de restaurant par ordre croissant en utilisant une varieble (varSort).

# 4 - Compter le nombre de ces restaurants (premier rang ayant pour valeur C).

# 5 - Compter par quartier le nombre de ces restaurants (qui toujours vérifient le filtre varMatch).

# 6 - Utiliser le même principe pour le regroupement par rapport à la spécialité de cuisine.

# 7 - Trouver le score moyen des restaurants par quartiers, et trier par score décroissant.
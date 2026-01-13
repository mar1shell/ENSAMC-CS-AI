# I - IMPORTATION DU FICHIER JSON

# 1 - Exportez le fichier restaurants.json dans une nouvelle base de données et dans une collection qui porte le  même nom « resto » 

mongoimport --db workshop2 --collection resto --file restaurants.json --jsonArray

# 2 - Interrogez cette collection afin de voir à quoi ressemble un document de la collection restaurants. Utilisez la méthode "findOne()". 

 {
  _id: ObjectId('692dca10f0f7a46afae289dc'),
  address: {
    building: '8825',
    coord: { type: 'Point', coordinates: [ -73.8803827, 40.7643124 ] },
    street: 'Astoria Boulevard',
    zipcode: '11369'
  },
  borough: 'Queens',
  cuisine: 'American ',
  grades: [
    {
      date: ISODate('2014-11-15T00:00:00.000Z'),
      grade: 'Z',
      score: 38
    },
    {
      date: ISODate('2014-05-02T00:00:00.000Z'),
      grade: 'A',
      score: 10
    },
    { date: ISODate('2013-03-02T00:00:00.000Z'), grade: 'A', score: 7 },
    {
      date: ISODate('2012-02-10T00:00:00.000Z'),
      grade: 'A',
      score: 13
    }
  ],
  name: 'Brunos On The Boulevard',
  restaurant_id: '40356151'
 }

# 3 -  Dressez un schéma approximatif (MCD) de cette base de données.

(Voir fichier MCD.png dans le répertoire Workshop-2)

# II -  FILTRER ET PROJETER LES DONNEES

# 1 - Récupérez les informations sur tous les restaurants dans le quartier (borough) de Manhattan.

db.resto.find({ borough: "Manhattan" })

# 2 - Cherchez parmi ces restaurants ceux qui font de la cuisine Marocaine.

db.resto.find({borough: "Manhattan", cuisine: "Moroccan"})

# 3 - Même chose, mais n'afficher que les noms des restaurants.

db.resto.find({borough: "Manhattan", cuisine: "Moroccan"}, {name: 1, _id: 0})

# 4 - Cherchez parmi les restaurants dans le quartier de Manhattan qui sont spécialisés dans les fruits de mer << Seafood >>.

db.resto.find({borough: "Manhattan", cuisine: "Seafood"})

# 5 - Récupérer les restaurants de cuisine << Italian >> dont le nom contient Pizza, qui ont des scores inférieurs à 10 et qui n'ont pas de score supérieur à 10.

db.resto.find({
  cuisine: "Italian",
  name: /Pizza/,
  "grades.score": { $not: { $gt: 10 } }
})

# 6 - Chercher les restaurants qui ont un grade 'C' avec un score inférieur à 30.

db.resto.find({
    grades: {
        $elemMatch: { grade: 'C', score: { $lt: 30 } }
    }
})

# 7 - Chercher les noms et quartiers des restaurants dont la dernière inspection (la plus récente, donc la première de la liste) a donné un grade 'C'.

db.resto.find(
  { "grades.0.grade": "C" },
  { name: 1, borough: 1, _id: 0 }
)

# III - DISTINCT

# 1 - Quels sont les différentes spécialités des restaurants de la ville de New York? 

db.resto.distinct("cuisine")

# 2 - Quels sont les différents grades de notation des restaurants ?

db.resto.distinct("grades.grade")

# IV CREER UNE SEQUENCE D'OPERATIONS AVEC AGGREGATE

# 1 -  Reprendre la dernière requête find et la formuler avec la commande aggregate en utilisant les opérateurs $match et $project.

db.resto.aggregate([
    {$match: {"grades.0.grade": "C"}},
    {$project: {name: 1, borough: 1, _id: 0}} 
])

# 2 - Utliser des variables pour factoriser le filtre de la requête précédente (varMatch).

var varMatch = {"grades.0.grade": "C"};

# 3 - A la suite de cette dernière requête, trier le résultat par nom de restaurant par ordre croissant en utilisant une varieble (varSort).

var varSort = {name: 1}

db.resto.aggregate([
    {$match: varMatch},
    {$project: {name: 1, borough: 1, _id: 0}},
    {$sort: varSort}
])

# 4 - Compter le nombre de ces restaurants (premier rang ayant pour valeur C).

db.resto.aggregate([
    {$match: varMatch},
    {$project: {name: 1, borough: 1, _id: 0}},
    {$sort: varSort},
    {$group: {_id: "$borough", total: {$sum: 1}}}
])

# 5 - Compter par quartier le nombre de ces restaurants (qui toujours vérifient le filtre varMatch).

db.resto.aggregate([
    {$match: varMatch},
    {$group: {_id: "$borough", total: {$sum: 1}}}
])

# 6 - Utiliser le même principe pour le regroupement par rapport à la spécialité de cuisine.

db.resto.aggregate([
    {$match: varMatch},
    {$group: {_id: "$cuisine", total: {$sum: 1}}}
])

# 7 - Trouver le score moyen des restaurants par quartiers, et trier par score décroissant.

db.resto.aggregate([
    {$unwind: "$grades"},
    {$group: {_id: "$borough", avgScore: {$avg: "$grades.score"}}},
    {$sort: {avgScore: -1}}
])
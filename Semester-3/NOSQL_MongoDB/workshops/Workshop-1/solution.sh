# 1 - Dans le prompt de MongoDB, interrogez le serveur pour connaître les BdD stockées dans le répertoire géré par le serveur :

show dbs

 admin   40.00 KiB
 config  48.00 KiB
 local   40.00 KiB

# 2 - Créer une base de données nommé DBLP:

use DBLP

switched to db DBLP

# 3 - lister de même les base de données

show dbs

 admin   40.00 KiB
 config  48.00 KiB
 local   40.00 KiB

# 4 - Créer une collection nommé publis:

db.createCollection("publis")

{ "ok" : 1 }

# 5 - lister les collections de la base DBLP:

show collections

 publis

# 6 - Insérer un document:

db.publis.insertOne({ 
  "type": "Book", 
  "title": "Modern Database Systems: The Object Model, Interoperability, and Beyond.", 
  "year": 1995, "publisher": "ACM Press and Addison-Wesley", 
  "authors": ["Won Kim"], 
  "source": "DBLP" 
})

 {
   acknowledged: true,
   insertedId: ObjectId('69122a56b3c1003867ce5f47')
 }

# 7 - Consulter le contenu de la collection publis:

db.publis.find()

 [
   {
     _id: ObjectId('69122a56b3c1003867ce5f47'),
     type: 'Book',
     title: 'Modern Database Systems: The Object Model, Interoperability, and Beyond.',
     year: 1995,
     publisher: 'ACM Press and Addison-Wesley',
     authors: [ 'Won Kim' ],
     source: 'DBLP'
   }
 ]

# 8 - importer le contenu du fichier dblp.json dans la collection publis:

# j'utilise un conteneur docker pour mongodb

sudo docker exec -it mongodb mongoimport --db DBLP --collection publis --drop --file /data/db/dblp.json --jsonArray

2025-11-10T18:18:21.746+0000	connected to: mongodb://localhost/
2025-11-10T18:18:21.746+0000	dropping: DBLP.publis
2025-11-10T18:18:21.752+0000	3 document(s) imported successfully. 0 document(s) failed to import.

# 9 - Exportez la collection publis dans un fichier qui portera le nom dblp1.json (option out).

sudo docker exec -it mongodb mongoexport --db DBLP --collection publis --out /data/db/dblp1.json

 2025-11-10T18:20:36.895+0000	connected to: mongodb://localhost/
 2025-11-10T18:20:36.896+0000	exported 3 records

# 10 - Exporter la collection publis dans un fichier qui portera le nom dblp2.csv. 

sudo docker exec -it mongodb mongoexport --db DBLP --collection publis --type=csv --out /data/db/dblp2.csv --fields type,title,year,publisher,authors,source

# 11 - Réimporter les documents du fichier dblp2.csv dans une nouvelle base testdblp et dans une nouvelle collection testpublis

sudo docker exec -it mongodb mongoimport --db testdblp --collection testpublis --drop --type=csv --file /data/db/dblp2.csv --headerline

 2025-11-10T18:24:53.474+0000	connected to: mongodb://localhost/
 2025-11-10T18:24:53.474+0000	dropping: testdblp.testpublis
 2025-11-10T18:24:53.481+0000	3 document(s) imported successfully. 0 document(s) failed to import.
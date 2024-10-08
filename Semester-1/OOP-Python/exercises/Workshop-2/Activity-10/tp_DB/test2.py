import sqlite3

db = sqlite3.connect('gestion.db')

# Création des tables

db.execute('CREATE TABLE IF NOT EXISTS formation (id INTEGER, titre TEXT)')
db.execute('CREATE TABLE IF NOT EXISTS etudiant (code INTEGER, nom TEXT, email TEXT)')

# Insertion des données

db.execute('INSERT INTO formation(id, titre) VALUES(1, "python")')
db.execute('INSERT INTO formation(id, titre) VALUES(2, "html")')

# insertions des données dans la table etudiant

db.execute('INSERT INTO etudiant(code, nom, email) VALUES(1, "youssef", "youssef@gmail.com")')
db.execute('INSERT INTO etudiant(code, nom, email) VALUES(2, "sara", "sara@gmail.com")')

# Affichage des données

db.row_factory = sqlite3.Row

print("#" * 20)
print("Affichage des formations")
print("#" * 20)

curor = db.execute('SELECT * FROM formation')

for row in curor:
    print(row['id'], row['titre'])

print("#" * 20)

print("#" * 20)
print("Affichage des étudiants")
print("#" * 20)

curor = db.execute('SELECT * FROM etudiant')

for row in curor:
    print(row['code'], row['nom'], row['email'])

print("#" * 20)


# Fonction pour insérer

def ins(v1, v2):
    db.execute('INSERT INTO formation(id, titre) VALUES(?, ?)', (v1, v2))
    db.commit()


# Fonction pour afficher

def afficher():
    print("#" * 20)
    print("Affichage des formations")
    print("#" * 20)

    curor = db.execute('SELECT * FROM formation')

    for row in curor:
        print(row['id'], row['titre'])

    print("#" * 20)

    print("#" * 20)
    print("Affichage des étudiants")
    print("#" * 20)

    curor = db.execute('SELECT * FROM etudiant')

    for row in curor:
        print(row['code'], row['nom'], row['email'])

    print("#" * 20)


# Fonction pour modifier

def modifier(v1, v2):
    db.execute('UPDATE formation SET titre = ? WHERE id = ?', (v2, v1))
    db.commit()


# Fonction pour supprimer

def supprimer(v1):
    db.execute('DELETE FROM formation WHERE id = ?', (v1,))
    db.commit()

# Test des Fonctions

ins(3, 'css')

afficher()

modifier(4, 'css')

supprimer(1)

db.commit()
db.close()
import sqlite3

db = sqlite3.connect('test.db')

db.execute("CREATE TABLE IF NOT EXISTS person(code INTEGER, name TEXT)")

db.execute("INSERT INTO person(code, name) VALUES (?, ?)", (10, "Karim"))

db.row_factory = sqlite3.Row

cursor = db.execute("SELECT * FROM person")
for row in cursor:
    print(row['code'], row['name'])

db.execute("INSERT INTO person(code, name) VALUES (?, ?)", (11, "Amal"))
db.execute("INSERT INTO person(code, name) VALUES (?, ?)", (12, "Reda"))

db.execute("DELETE FROM person WHERE code = 10")

db.execute("UPDATE person SET name = 'Radi' WHERE code = 12")

cursor = db.execute("SELECT * FROM person")
for row in cursor:
    print(row['code'], row['name'])

db.commit()
db.close()
"""

This file is another solution for exercise 3 using databases to store instances of objects.

This script demonstrates the creation and manipulation of a SQLite database to store information about vehicles and trucks. 
It includes the following functionalities:

1. Connect to a SQLite database and create tables for `Vehicule` and `Camion`.
2. Define a `Vehicule` class with methods to calculate the current price, display information, and save the instance to the database.
3. Define a `Camion` class that inherits from `Vehicule` and adds additional attributes and methods specific to trucks.
4. Create instances of `Vehicule` and `Camion`, calculate their current prices, save them to the database, and display their information.
5. Retrieve and display all records from the `Vehicule` and `Camion` tables in the database.

Classes:
    Vehicule: Represents a vehicle with attributes for purchase year and price, and methods to calculate current price, display information, and save to the database.
    Camion: Represents a truck, inheriting from `Vehicule`, with an additional attribute for volume and overridden methods for price calculation, display, and database saving.

Functions:
    None

Usage:
    Run the script to create the database, add vehicle and truck records, and display the stored information.
"""
# database

import sqlite3

conn = sqlite3.connect('vehicules.db')

conn.execute('''
CREATE TABLE IF NOT EXISTS Vehicule (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Annee_achat INTEGER,
    prix_achat REAL,
    prix_courant REAL
)
''')

conn.execute('''
CREATE TABLE IF NOT EXISTS Camion (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Annee_achat INTEGER,
    prix_achat REAL,
    prix_courant REAL,
    volume REAL
)
''')

conn.commit()
conn.close()

# Classes

class Vehicule:
    def __init__(self, Annee_achat, prix_achat):
        self.Annee_achat = Annee_achat
        self.prix_achat = prix_achat
    def Affiche(self):
        print("Année achat: ", self.Annee_achat, " Prix achat: ", self.prix_achat, " Prix courant: ", self.prix_courant, " Prix courant: ", self.prix_courant)
    def CalculePrix(self):
        self.prix_courant = (1.0 - ((2015 - self.Annee_achat) * 0.01) * self.prix_achat)
    def SaveToDB(self):
        conn = sqlite3.connect('vehicules.db')
        conn.execute('''
        INSERT INTO Vehicule (Annee_achat, prix_achat, prix_courant)
        VALUES (?, ?, ?)
        ''', (self.Annee_achat, self.prix_achat, self.prix_courant))
        conn.commit()
        conn.close()

class Camion(Vehicule):
    def __init__(self, Annee_achat, prix_achat, volume):
        super().__init__(Annee_achat, prix_achat)
        self.volume = volume
    def Affiche(self):
        super().Affiche()
        print("Volume: ", self.volume)
    def CalculePrix(self):
        self.prix_courant = (1.0 - (0.1 * self.volume / 1000)) * self.prix_achat
    def SaveToDB(self):
        conn = sqlite3.connect('vehicules.db')
        conn.execute('''
        INSERT INTO Camion (Annee_achat, prix_achat, prix_courant, volume)
        VALUES (?, ?, ?, ?)
        ''', (self.Annee_achat, self.prix_achat, self.prix_courant, self.volume))
        conn.commit()
        conn.close()

# Main

v1 = Vehicule(2014, 100000)

c1 = Camion(2018, 2000000, 80)
c2 = Camion(2020, 3000000,90)

v1.CalculePrix()
v1.SaveToDB()

c1.CalculePrix()
c1.SaveToDB()
c2.CalculePrix()
c2.SaveToDB()

print("#" * 20)
v1.Affiche()
print("#" * 20)

print("#" * 20)
c1.Affiche()
print("#" * 20)
c2.Affiche()
print("#" * 20)

# display Vehicule table

conn = sqlite3.connect('vehicules.db')
cursor = conn.execute('SELECT * FROM Vehicule')

for row in cursor:
    print(row)

# display Camion table

cursor = conn.execute('SELECT * FROM Camion')

for row in cursor:
    print(row)

conn.commit()
conn.close()
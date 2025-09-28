class Employe:
    def __init__(self, Identifiant, Nom, Prenom, DateNaissance, DateEmbauche, Salaire):
        self.__Identifiant = Identifiant
        self.__Nom = Nom
        self.__Prenom = Prenom
        self.__DateNaissance = DateNaissance
        self.__DateEmbauche = DateEmbauche
        self.__Salaire = Salaire
    def get_id(self):
        return self.__Identifiant
    def get_nom(self):
        return self.__Nom
    def get_prenom(self):
        return self.__Prenom
    def get_dateNai(self):
        return self.__DateNaissance
    def get_dateEmb(self):
        return self.__DateEmbauche
    def get_sal(self):
        return self.__Salaire
    # Pour la methode Age, on assume que la DateNaissance represente juste l'année de naissance, de meme pour DateEmbauche
    # Ainsi on assume que l'age est la difference entre l'année actuelle et l'année de naissance (AnnéeActuelle = 2024)
    def Age(self):
        return 2024 - self.__DateNaissance
    def Anciennete(self):
        return 2024 - self.__DateEmbauche
    # Pour faire des test, on implemente la methode afficher
    def afficher(self):
        print("\n########################################\n")
        print("Identifiant: ", self.__Identifiant)
        print("Nom: ", self.__Nom)
        print("Prenom: ", self.__Prenom)
        print("Date de Naissance: ", self.__DateNaissance)
        print("Date d'embauche: ", self.__DateEmbauche)
        print("Salaire: ", self.__Salaire)
        print("\n########################################\n")

########################## Test ##########################

# Employe 1
emp1 = Employe(1, "Doe", "John", 1990, 2010, 1000)
emp1.afficher()
print("Age: ", emp1.Age())
print("Anciennete: ", emp1.Anciennete())

# Employe 2
emp2 = Employe(2, "Doe", "Jane", 1995, 2015, 2000)
emp2.afficher()
print("Age: ", emp2.Age())
print("Anciennete: ", emp2.Anciennete())

# Employe 3
emp3 = Employe(3, "Doe", "Jack", 1985, 2005, 3000)
emp3.afficher()
print("Age: ", emp3.Age())
print("Anciennete: ", emp3.Anciennete())
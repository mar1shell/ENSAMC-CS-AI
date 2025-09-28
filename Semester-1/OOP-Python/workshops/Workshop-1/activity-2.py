class Etudiant:
    def __init__(self, nom, prenom, note):
        self.nom = nom
        self.prenom = prenom
        self.note = note
    def afficher(self):
        print("##################################################")
        print("Nom : ", self.nom, "Prenom : ", self.prenom, "Note : ", self.note)
        print("##################################################")

# Pour permettre de calculer la somme et la moyenne des notes des étudiants d'une promotion (plus de deux étudiants)
# on crée une classe Promotion qui contient une liste d'étudiants et qui permet d'ajouter un étudiant à la promotion,
# Donc calculer la somme des notes des étudiants de la promotion et la moyenne des notes de la promotion devient facile
# en utilisant les méthodes somme et moyenne de la classe Promotion et sans avoir à modifier la classe Etudiant ou ajouter de nouveau code
class Promotion:
    def __init__(self):
        self.etudiants = []
    def ajouter(self, etudiant : Etudiant):
        self.etudiants.append(etudiant)
    def somme(self):
        somme = 0
        for etudiant in self.etudiants:
            somme += etudiant.note
        return somme
    def moyenne(self):
        return self.somme() / len(self.etudiants)

#### Test ####

etudiant1 = Etudiant("Dupont", "Jean", 12)
etudiant2 = Etudiant("Durand", "Paul", 14)

etudiant1.afficher()
etudiant2.afficher()

promo = Promotion()
promo.ajouter(etudiant1)
promo.ajouter(etudiant2)

print("Somme des notes : ", promo.somme())
print("Moyenne des notes : ", promo.moyenne())
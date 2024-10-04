class Personne:
    def __init__(self, nom, adresse):
        self.nom = nom
        self.adresse = adresse
    def afficher(self):
        print("#" * 20)
        print("Nom:", self.nom)
        print("Adresse:", self.adresse)

class employe(Personne):
    def __init__(self, nom, adresse, cnss):
        super().__init__(nom, adresse)
        self.cnss = cnss
    def afficher(self):
        super().afficher()
        print("CNSS:", self.cnss)
        print("#" * 20)

class enseignant(Personne):
    def __init__(self, nom, adresse, cnops):
        super().__init__(nom, adresse)
        self.cnops = cnops
    def afficher(self):
        super().afficher()
        print("CNOPS:", self.cnops)
        print("#" * 20)

class etudiant(Personne):
    def __init__(self, nom, adresse, cne):
        super().__init__(nom, adresse)
        self.cne = cne
    def afficher(self):
        super().afficher()
        print("CNE:", self.cne)
        print("#" * 20)

#### Test ####

p = Personne("Ali", "Rabat")
p.afficher()

e = employe("Ahmed", "Casa", "123456")
e.afficher()

ens = enseignant("Khalid", "Tanger", "654321")
ens.afficher()

et = etudiant("Omar", "Fes", "987654")
et.afficher()
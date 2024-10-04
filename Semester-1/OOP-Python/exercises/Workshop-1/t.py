class Personne:
    def __init__(self, nom, adresse):
        self.nom = nom
        self.adresse = adresse
    def afficher(self):
        print("#" * 20)
        print("Nom:", self.nom)
        print("Adresse:", self.adresse)
        print("#" * 20)

class Employe(Personne):
    def __init__(self, nom, adresse, cnss):
        super().__init__(nom, adresse)  # Call parent class constructor
        self.cnss = cnss               # Initialize the 'cnss' attribute
    def afficher(self):
        super().afficher()             # Call the parent's 'afficher' method
        print("CNSS:", self.cnss)      # Display the 'cnss' attribute
        print("#" * 20)

# Test case
e = Employe("Ahmed", "Casa", "123456")
e.afficher()

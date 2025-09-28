class Vehicule:
    def __init__(self, Annee_achat, prix_achat):
        self.Annee_achat = Annee_achat
        self.prix_achat = prix_achat
    def Affiche(self):
        print("Année achat: ", self.Annee_achat, " Prix achat: ", self.prix_achat, " Prix courant: ", self.prix_courant, " Prix courant: ", self.prix_courant)
    def CalculePrix(self):
        self.prix_courant = (1.0 - ((2015 - self.Annee_achat) * 0.01) * self.prix_achat)

class Camion(Vehicule):
    def __init__(self, Annee_achat, prix_achat, volume):
        super().__init__(Annee_achat, prix_achat)
        self.volume = volume
    def Affiche(self):
        super().Affiche()
        print("Volume: ", self.volume)
    def CalculePrix(self):
        self.prix_courant = (1.0 - (0.1 * self.volume / 1000)) * self.prix_achat

# Main

v1 = Vehicule(2014, 100000)

c1 = Camion(2018, 2000000, 80)
c2 = Camion(2020, 3000000,90)

v1.CalculePrix()

c1.CalculePrix()
c2.CalculePrix()

print("#" * 20)
v1.Affiche()
print("#" * 20)

print("#" * 20)
c1.Affiche()
print("#" * 20)
c2.Affiche()
print("#" * 20)

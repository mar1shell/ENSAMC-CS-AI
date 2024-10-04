class voiture:
    def __init__(self, code, marque, kilometrage = 0):
        self.code = code
        self.marque = marque
        self.kilometrage = kilometrage
    def afficher(self):
        print("############################################")
        print("Code:", self.code)
        print("Marque:", self.marque)
        print("Kilometrage:", self.kilometrage)
        print("############################################")
    def mod_kilo(self, kilometrage):
        self.kilometrage += kilometrage

#### test ####

v1 = voiture(1, "Peugeot", 10000)
v2 = voiture(2, "Renault")
v1.afficher()
v2.afficher()
v1.mod_kilo(500)
v1.afficher()
v2.mod_kilo(1000)
v2.afficher()
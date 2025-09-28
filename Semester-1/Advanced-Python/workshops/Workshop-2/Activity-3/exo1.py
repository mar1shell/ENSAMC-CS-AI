# 1) Fonction som() qui calcule la somme de deux paramètres numériques
def som(a, b):
    return a + b

# 2) Ajouter une valeur par défaut au deuxième paramètre
def som(a, b=0):
    return a + b

# 3) Rendre le nombre de paramètres variable
def som(*args):
    return sum(args)

# 4) Ajouter un paramètre pour contrôler l'acceptation des valeurs négatives
def som(*args, negative=True):
    if not negative:
        args = [x for x in args if x >= 0]
    return sum(args)

# 5) Accepter n'importe quel mot-clé et afficher les valeurs des keywords reçus
def som(*args, negative=True, **kwargs):
    if not negative:
        args = [x for x in args if x >= 0]
    print("Keywords reçus :", kwargs)
    return sum(args)

# 6) Déclarer la liste l1
l1 = [13, 10, 2, 5, 1, 9]

# 7) Fonction select() qui retourne True si l'entier est supérieur à 10
def select(x):
    return x > 10

# 8) Utiliser filter() avec select() et stocker le résultat dans l2
l2 = list(filter(select, l1))

# 9) Utiliser une fonction lambda avec filter() et stocker le résultat dans l3
l3 = list(filter(lambda x: x > 10, l1))

# --- Tests ---
if __name__ == "__main__":
    print(som(1, 2))                        # 3
    print(som(4))                           # 4
    print(som(3, 5, 2))                     # 10
    print(som(1, -2, 3, negative=False))    # 4
    print(som(1, -2, 3, negative=True))     # 2
    print(som(1, 2, x=5, y=7))              # 3, affiche keywords
    print("l1:", l1)
    print("l2:", l2)                        # [13]
    print("l3:", l3)                        # [13]
# Question 1

# cas 1 : N = 21, M = 5

# Étapes de l'algorithme :
# 1. On commence avec N = 21 et M = 5.
# 2. Initialisation : resultat = 0.
# 3. Tant que N > 0, répétez les étapes suivantes :
#    - Si N % 2 = 1, on ajoute M à resultat.
#    - Divisez N par 2 et doublez M.

# Détails des itérations :
# - Première itération : 
#   N = 21, M = 5, N % 2 = 1, donc resultat = 0 + 5 = 5.
#   Divisez N par 2 : N = 10, doublez M : M = 10.

# - Deuxième itération : 
#   N = 10, M = 10, N % 2 = 0, rien n'est ajouté.
#   Divisez N par 2 : N = 5, doublez M : M = 20.

# - Troisième itération :
#   N = 5, M = 20, N % 2 = 1, donc resultat = 5 + 20 = 25.
#   Divisez N par 2 : N = 2, doublez M : M = 40.

# - Quatrième itération :
#   N = 2, M = 40, N % 2 = 0, rien n'est ajouté.
#   Divisez N par 2 : N = 1, doublez M : M = 80.

# - Cinquième itération :
#   N = 1, M = 80, N % 2 = 1, donc resultat = 25 + 80 = 105.
#   Divisez N par 2 : N = 0, doublez M : M = 160.

# Résultat : 21 * 5 = 105

# Cas 2 : N = 107, M = 3

# Étapes de l'algorithme :
# 1. On commence avec N = 107 et M = 3.
# 2. Initialisation : resultat = 0.
# 3. Tant que N > 0, répétez les étapes suivantes :
#    - Si N % 2 = 1, on ajoute M à resultat.
#    - Divisez N par 2 et doublez M.

# Détails des itérations :
# - Première itération : 
#   N = 107, M = 3, N % 2 = 1, donc resultat = 0 + 3 = 3.
#   Divisez N par 2 : N = 53, doublez M : M = 6.

# - Deuxième itération : 
#   N = 53, M = 6, N % 2 = 1, donc resultat = 3 + 6 = 9.
#   Divisez N par 2 : N = 26, doublez M : M = 12.

# - Troisième itération :
#   N = 26, M = 12, N % 2 = 0, rien n'est ajouté.
#   Divisez N par 2 : N = 13, doublez M : M = 24.

# - Quatrième itération :
#   N = 13, M = 24, N % 2 = 1, donc resultat = 9 + 24 = 33.
#   Divisez N par 2 : N = 6, doublez M : M = 48.

# - Cinquième itération :
#   N = 6, M = 48, N % 2 = 0, rien n'est ajouté.
#   Divisez N par 2 : N = 3, doublez M : M = 96.

# - Sixième itération :
#   N = 3, M = 96, N % 2 = 1, donc resultat = 33 + 96 = 129.
#   Divisez N par 2 : N = 1, doublez M : M = 192.

# - Septième itération :
#   N = 1, M = 192, N % 2 = 1, donc resultat = 129 + 192 = 321.
#   Divisez N par 2 : N = 0, doublez M : M = 384.

# Résultat : 107 * 3 = 321

# Cas 3 : N = 5, M = 21

# Étapes de l'algorithme :
# 1. On commence avec N = 5 et M = 21.
# 2. Initialisation : resultat = 0.
# 3. Tant que N > 0, répétez les étapes suivantes :
#    - Si N % 2 = 1, on ajoute M à resultat.
#    - Divisez N par 2 et doublez M.

# Détails des itérations :
# - Première itération : 
#   N = 5, M = 21, N % 2 = 1, donc resultat = 0 + 21 = 21.
#   Divisez N par 2 : N = 2, doublez M : M = 42.

# - Deuxième itération : 
#   N = 2, M = 42, N % 2 = 0, rien n'est ajouté.
#   Divisez N par 2 : N = 1, doublez M : M = 84.

# - Troisième itération :
#   N = 1, M = 84, N % 2 = 1, donc resultat = 21 + 84 = 105.
#   Divisez N par 2 : N = 0, doublez M : M = 168.

# Résultat : 5 * 21 = 105

# Question 2

def prod_shift_iter(n, m):
    """
    prod_shift_iter - Computes the product of two integers using iterative bit-shifting.
    @n: First integer (positive only).
    @m: Second integer (positive only).
    
    Description:
    This function implements multiplication using an iterative approach
    based on bit-shifting and addition, similar to the Russian Peasant Multiplication method.
    It doesn't handle negative inputs.
    
    Return:
    The product of n and m.
    """
    if n == 0 or m == 0:
        return 0

    result = 0

    while n > 1:
        if n % 2 == 1:
            result += m

        n //= 2
        m *= 2

    result += m

    return result

# Question 3

# La solution de multiplication par shifting (basée sur l'algorithme de multiplication binaire) repose sur le fait que nous divisons successivement l'un des facteurs (ici N) par 2 à chaque itération. Ce processus est également appelé la méthode des multiplications successives par 2.

# Analyse de la complexité :
# 1. Nombre de divisions par 2 :
#     - À chaque itération, le nombre N est divisé par 2 (c'est-à-dire qu'on fait une division entière N // 2).
#     - La division continue jusqu'à ce que N atteigne 1. 
#     - Le nombre d'itérations (ou divisions) est donc directement lié à la taille de N, c'est-à-dire à son nombre de bits.

# 2. Formule de la complexité :
#     - Le nombre d'itérations pour arriver de N à 1 est approximativement log2(N). En effet, chaque division par 2 réduit le nombre à moitié, donc le nombre total d'itérations est le logarithme binaire de N, arrondi à l'entier supérieur.

# Conclusion :
# La complexité en termes de divisions est donc O(log N). Cela signifie que le nombre de divisions nécessaires pour effectuer la multiplication par shifting est logarithmique par rapport à N. 
# Dans le pire des cas, il y aura environ log2(N) divisions pour chaque appel récursif ou itératif dans l'algorithme.

# Question 4

def prod_shift_rec(n, m):
    """
    prod_shift_rec - Computes the product of two integers using recursive bit-shifting.
    @n: First integer (positive only).
    @m: Second integer (positive only).
    Return:
    The product of n and m.
    """
    if n == 0 or m == 0:
        return 0

    if n <= 1:
        return m

    if n % 2 == 0:
        return prod_shift_rec(n // 2, m * 2)
    else:
        return m + prod_shift_rec(n // 2, m * 2)

# Test functions

if __name__ == "__main__":
    # Test iterative approach
    print(f"Product of 6 and 7: {prod_shift_iter(6, 7)}")  # 42
    print(f"Product of -6 and 7: {prod_shift_iter(-6, 7)}")  # -42
    print(f"Product of 6 and -7: {prod_shift_iter(6, -7)}")  # -42
    print(f"Product of -6 and -7: {prod_shift_iter(-6, -7)}")  # 42
    print(f"Product of 0 and 5: {prod_shift_iter(0, 5)}")  # 0
    
    # Test recursive approach
    print(f"Product of 6 and 7: {prod_shift_rec(6, 7)}")  # 42
    print(f"Product of 10 and 5: {prod_shift_rec(10, 5)}")  # 50
    print(f"Product of 7 and 13: {prod_shift_rec(7, 13)}")  # 91
    print(f"Product of 0 and 5: {prod_shift_rec(0, 5)}")  # 0
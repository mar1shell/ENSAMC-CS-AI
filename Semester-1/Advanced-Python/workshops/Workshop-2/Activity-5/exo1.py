import time

def cache(func):
    last_args = None
    last_result = None
    call_count = 0

    def wrapper(*args, **kwargs):
        nonlocal last_args, last_result, call_count
        call_count += 1
        print(f"Nombre d'appels: {call_count}")
        if args == last_args and kwargs == {}:
            print("Utilisation du cache.")
            return last_result
        start = time.time()
        result = func(*args, **kwargs)
        end = time.time()
        print(f"Temps d'exécution: {end - start:.6f} secondes")
        last_args = args
        last_result = result
        return result
    return wrapper

@cache
def fact(n):
    res = 1
    for i in range(2, n+1):
        res *= i
    print(f"Factorielle de {n} = {res}")
    return res

# Exemple d'utilisation
if __name__ == "__main__":
    fact(5)
    fact(5)  # Devrait utiliser le cache
    fact(6)
    fact(6)  # Devrait utiliser le cache
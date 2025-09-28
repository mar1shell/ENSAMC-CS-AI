# Programme Python pour effectuer plusieurs opérations sur des chaînes

def compter_mots(phrase):
    """Compte le nombre de mots dans une phrase."""
    mots = phrase.split()
    return len(mots)

def compter_majuscules(chaine):
    """Compte le nombre de lettres majuscules dans une chaîne."""
    return sum(1 for c in chaine if c.isupper())

def est_palindrome(chaine):
    """Vérifie si une chaîne est un palindrome."""
    chaine_sans_espace = ''.join(chaine.split()).lower()
    return chaine_sans_espace == chaine_sans_espace[::-1]

def inverser_mots(phrase):
    """Inverse l'ordre des mots dans une phrase."""
    mots = phrase.split()
    return ' '.join(mots[::-1])

if __name__ == "__main__":
    phrase = input("Entrez une phrase : ")
    print("Nombre de mots :", compter_mots(phrase))

    chaine = input("Entrez une chaîne : ")
    print("Nombre de lettres majuscules :", compter_majuscules(chaine))

    palindrome = input("Entrez une chaîne pour vérifier le palindrome : ")
    if est_palindrome(palindrome):
        print("La chaîne est un palindrome.")
    else:
        print("La chaîne n'est pas un palindrome.")

    phrase_a_inverser = input("Entrez une phrase à inverser : ")
    print("Phrase inversée :", inverser_mots(phrase_a_inverser))
def compress_string(s):
    if not s:
        return ""
    result = ""
    count = 1
    for i in range(1, len(s)):
        if s[i] == s[i-1]:
            count += 1
        else:
            result += s[i-1] + str(count)
            count = 1
    result += s[-1] + str(count)
    return result

# Exemple d'utilisation
chaine = "aabcccccaaa"
print(compress_string(chaine))  # Affiche : a2b1c5a3
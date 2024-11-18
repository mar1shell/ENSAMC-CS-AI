# Question 1

def positive_negative_arrays(arr):
    TPOS = []
    TNEG = []
    for num in arr:
        if num > 0:
            TPOS.append(num)
        elif num < 0:
            TNEG.append(num)
    return TPOS, TNEG

# Question 2

def som_chiff(n):
    result = 1
    n = abs(n)
    while n >= 10:
        n //= 10
        result += 1
    return result

# Question 2
def som_chiff_rec(n):
    n = abs(n)
    if n < 10:
        return 1
    return 1 + som_chiff_rec(n // 10)

# Question 3

def decal_lettre_chaine(ch, n):
    shift = n % len(ch)
    if shift == 0:
        return ch
    return ch[shift:] + ch[:shift]

# Question 4
def occurrences_rec(arr, e):
    if not arr:
        return 0
    return (1 if arr[0] == e else 0) + occurrences_rec(arr[1:], e)

# Question 5

# a

def sed(string):
    return string.lstrip()

# b

def sdr(string):
    if not string or string[0] != ' ':
        return string
    return sdr(string[1:])

# c

def sef(string):
    return string.rstrip()

# d

def sefr(string):
    if not string or string[-1] != ' ':
        return string
    return sefr(string[:-1])

# Question 6

def is_palindrome_rec(first, last):
    if first >= last:
        return True
    
    if first[0] != last[0]:
        return False
    
    return is_palindrome_rec(first[1:], last[:-1])

def is_palindrome(string):
    return is_palindrome_rec(string, string[::-1])

# Test the functions

if __name__ == "__main__":
    # Test 1: positive_negative_arrays
    arr = [1, -2, 3, -4, 5]
    pos, neg = positive_negative_arrays(arr)
    print("Positives:", pos)
    print("Negatives:", neg)

    # Test 2: Som_Chiff
    num = 12345
    print("Iterative sum of digits:", som_chiff(num))
    print("Recursive sum of digits:", som_chiff_rec(num))

    # Test 3: Decal_lettre_chaine
    str_example = "Hello"
    rotated = decal_lettre_chaine(str_example, 3)
    print("Rotated string:", rotated)

    # Test 4: OccurrencesRec
    arr2 = [1, 2, 2, 3, 2]
    print("Occurrences of 2:", occurrences_rec(arr2, 2))

    # Test 5: SED, SEDR, SEF, SEFR
    test_str = "  Hello World  "
    print("SED result:", sed(test_str))
    print("SEDR result:", sdr(test_str))
    print("SEF result:", sef(test_str))
    print("SEFR result:", sefr(test_str))

    # Test 6: isPalindrome
    palindrome = "madam"
    print("Is 'madam' palindrome?", "Yes" if is_palindrome(palindrome) else "No")
    non_palindrome = "hello"
    print("Is 'hello' palindrome?", "Yes" if is_palindrome(non_palindrome) else "No")
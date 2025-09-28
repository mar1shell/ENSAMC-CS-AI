#include "header.h"

/**
 * EXO 4 Solution in C
 * 
 * 1-Function to divide aray into two array (one with positives values the other with negetavie ones)
 * 
 * 2-a--Function to compute digits sum itteretavily;2-b--same function recursevily
 * 
 * 3-Function to rotate characters in a string
 * 
 * 4-Recursive function to compute occurances of an element i nan array
 * 
 * 5-4 functions: First removes spaces from the start of string;
 * Second removes them recursively
 * Third removes spaces from the end of the string
 * Last removes them recursively
 * 
 * 6-Recursive function to check if a string is a palindrome 
 */

// Question 1:

void positiveNegtativeArrays(int *T, int length, int *TPOS, int *TNEG) {
    /**
     * positiveNegtativeArrays - Function to divide array into two array 
     * (one with positives values the other with negetavie ones)
     * @T: input array
     * @TPOS: array to store strictly positive elements
     * @TNEG: array to store strictly negative elements
     * Return: void
     */
    
    for (int i = 0; i < length; i++) {
        if (T[i] > 0) {
            *TPOS = T[i];
            TPOS++;
        } else if (T[i] < 0) {
            *TNEG = T[i];
            TNEG++;
        }
    }

    *TPOS = 0; *TNEG = 0; // we assign the last elemnt of the arrays with 0 to point the end of arrays 
}

// Question 2:

int Som_Chiff(int n) {
    /**
     * Som_Chiff - Function to compute digits sum itteretively
     * @n: input integer
     * Return: sum of digits of n
     */

    int result = 1;
    n = (n >= 0) ? n : -n;

    while (n / 10) {
        n /= 10;
        result++;
    }

    return result;
}

int Som_Chiff_rec(int n) {
    /**
     * Som_Chiff - Function to compute digits sum recursively
     * @n: input integer
     * Return: sum of digits of n
     */

    n = (n >= 0) ? n : -n;

    if (n < 10) {
        return 1;
    }

    return 1 + Som_Chiff_rec(n / 10);
}

// Question 3

char *Decal_lettre_chaine(char *CH, int L, int n) {
    /**
     * Decal_lettre_chaine - Function to rotate charachters in a string
     * @CH: string to be rotated
     * @L: CH length
     * @n: shift value
     * Return: pointer to allocated memory of newly rotated string; must be freed in test
     */

    int shift = n % L; // Amount to rotate
    
    char *CHD = (char *) malloc(sizeof(char) * (L + 1));

    if (shift == 0) {
        strcpy(CHD, CH);

        return CHD;
    }


    for (int i = 0; i < L; i++) {
        CHD[i] = CH[(i + shift) % L];
    }

    CHD[L] = '\0';

    return CHD;
}

// Question 4

int occurancesRec(int *L, int length, int e) {
    /**
     * occurancesRec - Recursive function to compute occurances of an element e in an array L
     * @L: array
     * @length: length of array
     * @e: element to search for
     * Return: number of occurances of e in L
     */

    if (length <= 0) { // we reached the end of the array
        return 0;
    }

    // if we find the elemnt we add one and do a recursive call if not we add 0 and do the same thing
    return (*L == e) ? 1 + occurancesRec(L + 1, length - 1, e) : occurancesRec(L + 1, length - 1, e);
}

// Question 5

// a

char *SED(char *string, int length) {
    /**
     * SED - Removes leading spaces from a given string and returns a new string without those spaces.
     * @string: The original string from which leading spaces are to be removed.
     * @length: The length of the string, which is used to limit the number of characters considered.
     * 
     * This function scans the input string and skips over any leading spaces. It then allocates 
     * memory for a new string, copies the remaining characters (excluding leading spaces), 
     * and returns the newly formed string.
     * If the string consists entirely of spaces or if an allocation error occurs, 
     * it returns NULL.
     * 
     * Return: A new string with leading spaces removed, or NULL if the input is empty or memory allocation fails.
     *         newString must be free after using it
     */

    char *currentChar = string;

    while (*currentChar == ' ' && length > 0) {
        currentChar++;
        length--;
    }

    if (length <= 0) {
        return NULL;
    }

    char *newString = (char *) malloc(sizeof(char) * (length + 1));

    if (newString == NULL) {
        return NULL;
    }

    for (int i = 0; i < length; i++) {
        newString[i] = *currentChar++;
    }

    newString[length] = '\0';
    
    return newString;
}

// b

char *SEDR(char *string, int length) {
    /**
     * SEDR - Recursive implementation of SED
     * @string: The original string from which leading spaces are to be removed.
     * @length: The length of the string, which is used to limit the number of characters considered.
     * Return: A new string with leading spaces removed, or NULL if the input is empty or memory allocation fails.
     *         newString must be free after using it
     */
    if (string == NULL || *string == '\0') {
        return NULL;
    }

    if (*string != ' ') {
        char *newString = (char *) malloc(sizeof(char) * (length + 1));

        for (int i = 0; i < length; i++) {
            newString[i] = *string++;
        }

        newString[length] = '\0';

        return newString;
    }

    return SEDR(string + 1, length - 1);
}

// c

char *SEF(char *string, int length) {
    /**
     * SEF - Removes trailing spaces from a given string and returns a new string
     *       without those spaces.
     * @string: The original string from which trailing spaces are to be removed.
     * @length: The length of the string, which is used to limit the number of characters considered.
     * 
     * This function scans the input string from the end, skipping over any trailing spaces. 
     * It then allocates memory for a new string, copies the remaining characters (excluding 
     * trailing spaces), and returns the newly formed string.
     * 
     * If the string consists entirely of spaces or is empty, the function returns NULL.
     * Memory allocation failure also results in a return of NULL.
     * 
     * Return: A new string with trailing spaces removed, or NULL if:
     *         - The string consists only of spaces or is empty.
     *         - Memory allocation fails.
     */

    char *stringBegining = string;
    char *currentChar = string + length - 1;

    while (currentChar != stringBegining && *currentChar == ' ') {
        currentChar--;
        length--;
    }

    if (length <= 0) {
        return NULL;
    }

    char *newString = (char *) malloc(sizeof(char) * (length + 1));

    if (newString == NULL) {
        return NULL;
    }

    for (int i = 0; i < length; i++) {
        newString[i] = *stringBegining++;
    }

    newString[length] = '\0';

    return newString;
}

// d

char *SEFR(char *string, int length) {
    /**
     * SEF - Recursive implemantation of SEF
     *       without those spaces.
     * @string: The original string from which trailing spaces are to be removed.
     * @length: The length of the string, which is used to limit the number of characters considered.
     * Return: A new string with trailing spaces removed, or NULL if:
     *         - The string consists only of spaces or is empty.
     *         - Memory allocation fails.
     */

    if (string == NULL || *string == '\0') {
        return NULL;
    }

    char *currentEnd = string + length - 1;

    if (*currentEnd != ' ') {
        char *newString = (char *) malloc(sizeof(char) * (length + 1));

        for (int i = 0; i < length; i++) {
            newString[i] = *string++;
        }

        newString[length] = '\0';

        return newString;
    }

    return SEFR(string, length - 1);
}

// Question 6

int isPalindromeRec(char *first, char *last) {
    /**
     * isPalindromeRec - Recursive function to check if a string is a palindrome. 
     * @first: Pointer to the first character of the string.
     * @last: Pointer to the last character of the string.
     * Return: 
     * - TRUE (1) if the string is a palindrome (i.e., the characters are symmetrically equal).
     * - FALSE (0) if the string is not a palindrome (i.e., there is at least one mismatch).
     */
    if (first >= last) {
        return TRUE;
    }

    if (*first != *last) {
        return FALSE;
    }

    return isPalindromeRec(first + 1, last - 1);
}

// Function to initialise first and last for the recursive function

int isPalindrome(char *string) {
    int length = strlen(string);

    char *end = string + length - 1;

    return isPalindromeRec(string, end);
}

// Main function to test

int main() {
    // Test 1: positiveNegtativeArrays
    int arr[] = {1, -2, 3, -4, 5};
    int pos[6] = {0}; // Size 6 to store positives and a 0 at the end
    int neg[6] = {0}; // Size 6 to store negatives and a 0 at the end
    positiveNegtativeArrays(arr, 5, pos, neg);
    printf("Positives: ");
    for (int i = 0; pos[i] != 0; i++) {
        printf("%d ", pos[i]);
    }
    printf("\nNegatives: ");
    for (int i = 0; neg[i] != 0; i++) {
        printf("%d ", neg[i]);
    }
    printf("\n");

    // Test 2: Som_Chiff
    int num = 12345;
    printf("Iterative sum of digits: %d\n", Som_Chiff(num));
    printf("Recursive sum of digits: %d\n", Som_Chiff_rec(num));

    // Test 3: Decal_lettre_chaine
    char str[] = "Hello";
    char *rotated = Decal_lettre_chaine(str, strlen(str), 3);
    printf("Rotated string: %s\n", rotated);
    free(rotated);

    // Test 4: occurancesRec
    int arr2[] = {1, 2, 2, 3, 2};
    printf("Occurrences of 2: %d\n", occurancesRec(arr2, 5, 2));

    // Test 5: SED, SEDR, SEF, SEFR
    char testStr[] = "  Hello World  ";
    char *sed = SED(testStr, strlen(testStr));
    printf("SED result: '%s'\n", sed);
    free(sed);
    sed = SEDR(testStr, strlen(testStr));
    printf("SEDR result: '%s'\n", sed);
    free(sed);
    sed = SEF(testStr, strlen(testStr));
    printf("SEF result: '%s'\n", sed);
    free(sed);
    sed = SEFR(testStr, strlen(testStr));
    printf("SEFR result: '%s'\n", sed);
    free(sed);

    // Test 6: isPalindrome
    char palindrome[] = "madam";
    printf("Is 'madam' palindrome? %s\n", isPalindrome(palindrome) ? "Yes" : "No");

    char nonPalindrome[] = "hello";
    printf("Is 'hello' palindrome? %s\n", isPalindrome(nonPalindrome) ? "Yes" : "No");

    return 0;
}
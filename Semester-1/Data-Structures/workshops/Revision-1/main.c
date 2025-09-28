#include "library.h"

int main() 
{
    // test 1

    int n;

    printf("Donner un entier positif: ");
    scanf("%d", &n);
    printf("Factorielle de %d = %d\n", n, factorial(n));

    // test 2

    ETD E;

    strcpy(E.nom, "Ahmed");

    // test : Bloc d'instructions

    {
        int n; // n est une variable locale
    }

    return 0;
}
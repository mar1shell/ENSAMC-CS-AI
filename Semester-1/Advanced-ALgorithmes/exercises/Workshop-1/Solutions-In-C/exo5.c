#include "header.h"

int binomial(int n, int p) {
    /**
     * binomial - Computes the binomial coefficient C(n, p)
     * @n: Total number of items
     * @p: Number of items to choose
     * Return: The binomial coefficient C(n, p).
     */

    int result = 1;
    
    p = (p > n - p) ? n - p : p; //  we take advantage of the symetry of C(p, n) to reduce computations

    for (int i = 0; i < p; i++) {
        result *= (n - i);
        result /= (i + 1);
    }

    return result;
}

int TrPascal(int **MP, int N) {
    /**
     * TrPascal - Verifies if a matrix corresponds to Pascal's Triangle
     * @MP: A 2D matrix representing the triangle
     * @N: Number of rows in the matrix
     * Return: TRUE (1) if the matrix matches Pascal's Triangle, FALSE (0) otherwise.
     */

    for (int i = 0; i < N; i++) {
        for (int j = 0; j <= i; j++) {
            if (MP[i][j] != binomial(i, j)) {
                return FALSE;
            }
        }
    }

    return TRUE;
}

// Main function to test

int main() {
    // Test 1: Pascal's Triangle (Correct)

    int N = 5;
    int **MP = allocateMatrix(N);

    for (int i = 0; i < N; i++) {
        for (int j = 0; j <= i; j++) {
            MP[i][j] = binomial(i, j);
        }
    }

    printf("Pascal's Triangle Matrix (Correct):\n");
    printMatrix(MP, N);
    printf("Matches Pascal's Triangle? %s\n\n", TrPascal(MP, N) ? "TRUE" : "FALSE");
    freeMatrix(MP, N);

    // Test 2: Pascal's Triangle (Incorrect)

    int **incorrectMP = allocateMatrix(N);

    for (int i = 0; i < N; i++) {
        for (int j = 0; j <= i; j++) {
            incorrectMP[i][j] = binomial(i, j) + 1; // Introduce an error
        }
    }

    printf("Pascal's Triangle Matrix (Incorrect):\n");
    printMatrix(incorrectMP, N);
    printf("Matches Pascal's Triangle? %s\n\n", TrPascal(incorrectMP, N) ? "TRUE" : "FALSE");
    freeMatrix(incorrectMP, N);

    return 0;
}
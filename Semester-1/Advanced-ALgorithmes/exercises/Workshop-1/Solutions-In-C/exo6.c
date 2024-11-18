#include "header.h"

int ANTISYM(int **M, int N) {
    /**
     * ANTISYM - Checks if a square matrix is antisymmetric
     * @M: A 2D square matrix
     * @N: The size (number of rows/columns) of the matrix
     *
     * A matrix is antisymmetric if for every pair of indices (i, j), 
     * the element at position M[i][j] is equal to the negative of 
     * the element at M[j][i], i.e., M[i][j] = -M[j][i].
     *
     * Return: TRUE (1) if the matrix is antisymmetric, FALSE (0) otherwise.
     */

    for (int i = 0; i < N; i++) {
        for (int j = 0; j <= i; j++) {
            if (M[i][j] != -M[j][i]) {
                return FALSE;
            }
        }
    }
    return TRUE;
}

int DIAG(int **M, int N) {
    /**
     * DIAG - Checks if a square matrix is diagonal
     * @M: A 2D square matrix
     * @N: The size (number of rows/columns) of the matrix
     * Return: TRUE (1) if the matrix is diagonal, FALSE (0) otherwise.
     */

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (i != j && M[i][j] != 0) {
                return FALSE;
            }
        }
    }
    return TRUE;
}

int HANKEL(int **M, int N) {
    /**
     * HANKEL - Checks if a square matrix is a Hankel matrix
     * @M: A 2D square matrix
     * @N: The size (number of rows/columns) of the matrix
     *
     * A matrix is a Hankel matrix if all elements along each descending 
     * diagonal (from top-left to bottom-right) are the same, 
     * i.e., M[i][j] = M[i-1][j+1].
     *
     * Return: TRUE (1) if the matrix is a Hankel matrix, FALSE (0) otherwise.
     */

    for (int i = 1; i < N; i++) {
        for (int j = 0; j < N - 1; j++) {
            if (M[i][j] != M[i - 1][j + 1]) {
                return FALSE;
            }
        }
    }
    return TRUE;
}

// Main function to test

int main() {
    int N = 3;

    // Example 1: Test an antisymmetric matrix
    int **antisymMatrix = allocateMatrix(N);
    antisymMatrix[0][0] = 0;  antisymMatrix[0][1] = 2;   antisymMatrix[0][2] = -3;
    antisymMatrix[1][0] = -2; antisymMatrix[1][1] = 0;   antisymMatrix[1][2] = 4;
    antisymMatrix[2][0] = 3;  antisymMatrix[2][1] = -4;  antisymMatrix[2][2] = 0;

    printf("Antisymmetric Matrix:\n");
    printMatrix(antisymMatrix, N);
    printf("Is Antisymmetric? %s\n\n", ANTISYM(antisymMatrix, N) ? "TRUE" : "FALSE");

    // Example 2: Test a diagonal matrix
    int **diagMatrix = allocateMatrix(N);
    diagMatrix[0][0] = 5;  diagMatrix[0][1] = 0;  diagMatrix[0][2] = 0;
    diagMatrix[1][0] = 0;  diagMatrix[1][1] = 7;  diagMatrix[1][2] = 0;
    diagMatrix[2][0] = 0;  diagMatrix[2][1] = 0;  diagMatrix[2][2] = 9;

    printf("Diagonal Matrix:\n");
    printMatrix(diagMatrix, N);
    printf("Is Diagonal? %s\n\n", DIAG(diagMatrix, N) ? "TRUE" : "FALSE");

    // Example 3: Test a Hankel matrix
    int **hankelMatrix = allocateMatrix(N);
    hankelMatrix[0][0] = 1;  hankelMatrix[0][1] = 2;  hankelMatrix[0][2] = 3;
    hankelMatrix[1][0] = 2;  hankelMatrix[1][1] = 3;  hankelMatrix[1][2] = 4;
    hankelMatrix[2][0] = 3;  hankelMatrix[2][1] = 4;  hankelMatrix[2][2] = 5;

    printf("Hankel Matrix:\n");
    printMatrix(hankelMatrix, N);
    printf("Is Hankel? %s\n\n", HANKEL(hankelMatrix, N) ? "TRUE" : "FALSE");

    // Clean up
    freeMatrix(antisymMatrix, N);
    freeMatrix(diagMatrix, N);
    freeMatrix(hankelMatrix, N);

    return 0;
}
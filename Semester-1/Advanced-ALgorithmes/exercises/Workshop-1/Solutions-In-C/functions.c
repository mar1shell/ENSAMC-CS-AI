#include "header.h"

void printMatrix(int **M, int N) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            printf("%d ", M[i][j]);
        }
        printf("\n");
    }
}

int **allocateMatrix(int N) {
    int **M = (int **)malloc(N * sizeof(int *));
    for (int i = 0; i < N; i++) {
        M[i] = (int *)malloc(N * sizeof(int));
    }
    return M;
}

void freeMatrix(int **M, int N) {
    for (int i = 0; i < N; i++) {
        free(M[i]);
    }
    free(M);
}
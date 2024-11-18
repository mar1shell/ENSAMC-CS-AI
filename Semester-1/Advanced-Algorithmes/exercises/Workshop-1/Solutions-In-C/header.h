#ifndef HEADER_H
#define HEADER_H

// Include libraries

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

// Define macros

#define TRUE 1

#define FALSE 0

#define MAX_SENTENCES 100

#define MAX_LENGTH 200

#define MAX_TEXT_LENGTH 400

// functions.c

void printMatrix(int **M, int N);

int **allocateMatrix(int N);

void freeMatrix(int **M, int N);

#endif //HEADER_H
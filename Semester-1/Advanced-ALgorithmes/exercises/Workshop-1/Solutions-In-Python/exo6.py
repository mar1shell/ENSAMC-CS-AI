from functions import *

def ANTISYM(M, N):
    """
    ANTISYM - Checks if a square matrix is antisymmetric
    @M: A 2D square matrix
    @N: The size (number of rows/columns) of the matrix

    A matrix is antisymmetric if for every pair of indices (i, j), 
    the element at position M[i][j] is equal to the negative of 
    the element at M[j][i], i.e., M[i][j] = -M[j][i].

    Return: True if the matrix is antisymmetric, False otherwise.
    """

    for i in range(N):
        for j in range(i + 1):  # To avoid duplicate checks (i, j) and (j, i)
            if M[i][j] != -M[j][i]:
                return False
    return True


def DIAG(M, N):
    """
    DIAG - Checks if a square matrix is diagonal
    @M: A 2D square matrix
    @N: The size (number of rows/columns) of the matrix

    Return: True if the matrix is diagonal, False otherwise.
    """
    
    for i in range(N):
        for j in range(N):
            if i != j and M[i][j] != 0:
                return False
    return True


def HANKEL(M, N):
    """
    HANKEL - Checks if a square matrix is a Hankel matrix
    @M: A 2D square matrix
    @N: The size (number of rows/columns) of the matrix

    A matrix is a Hankel matrix if all elements along each descending 
    diagonal (from top-left to bottom-right) are the same, 
    i.e., M[i][j] = M[i-1][j+1].

    Return: True if the matrix is a Hankel matrix, False otherwise.
    """

    for i in range(1, N):
        for j in range(N - 1):
            if M[i][j] != M[i - 1][j + 1]:
                return False
    return True

# Main function to test

if __name__ == "__main__":
    N = 3

    # Example 1: Test an antisymmetric matrix
    antisymMatrix = allocate_matrix(N)
    antisymMatrix[0][0] = 0;  antisymMatrix[0][1] = 2;   antisymMatrix[0][2] = -3
    antisymMatrix[1][0] = -2; antisymMatrix[1][1] = 0;   antisymMatrix[1][2] = 4
    antisymMatrix[2][0] = 3;  antisymMatrix[2][1] = -4;  antisymMatrix[2][2] = 0

    print("Antisymmetric Matrix:")
    print_matrix(antisymMatrix)
    print("Is Antisymmetric? ", "TRUE" if ANTISYM(antisymMatrix, N) else "FALSE")
    print()

    # Example 2: Test a diagonal matrix
    diagMatrix = allocate_matrix(N)
    diagMatrix[0][0] = 5;  diagMatrix[0][1] = 0;  diagMatrix[0][2] = 0
    diagMatrix[1][0] = 0;  diagMatrix[1][1] = 7;  diagMatrix[1][2] = 0
    diagMatrix[2][0] = 0;  diagMatrix[2][1] = 0;  diagMatrix[2][2] = 9

    print("Diagonal Matrix:")
    print_matrix(diagMatrix)
    print("Is Diagonal? ", "TRUE" if DIAG(diagMatrix, N) else "FALSE")
    print()

    # Example 3: Test a Hankel matrix
    hankelMatrix = allocate_matrix(N)
    hankelMatrix[0][0] = 1;  hankelMatrix[0][1] = 2;  hankelMatrix[0][2] = 3
    hankelMatrix[1][0] = 2;  hankelMatrix[1][1] = 3;  hankelMatrix[1][2] = 4
    hankelMatrix[2][0] = 3;  hankelMatrix[2][1] = 4;  hankelMatrix[2][2] = 5

    print("Hankel Matrix:")
    print_matrix(hankelMatrix)
    print("Is Hankel? ", "TRUE" if HANKEL(hankelMatrix, N) else "FALSE")
    print()
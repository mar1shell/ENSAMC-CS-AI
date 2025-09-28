from functions import *

def binomial(n, p):
    """
    binomial - Computes the binomial coefficient C(n, p)
    n: Total number of items
    p: Number of items to choose
    Returns: The binomial coefficient C(n, p)
    """
    result = 1

    # We take advantage of the symmetry of C(p, n) to reduce computations
    p = min(p, n - p)

    for i in range(p):
        result *= (n - i)
        result //= (i + 1)

    return result


def tr_pascal(matrix, N):
    """
    tr_pascal - Verifies if a matrix corresponds to Pascal's Triangle
    matrix: A 2D matrix representing the triangle
    N: Number of rows in the matrix
    Returns: True if the matrix matches Pascal's Triangle, False otherwise.
    """
    for i in range(N):
        for j in range(i + 1):
            if matrix[i][j] != binomial(i, j):
                return False

    return True

if __name__ == "__main__":
    # Test 1: Pascal's Triangle (Correct)

    N = 5
    MP = allocate_triangle_matrix(N)

    for i in range(N):
        for j in range(i + 1):
            MP[i][j] = binomial(i, j)

    print("Pascal's Triangle Matrix (Correct):")
    print_matrix(MP)
    print("Matches Pascal's Triangle?", "TRUE" if tr_pascal(MP, N) else "FALSE")
    
    # Test 2: Pascal's Triangle (Incorrect)
    
    incorrectMP = allocate_triangle_matrix(N)

    for i in range(N):
        for j in range(i + 1):
            incorrectMP[i][j] = binomial(i, j) + 1  # Introduce an error

    print("\nPascal's Triangle Matrix (Incorrect):")
    print_matrix(incorrectMP)
    print("Matches Pascal's Triangle?", "TRUE" if tr_pascal(incorrectMP, N) else "FALSE")
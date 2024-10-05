# Determines if a cell (i, j) in the matrix can have a value of 1.
# The conditions are:
# 1. There should be no other 1s in the same row (i).
# 2. There should be no other 1s in the same column (j).
# 3. Additionally, the symmetric position (j, i) should also not contain 1.
def canHaveOne(matrix, i, j):
    # Check column j for any 1s
    for i2 in range(len(matrix)):
        if matrix[i2][j] == 1:
            return False
    # Check row i for any 1s
    for j2 in range(len(matrix[i])):
        if matrix[i][j2] == 1:
            return False
    # Check the symmetric position (j, i)
    if matrix[j][i] == 1:
        return False
    return True

# Checks if every row and every column in the matrix has at least one 1.
# If any row or column lacks a 1, the function returns False.
def hasOneInAllRowAndCol(matrix):
    for i in range(len(matrix)):
        hasColunmOne = False
        hasRowOne = False
        # Check the i-th row and column for at least one 1
        for j in range(len(matrix)):
            if matrix[i][j] == 1:
                hasRowOne = True
            if matrix[j][i] == 1:
                hasColunmOne = True
        # If either the row or column lacks a 1, return False
        if not hasColunmOne or not hasRowOne:
            return False
    return True

# Performs scalar multiplication (dot product) of two matrices A and B.
# It returns the sum of the products of corresponding elements.
def scalarMultiply(A, B):
    C = 0
    # Iterate through each element in matrices A and B
    for i in range(len(A)):
        for j in range(len(A[i])):
            C += A[i][j] * B[i][j]
    return C

# Generates all possible matrices by filling in the None values with either 0 or 1.
# It ensures that the final matrix has at least one 1 in every row and column.
def allPossiblePaths(matrix):
    for i in range(len(matrix)):
        for j in range(len(matrix[i])):
            if matrix[i][j] is None:  # Find an empty cell
                # Create a copy of the matrix with the current empty cell filled with 0
                A1 = [row[:] for row in matrix]
                A1[i][j] = 0
                result = allPossiblePaths(A1)
                
                # Check if we can place a 1 in this position
                if canHaveOne(matrix, i, j):
                    A2 = [row[:] for row in matrix]
                    A2[i][j] = 1
                    result.extend(allPossiblePaths(A2))
                return result
    # If matrix is completely filled, check if it satisfies the condition
    if hasOneInAllRowAndCol(matrix):
        return [matrix]
    return []

# Solves the "Voyage Redondance" problem by finding the matrix path that minimizes
# the scalar product with the matrix A. It prints the path with the minimum scalar product.
def solveVoyageRedondance(A):
    # Initialize the matrix with diagonal elements as 0 and other elements as None
    matrix = [[0 if i == j else None for j in range(len(A[i]))] for i in range(len(A))]
    
    # Find all possible paths by filling the matrix
    all_paths = allPossiblePaths(matrix)
    
    if len(all_paths) == 0:
        print('No possible path')
        return
    
    # Initialize with the scalar product of the first possible path
    min_scalar = scalarMultiply(A, all_paths[0])
    minPath = all_paths[0]
    
    # Find the path with the minimum scalar product
    for i in range(1, len(all_paths)):
        mult2 = scalarMultiply(A, all_paths[i])
        if min_scalar > mult2:
            min_scalar = mult2
            minPath = all_paths[i]
    
    # Print the results
    print('-' * 10)
    print('MIN: ', min_scalar)
    print('-' * 10)
    for row in minPath:
        print(row)
    print('-' * 10)

##### TESTING #####

# Principal matrix example (RO - Exercise - Chapter 1)

A1 = [
    [0, 30, 38, 73],
    [30, 0, 18, 53],
    [38, 18, 0, 51],
    [73, 53, 51, 0]
]

solveVoyageRedondance(A1)

# 4x4 matrix example

A2 = [
    [0, 10, 15, 20],
    [10, 0, 35, 25],
    [15, 35, 0, 30],
    [20, 25, 30, 0]
]

solveVoyageRedondance(A2)

# 5x5 matrix example

A3 = [
    [0, 30, 38, 73, 15],
    [30, 0, 18, 53, 54],
    [38, 18, 0, 51, 33],
    [73, 53, 51, 0, 22],
    [15, 54, 33, 22, 0]
]

solveVoyageRedondance(A3)
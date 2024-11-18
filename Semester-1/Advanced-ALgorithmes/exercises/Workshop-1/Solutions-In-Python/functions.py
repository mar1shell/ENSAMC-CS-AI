def print_matrix(matrix):
    """Helper function to print the matrix."""
    for row in matrix:
        print(" ".join(map(str, row)))

# Function to allocate a matrix with size N
def allocate_matrix(N):
    return [[0 for _ in range(N)] for _ in range(N)]

def allocate_triangle_matrix(N):
    """Helper function to allocate a matrix with N rows and appropriate columns."""
    return [[0] * (i + 1) for i in range(N)]
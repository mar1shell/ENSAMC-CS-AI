# Problem: Optimal University Visit

## Description
A student is planning a trip to visit the campuses of three universities, located in the cities of A, B, and C. The trip starts and ends at an airport located in city P. The student must visit each city exactly once, and the goal is to minimize the total travel distance.

The given distances between the cities and the airport are represented in a distance matrix. The objective is to find the shortest possible route that allows the student to visit all three campuses and return to the starting point at the airport P.

**Authors**: [mar1shell](https://github.com/mar1shell), [rabraghib](https://github.com/rabraghib)

## Generalization
The solution can be generalized for \( n \) cities. The mathematical modeling of the problem is as follows:

$$
\text{min} \sum_{i=1}^{4} \sum_{j=1}^{4} x_{i,j} a_{i,j}
$$

$$
x_{i,j} \in \{0, 1\}, \quad i = 1, \ldots, 4, \quad j = 1, \ldots, 4.
$$

$$
x_{i,i} = 0, \quad i = 1, \ldots, 4.
$$

$$
\sum_{i=1}^{4} x_{i,j} = 1, \quad j = 1, \ldots, 4.
$$

$$
\sum_{j=1}^{4} x_{i,j} = 1, \quad i = 1, \ldots, 4.
$$

$$
x_{i,j} + x_{j,i} \leq 1, \quad i = 1, \ldots, 4, \quad j = 1, \ldots, 4.
$$

Where $$\( x_{i,j} \)$$ represents the possible paths from city to city (which can be either 1 or 0).

## Approach
1. The problem can be viewed as a variation of the Traveling Salesman Problem (TSP), where the goal is to find the shortest route visiting all the cities.

2. We will compute all possible routes the student can take to visit cities A, B, C, and others up to \( n \), and return to P, and then select the route with the minimum total distance.

## Functions
- `canHaveOne(matrix, i, j)`: Determines if the cell (i, j) in the matrix can have a value of 1 based on the row, column, and diagonal conditions.
- `hasOneInAllRowAndCol(matrix)`: Ensures that every row and column in the matrix has at least one 1.
- `scalarMultiply(A, B)`: Computes the scalar (dot) product between two matrices A and B.
- `allPossiblePaths(matrix)`: Generates all valid paths by filling the matrix and checks for row and column validity.
- `solveVoyageRedondance(A)`: Finds the optimal path for the student, minimizing the total distance and displaying the best route.

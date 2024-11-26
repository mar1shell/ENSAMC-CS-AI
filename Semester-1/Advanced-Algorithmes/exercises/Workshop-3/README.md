# Workshop 3: Advanced Algorithms - Quick Sort & Quick Select

## Description
This workshop focuses on two essential algorithms in sorting and selection problems:
1. **Quick Sort**: A divide-and-conquer sorting algorithm.
2. **Quick Select**: An algorithm to find the \(k\)-th smallest element in an unsorted list.

## Structure
The workshop is divided into the following components:

### 1. **Exercise 1: Quick Sort Iterations**  
- **File**: `exo1.txt`  
- **Objective**: Perform manual iterations of the Quick Sort algorithm on a given array using the Lomuto partition scheme.

### 2. **Exercise 2: Quick Sort Implementation**  
- **File**: `workshop.ipynb`  
- **Objective**: Implement Quick Sort in Python to sort an array.  
- **Focus**: Code optimization and understanding the recursive structure of the algorithm.

### 3. **Exercise 3: Quick Select Implementation**  
- **File**: `workshop.ipynb`  
- **Objective**: Implement Quick Select in Python to find the \(k\)-th smallest element in an array.  
- **Focus**: Efficient selection with partial sorting.

### 4. **Documentation**  
- **File**: `algo TP3.pdf`  
- **Language**: French  
- **Contents**: Detailed descriptions of the algorithms, their complexities, and the exercises.

## Algorithms Covered

### Quick Sort
- **Algorithm**: Recursively partitions the array into subarrays around a pivot, sorting each subarray.
- **Complexity**:
  - **Best/Average Case**: \(O(n \log n)\)
  - **Worst Case**: \(O(n^2)\) (occurs when the pivot is poorly chosen)
- **In-place**: Yes

### Quick Select
- **Algorithm**: Uses the partitioning logic of Quick Sort to focus on the desired \(k\)-th element.
- **Complexity**:
  - **Average Case**: $O(n)$
  - **Worst Case**: $O(n^2)$ (similar to Quick Sort with a poor pivot choice)
- **In-place**: Yes

## Files Overview
- `exo1.txt`: Contains manual steps for Quick Sort iterations.
- `workshop.ipynb`: Jupyter Notebook with Python implementations for Quick Sort and Quick Select.
- `algo TP3.pdf`: French PDF explaining the workshop, algorithms, and exercises.
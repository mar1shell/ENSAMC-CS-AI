# Insertion Sort

## Introduction
Insertion Sort is a simple and intuitive comparison-based sorting algorithm. It builds the final sorted array one item at a time, with the benefit of being efficient for small data sets or nearly sorted data.

## How It Works
1. Start with the second element (index 1) of the array.
2. Compare the current element with the previous elements.
3. Shift all elements greater than the current element to the right.
4. Insert the current element into its correct position.
5. Repeat steps 2-4 for all elements in the array.

## Pseudocode
```markdown
for i from 1 to length(A) - 1:
    key = A[i]
    j = i - 1
    while j >= 0 and A[j] > key:
        A[j + 1] = A[j]
        j = j - 1
    A[j + 1] = key
```

## Time Complexity
- **Best Case:** O(n) - when the array is already sorted.
- **Average Case:** O(n^2)
- **Worst Case:** O(n^2) - when the array is sorted in reverse order.

## Space Complexity
- **Space Complexity:** O(1) - Insertion Sort is an in-place sorting algorithm.

## Advantages
- Simple to implement
- Efficient for small data sets or nearly sorted data

## Folder Structure
The folder structure for the Insertion Sort project is as follows:

```
/Insertion_Sort/
├── README.md
├── Insertion_Sort.c
├── Functions.h
└── main.c
```
- `README.md`: Contains the documentation for the Insertion Sort algorithm.
- `Insertion_Sort.c`: Contains the implementation of the Insertion Sort algorithm.
- `Functions.h`: Contains the function declarations used in the project.
- `main.c`: Contains the main function to run the Insertion Sort algorithm.
```
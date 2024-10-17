# Quick Sort

Quick Sort is a highly efficient sorting algorithm and is based on the divide-and-conquer approach. It works by selecting a 'pivot' element from the array and partitioning the other elements into two sub-arrays, according to whether they are less than or greater than the pivot. The sub-arrays are then sorted recursively.

## How Quick Sort Works

1. **Choose a Pivot**: Select an element from the array to be the pivot.
2. **Partitioning**: Rearrange the array so that all elements with values less than the pivot come before it, and all elements with values greater than the pivot come after it.
3. **Recursively Apply**: Apply the above steps recursively to the sub-arrays of elements with smaller and larger values.

## Pseudocode

```markdown
function quicksort(arr, low, high):
    if low < high:
        pi = partition(arr, low, high)
        quicksort(arr, low, pi - 1)
        quicksort(arr, pi + 1, high)

function partition(arr, low, high):
    pivot = arr[high]
    i = low - 1
    for j = low to high - 1:
        if arr[j] < pivot:
            i = i + 1
            swap arr[i] with arr[j]
    swap arr[i + 1] with arr[high]
    return i + 1
```

## Time Complexity

- **Best Case**: O(n log n)
- **Average Case**: O(n log n)
- **Worst Case**: O(n^2)

## Space Complexity

- **O(log n)** due to the recursive stack.

## Advantages

- Efficient for large datasets.
- In-place sorting algorithm (requires only a small, constant amount of additional storage space).

## Disadvantages

- Not stable (relative order of equal sort items is not preserved).
- Worst-case performance is poor without randomization.

## Applications

- Used in various libraries and frameworks.
- Suitable for large datasets where average performance is crucial.

## References

- [Wikipedia: Quick Sort](https://en.wikipedia.org/wiki/Quicksort)
- [GeeksforGeeks: Quick Sort](https://www.geeksforgeeks.org/quick-sort/)

## Folder Structure

The `Quick_Sort/` folder contains the following files:

- **README.md**: This file, which provides an overview of the Quick Sort algorithm, including its working, pseudocode, time and space complexity, advantages, disadvantages, and applications.
- **functions.h**: Header file containing function declarations for the Quick Sort implementation in C.
- **Quick_Sort.c**: C file containing the implementation of the Quick Sort algorithm.
- **main.c**: C file containing the main function to execute the Quick Sort algorithm.
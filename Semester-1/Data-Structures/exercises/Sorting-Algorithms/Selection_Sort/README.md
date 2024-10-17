# Selection Sort

Selection Sort is a simple comparison-based sorting algorithm. It works by dividing the input list into two parts: the sublist of items already sorted, which is built up from left to right at the front (left) of the list, and the sublist of items remaining to be sorted that occupy the rest of the list. Initially, the sorted sublist is empty, and the unsorted sublist is the entire input list. The algorithm proceeds by finding the smallest (or largest, depending on the sorting order) element in the unsorted sublist, exchanging it with the leftmost unsorted element (putting it in sorted order), and moving the sublist boundaries one element to the right.

## Algorithm Steps

1. Start with the first element as the minimum.
2. Compare this minimum with the second element. If the second element is smaller, update the minimum.
3. Continue this process for the entire list.
4. Swap the minimum element with the first element.
5. Move to the next element and repeat the process until the entire list is sorted.

## Pseudocode

```
for i = 0 to n-1
    minIndex = i
    for j = i+1 to n
        if array[j] < array[minIndex]
            minIndex = j
    swap array[minIndex] with array[i]
```

## Time Complexity

- Best Case: O(n^2)
- Average Case: O(n^2)
- Worst Case: O(n^2)

## Space Complexity

- O(1) - Selection Sort is an in-place sorting algorithm.

## Folder Structure

```
Selection_Sort/
├── README.md
├── Selection_Sort.c
├── main.c
└── Functions.h
```

- `README.md`: This file.
- `Selection_Sort.c`: Implementation of the Selection Sort algorithm.
- `main.c`: Main executable script.
- `Functions.h`: Header file containing function declarations.
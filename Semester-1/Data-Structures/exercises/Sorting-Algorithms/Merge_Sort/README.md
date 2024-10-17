# Merge Sort

Merge Sort is a divide-and-conquer algorithm that splits an array into smaller sub-arrays, sorts them, and then merges them back together.

## How Merge Sort Works

1. **Divide**: Split the array into two halves.
2. **Conquer**: Recursively sort each half.
3. **Combine**: Merge the two sorted halves into a single sorted array.

## Pseudocode

```markdown
function mergeSort(array):
    if length of array <= 1:
        return array
    middle = length of array / 2
    left = mergeSort(array[0:middle])
    right = mergeSort(array[middle:end])
    return merge(left, right)

function merge(left, right):
    result = []
    while left and right are not empty:
        if left[0] <= right[0]:
            append left[0] to result
            remove left[0] from left
        else:
            append right[0] to result
            remove right[0] from right
    append remaining elements of left to result
    append remaining elements of right to result
    return result
```

## Time Complexity

- **Best Case**: O(n log n)
- **Average Case**: O(n log n)
- **Worst Case**: O(n log n)

## Space Complexity

- **O(n)**

## Advantages

- Stable sort
- Predictable O(n log n) time complexity

## Disadvantages

- Requires additional memory proportional to the size of the input array

## Example

```python
def merge_sort(array):
    if len(array) <= 1:
        return array
    mid = len(array) // 2
    left = merge_sort(array[:mid])
    right = merge_sort(array[mid:])
    return merge(left, right)

def merge(left, right):
    result = []
    while left and right:
        if left[0] <= right[0]:
            result.append(left.pop(0))
        else:
            result.append(right.pop(0))
    result.extend(left or right)
    return result

# Example usage
array = [38, 27, 43, 3, 9, 82, 10]
sorted_array = merge_sort(array)
print(sorted_array)
```

## References

- [Wikipedia: Merge Sort](https://en.wikipedia.org/wiki/Merge_sort)
- [GeeksforGeeks: Merge Sort](https://www.geeksforgeeks.org/merge-sort/)

## Folder Structure

```
Merge_Sort/
├── Merge_Sort.c
├── main.c
├── Functions.h
└── README.md
```

- `Merge_Sort.c`: Contains the implementation of the merge sort algorithm.
- `main.c`: Contains the main function to test the merge sort implementation.
- `Functions.h`: Header file with function declarations.
- `README.md`: Documentation file.
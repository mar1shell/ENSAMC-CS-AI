import random
import time
import math
import matplotlib.pyplot as plt

def merge(A: list, first, mid, last):
    # Create temporary arrays I and J
    I = A[first:mid + 1]
    J = A[mid + 1: last + 1]
    n = mid - first + 1 # I length
    m = last - mid # J Length
    i = j = k = 0 # i, j, k are the indexes of I, J and A respectively

    # Merge the temporary arrays back into A[first..last]
    while i < n and j < m:
        if I[i] <= J[j]:
            A[first + k] = I[i]
            i += 1
        else:
            A[first + k] = J[j]
            j += 1
        k += 1

    # Copy the remaining elements of I[], if any
    while i < n:
        A[first + k] = I[i]
        i += 1
        k += 1

    # Copy the remaining elements of J[], if any
    while j < m:
        A[first + k] = J[j]
        j += 1
        k += 1

def mergeSortRec(A: list, first, last):
    if (first < last):
        mid = first + (last - first) // 2

        # Recursively sort first and second halves
        mergeSortRec(A, first, mid)
        mergeSortRec(A, mid + 1, last)

        # Merge the sorted halves
        merge(A, first, mid, last)
    

def mergeSort(A: list):
    # Call the recursive merge sort function
    mergeSortRec(A, 0, len(A) - 1)

# Measure execution time for different input sizes
input_sizes = [10, 10000, 30000, 50000, 70000,100000]
execution_times = []

for size in input_sizes:
    random_list = [random.randint(-100, 100) for _ in range(size)]
    start_time = time.time()
    mergeSort(random_list)
    end_time = time.time()
    execution_times.append(end_time - start_time)

# Calculate execution time / n, execution time / (n log(n)), and execution time / log(n)
execution_time_per_n = [t / n for t, n in zip(execution_times, input_sizes)]
execution_time_per_nlogn = [t / (n * math.log(n)) for t, n in zip(execution_times, input_sizes)]
execution_time_per_n2 = [t / n ** 2 for t, n in zip(execution_times, input_sizes)]

# Plot the results
plt.figure(figsize=(10, 6))

plt.plot(input_sizes, execution_time_per_n, marker='o', label='Execution Time / n')
plt.plot(input_sizes, execution_time_per_nlogn, marker='o', label='Execution Time / (n log(n))')
plt.plot(input_sizes, execution_time_per_n2, marker='o', label='Execution Time / n^2')


plt.xlabel('Input Size')
plt.ylabel('Time (seconds)')
plt.title('Merge Sort Execution Time Analysis')
plt.legend()
plt.grid(True)
plt.show()
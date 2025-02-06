import random
import time

# Heapify function for max-heap
def max_heapify(arr, n, i):
    largest = i
    left = 2 * i + 1
    right = 2 * i + 2

    if left < n and arr[left] > arr[largest]:
        largest = left
    if right < n and arr[right] > arr[largest]:
        largest = right

    if largest != i:
        arr[i], arr[largest] = arr[largest], arr[i]
        max_heapify(arr, n, largest)

# Heapify function for min-heap
def min_heapify(arr, n, i):
    smallest = i
    left = 2 * i + 1
    right = 2 * i + 2

    if left < n and arr[left] < arr[smallest]:
        smallest = left
    if right < n and arr[right] < arr[smallest]:
        smallest = right

    if smallest != i:
        arr[i], arr[smallest] = arr[smallest], arr[i]
        min_heapify(arr, n, smallest)

# Build heap
def build_heap(arr, heapify_func):
    n = len(arr)
    for i in range(n // 2 - 1, -1, -1):
        heapify_func(arr, n, i)

# Heap sort
def heap_sort(arr, heapify_func):
    n = len(arr)
    build_heap(arr, heapify_func)
    for i in range(n - 1, 0, -1):
        arr[0], arr[i] = arr[i], arr[0]  # Move root to end
        heapify_func(arr, i, 0)

# Measure execution time and complexity
def measure_execution(n_values):
    results = {"max_heap": [], "min_heap": []}
    for n in n_values:
        arr = [random.randint(0, 1000) for _ in range(n)]
        
        # Max heap
        max_arr = arr.copy()
        start = time.time()
        build_heap(max_arr, max_heapify)
        max_heapify_time = time.time() - start

        start = time.time()
        heap_sort(max_arr, max_heapify)
        max_sort_time = time.time() - start
        results["max_heap"].append((n, max_heapify_time, max_sort_time))

        # Min heap
        min_arr = arr.copy()
        start = time.time()
        build_heap(min_arr, min_heapify)
        min_heapify_time = time.time() - start

        start = time.time()
        heap_sort(min_arr, min_heapify)
        min_sort_time = time.time() - start
        results["min_heap"].append((n, min_heapify_time, min_sort_time))

    return results

# Test for varying n values
n_values = [10, 100, 1000, 5000, 10000]
results = measure_execution(n_values)

# Display results
print("Results for Max Heap:")
for n, heapify_time, sort_time in results["max_heap"]:
    print(f"n={n}, Heapify Time: {heapify_time:.6f}s, Sort Time: {sort_time:.6f}s")

print("\nResults for Min Heap:")
for n, heapify_time, sort_time in results["min_heap"]:
    print(f"n={n}, Heapify Time: {heapify_time:.6f}s, Sort Time: {sort_time:.6f}s")
def process_data(numbers, *operations, **kwargs):
    precision = kwargs.get('precision', 2)
    prefix = kwargs.get('prefix', '')
    suffix = kwargs.get('suffix', '')

    # Apply operations sequentially using map and lambdas
    result = numbers
    for op in operations:
        result = list(map(op, result))

    # Filter out negative values
    result = list(filter(lambda x: x >= 0, result))

    # Format results
    formatted = [
        f"{prefix}{format(x, f'.{precision}f')}{suffix}"
        for x in result
    ]
    return formatted

# Example usage:

ops = [lambda x: x*2, lambda x: x+3]
print(process_data([1, 2, 3], *ops, precision=1, suffix='€'))
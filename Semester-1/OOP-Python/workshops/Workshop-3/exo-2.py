def findMaxRow(rows):
    """
    Calculates the maximum value for the top row of the upside-down triangle.

    Args:
        rows: The number of rows in the triangle.

    Returns:
        The maximum value for the top row.
    """
    if rows == 1:
        return 1
    return findMaxRow(rows - 1) + rows

def upsideDownTriangle(rows: int) -> None:
    """
    Prints an upside-down triangle pattern of numbers.

    Args:
        rows: The number of rows in the triangle.
    """
    k = findMaxRow(rows)
    for i in range(rows):
        for j in range(rows - i):
            print(k , end=" ")
            k -= 1
        print()

# Test

print("#" * 20)
upsideDownTriangle(4)

print("#" * 20)
upsideDownTriangle(5)
print("#" * 20)
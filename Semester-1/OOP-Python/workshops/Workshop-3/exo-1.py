# initial

n = int(2.0)
p = float(5)

# A

q = n < p
print(q)  # Result is True

# B

q = n == p
print(q)  # Result is False

# C

q = p % n + p > n
print(q)  # Result is 2

# D

x = int(p / n)
print(x)  # Result is 2

# E

x = (float)(p / n)
print(x) # Result is 2.5

# F

x = (int) (p + 0.5) / n
print(x) # Result is 2.5

# G

q = n * (p % n + p < n)
print(q) # Result is 0

# H

q = n * (p % n + p > n)
print(q) # Result is 2
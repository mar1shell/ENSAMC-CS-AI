# %%
# Question 1

a = int(input("Enter a number: "))
b = int(input("Enter another number: "))
print(f"{a} x {b} = {a * b}")

# Question 2
# Si on entre des caractéres au lieu des nombre, le programme se termine avec une erreur

# Question 3
# %%
def add():
    try:
        a = int(input("Enter a number: "))
        b = int(input("Enter another number: "))
        print(f"{a} x {b} = {a * b}")
    except ValueError:
        print("Value enterd is not a number")

# Question 4
# %%

add()
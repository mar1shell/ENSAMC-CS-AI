# Question 1
with open("text1.txt", "w") as text1:
    text1.write("Bonjour Mes Amis\n")

# Question 2
# %%
with open("text2.txt", "w") as text2:
    for i in range(100):
        text2.write("Bonjour Mes Amis\n")

# Question 3
# %%
with open("text2.txt", "r") as text2:
    for (i, line) in enumerate(text2):
        print(f"Line {i + 1}: {line}")

# Question 4
# %%
with open("table_de_multiplication.txt", "w") as table:
    for i in range(10):
        table.write(f"La table de multiplication de {i:02}\n")
        for j in range(10):
            table.write(f"{i:02}  x  {j:02} = {i * j}\n")
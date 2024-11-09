# This code is written for a linux machine
import os
import shutil
from typing import final

# Question 1:
# %%
os.mkdir('directory')
os.mkdir('directory2')

# %%
with open('directory/file.txt', 'w') as f:
    f.write('hello azezzae ezaeaze aeezae  eazeaze  eazeaze \n azeaz')

# %%
shutil.move('directory/file.txt', 'directory2')

# Question 2
# %%
def wordsCount(filename):
    try:
        file = open(filename, 'r')
        counter = 0
        for line in file:
            counter += len(line.split())
        print(f"The file {filename} has {counter} words")
    except FileNotFoundError:
        print("File not found")
    finally:
        file.close()
        return

# Test
# %%
wordsCount("directory2/file.txt")

# %%
def createFile(filename):
    try:
        file = open(filename, 'w')
        print(f"File {filename} created successfully")
    except:
        print("File creation failed")
    finally:
        file.close()
        return

# Test
# %%
createFile('directory/file.txt')

#%%
def addLines(filename):
    try:
        file = open(filename, 'a')
    except:
        print("File opening failed")
        return
    finally:
        flag = 1
        while flag:
            print("#" * 30)
            line = input("Enter a line: ")
            file.write(line + "\n")
            flag = int(input("Do you want to add another line? (no = 0/yes = else): "))
        return

# Test
# %%
addLines("directory2/file.txt")

# %%
def displayFile(filename):
    try:
        file = open(filename, 'r')
    except FileNotFoundError:
        print("File not found")
        return
    finally:
        for (i, line) in enumerate(file):
            print(f"line {i + 1}: {line}")
        return

def displayFile(filename):
    try:
        file = open(filename, 'r')
    except FileNotFoundError:
        print("File not found")
        return
    finally:
        for (i, line) in enumerate(file):
            print(f"line {i + 1}: {line}")
        return

#Test
# %%
displayFile("directory2/file.txt")

# %%
def fileProperties(filename):
    try:
        file = open(filename, 'r')
    except FileNotFoundError:
        print("File not found")
        return
    finally:
        lines = 0
        words = 0
        chars = 0
        for line in file:
            for word in line.split():
                words += 1
            for char in line:
                chars += 1
            lines += 1
        file.close()

        binaryFile = open(filename, 'rb')
        binaryFile.seek(0, 2)
        size = binaryFile.tell()
        binaryFile.close()

        print(f"file {filename} with size {size} bytes has {lines} lines, {words} words and {chars} characters")
        return

# Test
# %%
fileProperties("directory2/file.txt")
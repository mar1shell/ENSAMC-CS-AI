import tkinter as tk
from tkinter import messagebox

# functions

def createFile():
    try:
        with open(filepath.get(), 'w') as file:
            messagebox.showinfo('File Created', 'File has been created successfully.')
            return
    except Exception as e:
        messagebox.showwarning("Warning", "File creation failed\nError: {0}".format(e))

def fileProperties():
    try:
        with open(filepath.get(), 'r') as file:
            lines = 0
            words = 0
            chars = 0
            size = 0
            for line in file:
                for word in line.split():
                    words += 1
                for char in line:
                    chars += 1
                lines += 1

            with open(filepath.get(), 'rb') as binaryFile:
                binaryFile.seek(0, 2)
                size = binaryFile.tell()

            displayArea.config(state=tk.NORMAL)
            displayArea.delete("1.0", tk.END)
            displayArea.insert("1.0",f"file {filepath.get()} with size {size} bytes has \n{lines} lines \n{words} words \n{chars} characters")
            displayArea.config(state=tk.DISABLED)
            return
    except FileNotFoundError:
        messagebox.showwarning("Warning", "File not found, try again with a valid file path")

def displayFile():
    try:
        with open(filepath.get(), 'r') as file:
            str = ""

            for (i, line) in enumerate(file):
                str += f"line {i + 1}: {line}"

            displayArea.config(state=tk.NORMAL)
            displayArea.delete("1.0", tk.END)
            displayArea.insert("1.0", str)
            displayArea.config(state=tk.DISABLED)
            return
    except FileNotFoundError:
        messagebox.showwarning("Warning", "File not found, try again with a valid file path")

def addLines():
    try:
        with open(file2Path.get(), 'a') as file:
            file.write(line.get() + "\n")
            messagebox.showinfo("Success", "Line added successfully")
            return
    except FileNotFoundError:
        messagebox.showwarning("Warning", "File not found, try again with a valid file path")

# main settings

window = tk.Tk()
window.title('Activity 2 GUI')
window.geometry('400x600')

# frame1

frame1 = tk.Frame(window)
frame1.pack()

fileEntryLabel = tk.Label(frame1, text="File Path", font=("Helvetica", 15), fg="black", pady=10)
fileEntryLabel.pack(padx=10, pady=5)

filepath = tk.StringVar()
fileEntry = tk.Entry(frame1, font=("Helvetica", 15), fg="black", textvariable=filepath)
fileEntry.pack(padx=10, pady=5)

createButton = tk.Button(frame1, text="CREATE", command=createFile)
createButton.pack(side=tk.LEFT, padx=10, pady=10, fill=tk.Y)

analyseButton = tk.Button(frame1, text="ANALYSE", command=fileProperties)
analyseButton.pack(side=tk.LEFT, padx=10, pady=10, fill=tk.Y)

showButton = tk.Button(frame1, text="SHOW CONTENT", padx=10, pady=10, command=displayFile)
showButton.pack(side=tk.LEFT, padx=10, pady=10, fill=tk.Y)

# frame2

frame2 = tk.Frame(window)
frame2.pack()

displayArea = tk.Text(frame2, font=("Helvetica", 15), fg="black", height=10)
displayArea.config(state=tk.DISABLED)
displayArea.pack(padx=10, pady=10)

# frame3

frame3 = tk.Frame(window)
frame3.pack()

file2EntryLabel = tk.Label(frame3, text="File Path to modify", font=("Helvetica", 15), fg="black", pady=10)
file2EntryLabel.pack(padx=10, pady=5)

file2Path = tk.StringVar()
file2Entry = tk.Entry(frame3, font=("Helvetica", 15), fg="black", textvariable=file2Path)
file2Entry.pack(padx=10, pady=5)

line = tk.StringVar()
lineArea = tk.Entry(frame3, font=("Helvetica", 15), fg="black", textvariable=line)
lineArea.pack(side=tk.LEFT, padx=10, pady=15, fill=tk.Y)

addLineButton = tk.Button(frame3, text="ADD LINE", padx=10, pady=10, command=addLines)
addLineButton.pack(side=tk.LEFT, padx=10, pady=10, fill=tk.Y)
window.mainloop()
from tkinter import *
from tkinter import messagebox

# function to add twwo numbers

def calculate_sum():
    try:
        num1 = float(v1.get())
        num2 = float(v2.get())
        result = num1 + num2
        v3.set(str(result))
    except ValueError:
        messagebox.showinfo("Error", "Please enter a number")

# GUI

fenetre = Tk()

fenetre.title("titre")
fenetre.geometry("400x300")
fenetre.resizable(False, False)

name_LabelA = Label(fenetre, text='Enter Num 1: ')
name_LabelA.grid(column=0, row=0, sticky='w', padx=5, pady=5)

v1 = StringVar()
name_entryA = Entry(fenetre, textvariable=v1, width=31)
name_entryA.focus_set()
name_entryA.grid(column=1, row=0, sticky='sw', columnspan=1, padx=10)

name_LabelB = Label(fenetre, text='Enter Num 2: ')
name_LabelB.grid(column=0, row=1, sticky='w')

v2 = StringVar()
name_entryB = Entry(fenetre, textvariable=v2, width=31)
name_entryB.focus_set()
name_entryB.grid(column=1, row=1, sticky='sw', columnspan=1, padx=10)

outpout_label = Label(fenetre, text='The sum is: ')
outpout_label.grid(column=0, row=2, sticky='w')

v3 = StringVar()
outpout_entry = Entry(fenetre, textvariable=v3, width=31, state='readonly')
outpout_entry.focus_set()
outpout_entry.grid(column=1, row=2, sticky='sw', columnspan=1, padx=10)

quit_button = Button(fenetre, text="Quit", pady=2, command=fenetre.quit)
quit_button.grid(column=0, row=3, sticky='sw', pady=20, padx=10)

show_button = Button(fenetre, text="Show", pady=2, command=calculate_sum)
show_button.grid(column=1, row=3, sticky='sw', pady=20, padx=10)

fenetre.mainloop()
from tkinter import *

window = Tk()
window.title("Pogramme")
window.geometry("300x400")
window.maxsize(300, 400)
window.minsize(300, 400)


# input text widget

text_label = Label(window, text="Insérer un texte dans la  zone ci-dessous: ", pady=20)  
text_label.pack(padx=10, pady=10)

v1 = StringVar()
text_entry = Entry(window, width=31, textvariable=v1)
text_entry.pack(padx=10, pady=10)

# Action button

def show_text_function():
    try:
        text = v1.get()
        v2.set(text)
        v3.set(len(text))
    except ValueError:
        v2.set("Invalid input")

action_button = Button(window, text="Show", pady=10, command=show_text_function)
action_button.pack(padx=10, pady=10)

# show text widget

v2 = StringVar()
show_text_entry = Entry(window, width=31, textvariable=v2, state='readonly')
show_text_entry.pack(padx=10, pady=10)


# length text widget

length_label = Label(window, text="La longueur du texte est: ", pady=10)
length_label.pack(padx=10, pady=10)

v3 = StringVar()
length_entry = Entry(window, width=31, textvariable=v3, state='readonly')
length_entry.pack(padx=10, pady=10)

window.mainloop()
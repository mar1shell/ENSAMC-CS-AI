from gestion.classes import Student, Employe

s1 = Student(1, "Ali", "Casablanca", "IAGI", 1)
s2 = Student(2, "Amine", "Nador", "iagi", 2)

e1 = Employe(0,"Khalil", "Casablanca", "Lawyer", 15000)

print("#" * 20)
print(s1.toString())
print("#" * 20)
print(s2.toString())
print("#" * 20)

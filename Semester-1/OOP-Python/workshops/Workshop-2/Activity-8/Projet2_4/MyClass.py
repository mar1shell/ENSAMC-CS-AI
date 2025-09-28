from com.classes import Personne, Order

p1 = Personne(1, "Ali", "Casablanca")

o1 = Order(1111, "01/01/2024", 4500)
o2 = Order(1212, "02/05/2024", 3200)

print("#" * 20)
print(p1.toString())
print("#" * 20)

print("#" * 20)
print(o1.toString())
print("#" * 20)
print("#" * 20)
print(o2.toString())
print("#" * 20)

o1.set_personne(p1)
o2.set_personne(p1)

p1.set_order(o1)
p1.set_order(o2)

p1.display_order()

o1.display_personne()
o2.display_personne()
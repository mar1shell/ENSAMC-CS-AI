from com.classes import Personne, Order

p1 = Personne(1, "Ali", "Casablanca")

o1 = Order(1111, "01/01/2024", 4500)
o2 = Order(1212, "02/05/2024", 3200)

p1.toString()

o1.toString()
o2.toString()

o1.set_personne(p1)
o2.set_personne(p1)

p1.set_order(o1)
p1.set_order(o2)

p1.display_order()

o1.display_personne()
o2.display_personne()
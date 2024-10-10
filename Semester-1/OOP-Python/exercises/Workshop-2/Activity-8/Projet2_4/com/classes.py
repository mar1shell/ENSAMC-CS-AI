class Personne:
    def __init__(self, id, name, city):
        self.id = id
        self.name = name
        self.city = city
        self.order = []
    def get_id(self):
        return self.id
    def get_name(self):
        return self.name
    def get_city(self):
        return self.city
    def set_city(self, city):
        self.city = city
    def set_name(self, name):
        self.name = name
    def set_id(self, id):
        self.id = id
    def set_order(self, order):
        self.order.append(order)
    def toString(self):
        return "Id : " + str(self.id) + ", Name : " + self.name + ", City : " + self.city
    def display_order(self):
        if self.order is not None:
            print("#" * 20)
            print("Personne Orders Codes : ", end="")
            for ord in self.order:
                print(ord.get_code(), end=" ")
            print()
            print("#" * 20)
        else:
            print("No orders")

class Order:
    def __init__(self, code, datecmd, total, personne = None):
        self.code = code
        self.datecmd = datecmd
        self.total = total
        self.personne = personne
    def get_code(self):
        return self.code
    def get_datecmd(self):
        return self.datecmd
    def get_total(self):
        return self.total
    def set_code(self, code):
        self.code = code
    def set_datecmd(self, datecmd):
        self.datecmd = datecmd
    def set_total(self, total):
        self.total = total
    def set_personne(self, personne):
        self.personne = personne
    def toString(self):
        return "Code : " + str(self.code) + ", Date : " + self.datecmd + ", Total : " + str(self.total)
    def display_personne(self):
        if self.personne is not None:
            print("Personne Id : ", self.personne.get_id())
        else:
            print("No personne")
class Personne:
    def __init__(self, id, name, city):
        self.id = id
        self.name = name
        self.city = city
    def get_id(self):
        print("#" * 20)
        print("Id : ", self.id)
        print("#" * 20)
    def get_name(self):
        print("#" * 20)
        print("Name : ", self.name)
        print("#" * 20)
    def get_city(self):
        print("#" * 20)
        print("City : ", self.city)
        print("#" * 20)
    def set_city(self, city):
        self.city = city
    def set_name(self, name):
        self.name = name
    def set_id(self, id):
        self.id = id
    def toString(self):
        print("#" * 20)
        print("Id : ", self.id, ", Name : ", self.name, ", City : ", self.city)
        print("#" * 20)

class Student(Personne):
    def __init__(self, id, name, city, formation, level):
        super().__init__(id, name, city)
        self.formation = formation
        self.level = level
    def get_formation(self):
        print("#" * 20)
        print("Formation : ", self.formation)
        print("#" * 20)
    def get_level(self):
        print("#" * 20)
        print("Level : ", self.level)
        print("#" * 20)
    def set_formation(self, formation):
        self.formation = formation
    def set_level(self, level):
        self.level = level
    def toString(self):
        super().toString()
        print("Formation : ", self.formation, ", Level : ", self.level)
        print("#" * 20)

class Employe(Personne):
    def __init__(self, id, name, city, job, sal):
        super().__init__(id, name, city)
        self.job = job
        self.sal = sal
    def get_job(self):
        print("#" * 20)
        print("Job : ", self.job)
        print("#" * 20)
    def get_sal(self):
        print("#" * 20)
        print("Salary : ", self.sal)
    def set_job(self, job):
        self.job = job
    def set_sal(self, sal):
        self.sal = sal
    def toString(self):
        super().toString()
        print("Job : ", self.job, ", Salary : ", self.sal)
        print("#" * 20)
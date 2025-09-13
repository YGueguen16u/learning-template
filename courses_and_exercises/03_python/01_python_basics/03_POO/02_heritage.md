# Heritage

L’_héritage_ consiste à créer une _sous-classe_ à partir d’une classe existante. On dit que cette nouvelle classe _hérite_ de la première car elle aura automatiquement les mêmes attributs et méthodes.  

De plus, il est possible d’ajouter des attributs ou des méthodes qui seront spécifiques à cette sous-classe.

Dans la première partie de ce module, nous avons introduit la classe `Vehicule` définie ainsi:

```python
class Vehicule:
   def __init__(self, a, b = None):
       self.seats = a
       if b == None:
           self.passengers = []
       else:
           self.passengers = b
   def print_passengers(self):
       for i in range(len(self.passengers)):
           print(self.passengers[i])
   def add(self,name):
       self.passengers.append(name)
```

Nous pouvons définir une classe `Moto` qui hérite de la classe `Vehicule` de la façon suivante:

```python
class Moto(Vehicule):
   def __init__(self, b, c):
       self.seats = 2
       self.passengers = b
       self.brand = c
```

```python
moto1 = Moto(['Pierre','Dimitri'], 'Yamaha')
```

Grâce à l'héritage, nous pouvons faire appel à la méthode `print_passengers` définie dans la classe `Vehicule` sur une instance de la classe `Moto`.

```python 
class Vehicule: # définition de la classe Vehicule
    def __init__(self, a, b = None):
        self.seats = a  # nombre de places dans le vehicule  
        if b == None:
            self.passengers = []  # liste contenant le nom des passagers
        else:
            self.passengers = b
    
    def print_passengers(self): # Affiche le nom de tous les passagers présents dans le véhicule
        for i in range(len(self.passengers)):
            print(self.passengers[i])
    
    def add(self,name): # Ajoute un nouveau passager dans la liste des passagers du véhicule
            self.passengers.append(name)
    
class Moto(Vehicule):
    def __init__(self, b, c):
        self.seats = 2      # Le nombre de sièges est automatiquement initialisé à 2 et n'est pas modifié par les
                            # arguments passés en paramètres.
        self.passengers = b 
        self.brand = c
        
    def add(self, name):
        if( len(self.passengers) <  self.seats):
            self.passengers.append(name)
            print('Il reste', self.seats - len(self.passengers), 'places')
        else:
            print("Le véhicule est rempli")

moto1 = Moto(['Pierre','Dimitri'], 'Yamaha')
moto1.add('Yohann')
moto1.print_passengers()


voiture2 = Vehicule(3 , ['Antoine', 'Thomas', 'Raphaël'])
Moto2 = Moto(['Guillaume', 'Charles'] , 'Honda')
voiture2.add('Benjamin')
Moto2.add('Dimitri')

```


- Créer une classe `Convoi` qui contiendra 2 attributs: Le premier, nommé `vehicule_list` est une liste d'instances de type `Vehicule` et le deuxième `length` est le nombre total de véhicules dans le `Convoi`. Un convoi sera automatiquement initialisé avec 1 véhicule de 4 places sans passagers.

- Définir dans la classe `Convoi` une méthode `add_vehicule` qui ajoutera un objet de type `Vehicule` à la fin de la liste des véhicules du convoi. Il ne faudra pas oublier de mettre à jour la longueur du convoi.

- Initialiser une instance **`convoi1`** de la classe `Convoi`.

- Ajoutez le passager `"Albert"` dans le premier véhicule de l'instance `convoi1`.

- Ajoutez une moto de marque `"Honda"` à `convoi1` qui sera conduite par `"Raphael"`.

- Ecrire un petit script qui affichera tous les passagers dans `convoi1`.

```python
class Convoi:
    def __init__(self):
        self.vehicule_list = [] 
        self.vehicule_list.append(Vehicule(4))
        self.length = 1  # initialisation de l'attribut length à 1.

    def add_vehicule(self, vehicule):
        self.vehicule_list.append(vehicule) # ajout du vehicule en fin de liste
        self.length = self.length + 1 
        
convoi1 = Convoi() # Initialisation du convoi
convoi1.vehicule_list[0].add('Albert') # Ajout de "Albert" dans le premier véhicule du convoi
convoi1.add_vehicule(Moto(['Raphael'] , 'Honda')) # Il ne faut pas oublier que le premier paramètre du constructeur
                                                    # de la classe Vehicule est une liste et non une chaîne de caractères

for vehicule in convoi1.vehicule_list: # On parcourt la liste de véhicules du convoi
    vehicule.print_passengers() # On utilise la méthode print_passengers de la classe Vehicule.
```


# Built-in methods

Les classes définies en Python ont des méthodes dont le nom est déja défini. Le premier exemple de méthode de ce type que nous avons vu est la méthode `__init__` qui permet d'initialiser un objet, mais ce n'est pas la seule.  
  
Ces méthodes donnent à la classe la possibilité d'interagir avec des fonctions Python prédéfinies telles que `print`, `len`, `help` et les opérateurs de bases. Ces méthodes ont en général les affixes `__` au début et à la fin de leurs noms, ce qui nous permet de les identifier facilement.  
  
Grâce à la commande `dir(object)`, nous pouvons avoir un aperçu de quelques méthodes prédéfinies communes à tous les objets Python.

```python
dir(object)
```

```
['__class__',
 '__delattr__',
 '__dir__',
 '__doc__',
 '__eq__',
 '__format__',
 '__ge__',
 '__getattribute__',
 '__gt__',
 '__hash__',
 '__init__',
 '__init_subclass__',
 '__le__',
 '__lt__',
 '__ne__',
 '__new__',
 '__reduce__',
 '__reduce_ex__',
 '__repr__',
 '__setattr__',
 '__sizeof__',
 '__str__',
 '__subclasshook__']
 ```

 ### La méthode str

Une des méthodes les plus pratiques est la méthode `__str__` qui est appelée automatiquement lorsque l'utilisateur lance la commande `print` sur un objet. Cette méthode renvoie une chaîne de caractère qui représente l'objet l'ayant appelé.  
  
Toutes les classes en Python sur lesquelles nous pouvons appliquer la fonction `print` ont cette méthode dans leur définition.

```python
i = 10
i.__str__() # '10'

tab = [1, 2 , 3, 4, 5, 6]
tab.__str__() # '[1, 2, 3, 4, 5, 6]'
```

Lorsque nous définissons notre propre classe, il est préférable de lui définir une méthode `__str__` plutôt qu'une méthode de type `afficher` comme nous l'avons fait précédemment. Ceci permettra à tous les futurs utilisateurs d'utiliser directement la fonction `print` pour afficher l'objet sur la console.  
  
Nous allons reprendre la classe `Complexe` que nous avions défini dans le premier module d'introduction à la programmation orientée objet:  
  

```python
    class Complexe:
        def __init__(self, a = 0, b = 0):
            self.partie_re = a        # Initialisation de la partie réelle
            self.partie_im = b        # Initialisation de la partie imaginaire
        def afficher(self):
            if(self.partie_im < 0):
                print(self.partie_re, self.partie_im, 'i')   # Affichage de a - bi si b < 0
            if(self.partie_im == 0):
                print(self.partie_re)                              # Affichage de a si b = 0
            if(self.partie_im > 0):
                print(self.partie_re, '+', self.partie_im, 'i')    # Affichage de a + bi si b > 0
```

- Définir dans la classe `Complexe` la méthode `__str__` qui **doit renvoyer une chaîne de caractères** correspondant à la représentation algébrique 𝑎+𝑏𝑖 d'un nombre complexe. Cette méthode remplacera la méthode `afficher`.

Pour obtenir la représentation en chaîne de caractères d'un nombre, vous pouvez appeler sa méthode `__str__`.

Instancier un `Complexe` correspondant au nombre 6−3𝑖 puis l'afficher sur la console à l'aide de la fonction `print`.

```python
class Complexe:
    def __init__(self, a = 0, b = 0):
        self.partie_re = a
        self.partie_im = b
    
    def __str__(self):
        if(self.partie_im < 0):
            return self.partie_re.__str__() + self.partie_im.__str__() + 'i'  # renvoie 'a' '-b' 'i'
        
        if(self.partie_im == 0):
            return self.partie_re.__str__()    # renvoie 'a'
        
        if(self.partie_im > 0):
            return self.partie_re.__str__() + '+' + self.partie_im.__str__() + 'i' # renvoie 'a' '+' 'b' + 'i'
        
z = Complexe(6, -3)
print(z)
```


### Les méthodes de comparaison

Comme pour les classes `int` ou `float`, nous aimerions pouvoir comparer les objets de la classe `Complexe` entre eux, c'est-à-dire pouvoir utiliser les opérateurs de comparaison (`>`, `<`, `==`, `!=`, ...). Pour cela, les développeurs Python ont prévu les méthodes suivantes:

- `__le__` / `__ge__`: _lesser or equal_ / _greater or equal_
- `__lt__` / `__gt__`: _lesser than_ / _greater than_
- `__eq__` / `__ne__` : _equals_ / _not equal_  
      
    Ces méthodes sont automatiquement appelés lorsque les opérateurs de comparaison sont utilisés et renvoient un booléen (`True` ou `False`).

```python
x = 5
y = 3

print(x > y)  # True

print(x.__gt__(y)) # True   
                                # Ces deux types d'écriture sont strictement équivalents
print(x < y) # False

print(x.__lt__(y)) # False
```

Pour la classe `Complexe`, nous allons faire la comparaison grâce au module calculé par la formule $|𝑎+𝑏𝑖|=sqrt(𝑎²+𝑏²)$

- Définir dans la classe `Complexe` une méthode `mod` qui renvoie le module du `Complexe` appelant la méthode. Vous pourrez utiliser la fonction `sqrt` du package `numpy` pour calculer une racine carrée.

- Définir dans la classe `Complexe` les méthodes `__lt__` et `__gt__` (strictement inférieur et strictement supérieur). Ces méthodes doivent retourner un booléen.

- Effectuer les deux comparaisons sur les nombres complexes 3+4𝑖 et 2−5𝑖

```python
import numpy as np

class Complexe:
    def __init__(self, a = 0, b = 0):
        self.partie_re = a
        self.partie_im = b
    
    def __str__(self):
        if(self.partie_im < 0):
            return self.partie_re.__str__() + self.partie_im.__str__() + 'i' 
        
        if(self.partie_im == 0):
            return self.partie_re.__str__()    
        
        if(self.partie_im > 0):
            return self.partie_re.__str__() + '+' + self.partie_im.__str__() + 'i' 
        
    def mod(self):
        return np.sqrt( self.partie_re ** 2 + self.partie_im ** 2)  # renvoie (sqrt(a² + b²))
    
    def __lt__(self, other):    
        if( self.mod() < other.mod()):   # renvoie True si |self| < |other|
            return True
        else:
            return False
        
    def __gt__(self, other):
        if( self.mod() > other.mod()):   # renvoie True si |self| > |other|
            return True
        else:
            return False
        
        
z1 = Complexe(3, 4)
z2 = Complexe(2, -5)
print(z1 > z2)
print(z1 < z2)
```

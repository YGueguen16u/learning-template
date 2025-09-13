

# Introduction et pré-requis

En Python et dans de nombreux autres langages de programmation, la _programmation orientée objet_ consiste à créer des _classes_ d’_objets_ qui contiennent des informations spécifiques et des outils adaptés à leur manipulation.

Tous les outils que nous utilisons pour faire de la data science (_DataFrames, modèles de scikit-learn, matplotlib_,...) sont construits de cette manière. Comprendre les mécaniques des objets Python et savoir les utiliser est essentiel pour pouvoir exploiter toutes les fonctionnalités de ces outils bien pratiques.

De plus, la programmation orientée objet donne au développeur la flexibilité de réadapter un objet à ses besoins grâce à la notion d'_héritage_ que nous verrons en deuxième partie. En effet, cette technique est très utilisée pour développer des packages tels que **scikit-learn** qui permettent à un utilisateur de développer et évaluer facilement les modèles dont il a besoin.

Pour aborder ces modules dans les meilleures conditions, il est important d'avoir fait le module d'_introduction à la programmation Python_.

# Pourquoi utiliser des classes ?

Admettons que vous vouliez suivre les entrepôts de votre entreprise.

Vous pourriez faire ça avec des listes:

```python
warehouse_one = [
    "Paris",
    1040,
    "Tom Felton",
    12,
    {"item1": 24, "item2": 42, "item3": 56},
]
```

Ici, le premier entrepôt est à Paris, il fait 1040m², le manager est Tom Felton et il y a 12 employés.

C’est pas mal, mais si pour une raison quelconque quelqu’un fait une erreur d’enregistrement et oublie la surface en m², quand vous ferez:

```python
warehouse_one[1]
```

Vous récupérerez le nom du manager au lieu de récupérer la surface…

Pour éviter ça, vous pourriez utiliser un dictionnaire

```python
warehouse_one = {
    "Location": "Paris",
    "surface_area": 1040,
    "manager": "Tom Felton",
    "n_employees": 12,
    "storage": {"item1": 24, "item2": 42, "item3": 56},
 }
```

Ensuite, vous pourriez créer une fonction qui fait la somme des quantités indiquées dans le storage, et divise ça par le nombre d’employés.

- Exercice: créez une fonction qui calcule la quantité moyenne par employé dans le storage
    - hints
        
        1. utilisez .values() pour récupérer une liste qui contient uniquement les valeurs (et pas les clés) du dictionnaire “storage” (rappel: un dictionnaire est une pair clé/valeur)
        2. utilisez sum() pour faire la somme de ces values
        3. faites une division avec le nombre d’employés
    - Solution
        
        ```python
        
        def get_quantity_per_employee(warehouse: dict) -> int | float:
            return sum(warehouse["storage"].values()) / warehouse["n_employees"]
        
        qty_per_employee = get_quantity_per_employee(warehouse_one)
        print(qty_per_employee)
        ```
        

Mais que se passe t’il si quelqu’un créé une warehouse_two et oublie de mettre la Location, le manager ou le nombre d’employés ??

- Créez un dictionnaire warehouse_two avec une surface_area de 2000, Emma Watson comme manager et deux items en stock (quantités libres)
    
    
    ```python
    warehouse_two = {
        "surface_area": 2000,
        "manager": "Emma Watson",
        "storage": {"item1": 7, "item2": 4},
     }
     
    ```
    
- Maintenant essayez d’utiliser la fonction get_quantity_per_employee() sur votre warehouse_two
    
    
    ```python
    def get_quantity_per_employee(warehouse: dict) -> int | float:
        return sum(warehouse["storage"].values()) / warehouse["n_employees"]
    
    qty_per_employee = get_quantity_per_employee(warehouse_two)
    print(qty_per_employee)
    ```
    
    Que se passe-t’il ? (pas besoin d’exécuter le code si vous arrivez déjà à deviner ce qu’il va se passer 😉)
    
Vous avez peut-être remarqué qu’on a le même problème avec nos fonctions qui harmonisent les informations sur les foreuses de puits de pétrole. Dans beaucoup de ces fonctions, on _part du principe_ que la fonction va toujours trouver les champs dont on se sert pour faire nos modifications…

Vous commencez sans doute à vous dire:

> Ok, ce serait pas mal si on avait un moyen de forcer les utilisateurs à mettre certaines clés dans notre dictionnaire, en renvoyant une erreur si ces clés ne sont pas renseignées.


C’est justement pour ça qu’on utilise des classes 🙂



💡 Les classes sont des templates de code qui permettent d’associer de la donnée avec des fonctionnalités.

Par exemple, une liste dispose de la fonctionnalité “.append()”, une string dispose de la fonctionnalité “.zfill()”, etc.

La POO, programmation orientée objet, consiste à créer des objets et leur donner des fonctionnalités


# Comment créer une classe


- Solution
    
    ```python
    class Warehouse:
        pass
    ```
    

Une fois que vous avez créé cette classe, vous pouvez en créer une _instance:_

<aside> 💡

_instancier_ une classe veut plus ou moins dire “créer un exemplaire de cette classe”.

C’est un terme qui revient souvent en programmation orientée objet donc gardez le en tête.

</aside>

```python
test = Warehouse()
print(test)
```


<aside> 💡

Sidenote: **repr**

</aside>

⚠️ ATTENTION: en Python, le nom d’une classe doit suivre le modèle CamelCase.

Voici quelques exemples de noms de classes corrects et incorrects:

Correct:

- CaPasseOuCaClasse
- LaClasseADallas
- LaClasseAméricaine

Incorrect:

- nouvelleClasse # correct = NouvelleClasse
- classe_verte # correct = ClasseVerte
- Classedeneige # correct = ClasseDeNeige

Note: Python ne vous empêchera pas de faire autrement, mais c’est une convention de code sur laquelle tout le monde s’est accordé, donc si vous faites autrement vos collègues ne vont pas vous aimer ^^

- Définissez votre propre classe “drilling_machine”. Puis instanciez cette classe dans une variable et faites un print() du type de cette variable.
    
    ```python
    class DrillingMachine:  # attention: drillingMachine ou Drillingmachine ne sont pas bons 
        pass
        
    drilling_machine_one = DrillingMachine()
    
    print(type(drilling_machine_one))
    ```
    
- Refaites le même exercice, mais cette fois instanciez **deux fois** la même classe dans deux variables différentes. Printez ces deux variables (pas leur types, les variables directement cette fois ci). Que constatez-vous ?
    
    ```python
    class DrillingMachine:  # attention: drillingMachine ou Drillingmachine ne sont pas bons
        pass
    
    drilling_machine_one = DrillingMachine()
    drilling_machine_two = DrillingMachine()
    
    print(drilling_machine_one)
    print(drilling_machine_two)
    
    ```
    
    Comme vous pouvez le constater, les deux objets sont stockés à des endroits différents en mémoire:
    
    
    Vous avez bien créé deux instances différentes de la même classe.
    

Félicitations 🙂 Vous venez de créer votre première classe !

En l’état, ça sert pas à grand chose, mais on va ajouter des fonctionnalités au fur et à mesure ;)

# Attributs

On vient de voir comment créer et instancier une classe:

```python
class DrillingMachine: 
    pass
    
drilling_machine_one = DrillingMachine()
```

Mais l’objectif de faire de la Data, c’est d’utiliser les informations pour prendre de meilleures décisions et/ou accélérer les process.

On a vu comment stocker des informations dans des listes, ou dans des dictionnaires. Mais pour l’instant, nos classes ne stockent rien.

Ce n’est pas très utile, on va donc remédier à ça tout de suite.

Pour stocker des informations à travers une classe, il faut indiquer à Python dans la définition de la classe qu’on s’attend à recevoir des infos:

```python
class Warehouse:
    def __init__(self, location, manager):
        self.location = location
        self.manager = manager
```

Vous après avoir vu le morceau de code:


Pour comprendre ce morceau de code, il faut comprendre qu’ensuite, au moment d’instancier la classe (comme on l’a fait plus haut), on va insérer des valeurs comme on le ferait pour une fonction:

```python
class Warehouse:
    def __init__(self, location, manager):
        self.location = location
        self.manager = manager
        
warehouse_one = Warehouse("Paris", "Tom Felton")
```

Concrètement, votre classe _attends de vous_ que vous fournissiez une valeur pour chacun des arguments attendus en input.

- Pour comprendre, recréez la même classe, puis essayez de l’instancier avec seulement la localisation
    
    ```python
    class Warehouse:
        def __init__(self, location, manager):
            self.location = location
            self.manager = manager
            
    warehouse_one = Warehouse("Paris")
    ```
    
    Si vous oubliez de fournir un des deux arguments attendus, l’interpréteur de Python vous renvoie une erreur.
    
- Pour vous aider aussi à comprendre, lisez et exécutez le code suivant
    
    ```python
    class Warehouse:
        def __init__(self, location, manager):
    		    print("ce code s'exécute lorsqu'on crée une instance de cette classe")
            self.location = location
            self.manager = manager
    ```
    
    Puis créez une instance de la classe:
    
    ```python
    warehouse_one = Warehouse("Paris", "Tom Felton")
    ```
    
    

💡 Ces petits exercices vous aident peut-être à comprendre que la méthode __init__ est une méthode spéciale qui est appelée lors de la création d'une instance.

Elle sert à initialiser un certain nombre d'attributs et à effectuer des opérations lors de l'instanciation d'une classe.

En gros, elle dit à Python:

> Tu vois les deux arguments que l’utilisateur vient de te passer quand il a instancié la classe ? Bah tu vas les stocker à l’intérieur de l’objet.


En fait, le self.location veut dire qu’à partir de maintenant, l’objet “Warehouse” que vous avez créé aura un _attribut_ qui s’appelle location.

Vous pouvez ensuite accéder à cet attribut avec l’opérateur “.” (point):

```python
class Warehouse:
    def __init__(self, location, manager):
        self.location = location
        self.manager = manager
        
warehouse_one = Warehouse("Paris", "Tom Felton")

print(warehouse_one.location)
```

- Exercice: utilisez l’opérateur . pour print le manager de votre warehouse_one (Faites le vraiment même si vous pouvez anticiper le résultat, pour bâtir votre mémoire musculaire).
    
    ```python
    class Warehouse:
        def __init__(self, location, manager):
            self.location = location
            self.manager = manager
            
    warehouse_one = Warehouse("Paris", "Tom Felton")
    
    print(warehouse_one.manager)
    ```
    

💡 Les attributs sont donc des informations que l’on stocke à propos du phénomène qu’on cherche à modéliser.

Attribut = mot barbare pour dire “une variable stockée dans une classe ou dans une instance de classe”.


- Exercice: avant de passer à la suite, créez une class DrillingMachine qui possède tous les attributs qu’on avait dans notre fichier json: ['machine_id', 'name', 'location', 'status', 'specifications', 'last_maintenance_date', 'next_maintenance_due', 'contact_information']
    
    ```python
    class DrillingMachine:
        def __init__(
            self,
            machine_id,
            name,
            location,
            status,
            specifications,
            last_maintenance_date,
            next_maintenance_due,
            contact_information,
        ):
            self.machine_id = machine_id
            self.name = name
            self.location = location
            self.status = status
            self.specifications = specifications
            self.last_maintenance_date = last_maintenance_date
            self.next_maintenance_due = next_maintenance_due
            self.contact_information = contact_information
    
    ```
    

💡 Ah, et je vous ai pas dit ?! Vous vous souvenez des “type annotations” ?

Mais si, quand on précise aux utilisateurs futurs de notre code quel type il faut mettre dans les arguments d’une fonction 😀

![[08_02.png]]

Eh oui, c’est valable pour les classes aussi ^^

- Exercice: avant de passer à la suite, créez une class DrillingMachine qui possède tous les attributs qu’on avait dans notre fichier json: ['machine_id', 'name', 'location', 'status', 'specifications', 'last_maintenance_date', 'next_maintenance_due', 'contact_information']
    
    ```python
    from typing import Dict
    
    class DrillingMachine:
    
        def __init__(
            self,
            machine_id: str,
            name: str,
            location: str,
            status: str,
            specifications: Dict[str, str],
            last_maintenance_date: str,
            next_maintenance_due: str,
            contact_information: Dict[str, str],
        ) -> None:
            self.machine_id = machine_id
            self.name = name
            self.location = location
            self.status = status
            self.specifications = specifications
            self.last_maintenance_date = last_maintenance_date
            self.next_maintenance_due = next_maintenance_due
            self.contact_information = contact_information
    
    ```
    
    [Pour les curieux: pourquoi il faut utiliser → None pour le **init** ?](https://www.notion.so/Pour-les-curieux-pourquoi-il-faut-utiliser-None-pour-le-__init__-15c9064d0b6f80daa7f7c869c642a597?pvs=21)
    

[Aparté: différence entre “class attribute” et “instance attribute”](https://www.notion.so/Apart-diff-rence-entre-class-attribute-et-instance-attribute-15b9064d0b6f80a59a95d015bc85bfe7?pvs=21)

# Méthodes

Essayez de comprendre ce qu’est une méthode en lisant cette phrase:

> Les méthodes sont aux fonctions ce que les attributs sont aux variables

Pour mieux comprendre cette phrase, voici un graphique:

![[08_03.png]]

Si vous avez compris la phrase ou le graphique, vous avez sans doute déjà compris à quoi correspond une méthode. Si c’est pas le cas, pas de panique, on va rentrer dans le détail juste en dessous ;)

Comme pour les attributs, je vais vous montrer un morceau de code. **Avant de passer à la suite, lisez le attentivement et essayez de comprendre ce qu’il se passe !**

```python
from typing import Dict

class Warehouse:

    def __init__(self, location: str, manager: str, storage: Dict[str, int]) -> None:
        self.location = location
        self.manager = manager
        self.storage = storage

    def compute_total_items(self) -> int:
        return sum(self.storage.values())

items = {"item1": 24, "item2": 42, "item3": 56}
warehouse_one = Warehouse("Paris", "Tom Felton", items)

total_items = warehouse_one.compute_total_items()
print(total_items)

```

- Ce qu’il se passe
    
    1. on déclare la classe.
        
    2. On crée un dictionnaire avec les items
        
    3. On _instancie_ la classe Warehouse dans la variable warehouse_one, et on lui passe les arguments suivant:
        
    
    - Paris (pour la localisation)
    - Tom Felton (en tant que manager)
    - le dictionnaire déclaré juste au dessus (pour éviter que cette ligne de code soit trop longue)
    
    4. Juste en dessous, on utilise _la méthode_ .compute_total_items(), qui se décompose comme suit:
    
    - on récupère le dictionnaire items contenu dans self.storage
    - on utilise .values() pour récupérer [24, 42, 56]
    - on fait la somme de ces chiffres: [24, 42, 56] ( = 112)
    - on _return_ cette valeur, ce qui fait que 112 se retrouve assigné à la variable “total_items)
    - on print(total_items)

Si vous avez remarqué qu’une fonction avec un _self_ à l’intérieur s’appelle en commençant par l’instance, bravo 🙂

Essayez d’appeler compute_total_items() sans rien avant:

- résultat
    
    Python nous dit que “compute_total_items” n’est pas défini.
    
    Pourtant, on a bien créé un truc qui _ressemble_ à une fonction. Mais comme cette _espèce de fonction_ appartient à la classe Warehouse, on appelle ça une _méthode_, et on ne peut l’appeler qu’en utilisant l’instance de la classe qui contient cette méthode 🙂
    

💡 Les plus attentifs d’entre vous auront remarqué qu’on a déjà fait plusieurs fois un truc similaire:

```python
"3".zfill(4)  # zfill est une _méthode_ de la classe String
```


```python
{"item1": 24, "item2": 42, "item3": 56}.values()  
# .values() est une _méthode_ de la classe Dict
```


Pour pouvoir mettre l’une ou l’autre de ces méthodes dans la fonction type(), il faut d’abord instancier la classe, même en créant une string vide:

```python
type("hello".zfill)  # fonctionne
type("".zfill)  # fonctionne aussi: une str vide reste une str ;) 
type(zfill)  # ne marchera pas
```


Pratique: créez une méthode qui renvoie la moyenne des articles

- hint
    
    divisez la somme de tous les items par le nombre d’items différents
    
- hint 2
    
    utilisez la fonction sum() et la fonction len()
    
- Solution
    
    ```python
    from typing import Dict
    
    class Warehouse:
    
        def __init__(self, location: str, manager: str, storage: Dict[str, int]) -> None:
            self.location = location
            self.manager = manager
            self.storage = storage
    
        def compute_total_items(self) -> int:
            return sum(self.storage.values())
    
        def compute_mean_items(self) -> float:
            return self.compute_total_items() / len(self.storage)
    
    items = {"item1": 24, "item2": 42, "item3": 56}
    warehouse_one = Warehouse("Paris", "Tom Felton", items)
    
    mean_items = warehouse_one.compute_mean_items()
    print(mean_items)
    
    ```
    

<aside> 🥇

In fine, tout l’objet de ce détour était de vous expliquer la différence entre une fonction et une méthode.

Ca a fait office de prétexte pour vous présenter la POO rapidement.

Je dis rapidement, parce qu’il y a encore **beaucoup de choses** à dire sur la POO.

J’ai simplement voulu rentrer dans ces concepts pour que vous n’arriviez pas en entretien sans savoir ce que sont un un objet, une classe, une instance, une méthode ou un attribut.

</aside>

---
---


# datasceintest

La définition du constructeur se fait avec la méthode nommée**`__init__`**qui nous permet d'initialiser les**attributs**de l'objet que nous voulons construire (attention au fait qu'il y a 2 underscores avant et 2 underscores après init) :

```python
   # Définition de la classe Car
   class Car:
      # Définition du constructeur de la classe Car
      def __init__(self, color, model, horsepower):
          # Initialisation des attributs de la classe avec les arguments du constructeur
          self.color = color
          self.model = model
          self.horsepower = horsepower
```

L'argument **`self`** correspond à **l'objet appelant la méthode**. Cet argument nous permet d'accéder aux attributs de l'objet au sein de la méthode.

**Toutes les méthodes** d'une classe doivent avoir comme **premier argument** l'argument **`self`** car les méthodes d'une classe reçoivent systématiquement l'objet qui les appelle en argument.

Nous pouvons définir d'autres méthodes au sein de cette classe :

```python
   # Définition de la classe Car
  class Car:
      # Définition du constructeur de la classe Car
      def __init__(self, color, model, horsepower):
         # Initialisation des attributs de la classe avec les arguments du constructeur
         self.color = color
         self.model = model
         self.horsepower = horsepower

      # Définition d'une méthode permettant de changer la couleur d'une voiture
      def change_color(self, new_color):
          self.color = new_color
```

Pour créer un objet de cette classe, nous devons utiliser la syntaxe suivante :

```python
   # Création d'un objet de la classe Car
   aventador = Car(color = "orange",
                   model = "Aventador",
                   horsepower = 700)
```

Pour créer l'objet, `Car` s'utilise comme une fonction. En fait, Python fait appel à la méthode `__init__` de la classe `Car` en lui renseignant les arguments que nous avons utilisés dans la "fonction" `Car`.  
C'est pourquoi on appelle aussi la fonction `Car()` le constructeur de la classe.

Le processus de construction d'un objet et d'assignation à une variable s'appelle **l'instanciation**.

On dit que `aventador` est une **instance** de la classe `Car`.

## **2. Classes et Documentations**

Pour être utilisable, une classe doit toujours être **proprement documentée**.  
Comme pour les fonctions, l'écriture de la documentation d'une classe commence et termine avec trois guillemets `"""` :

```python
  class Car:
       """
       La classe Car permet de construire une voiture.

       Paramètres
       ----------
       color : Chaîne de caractères : Couleur de la voiture.
       model : Chaîne de caractères : Modèle de la voiture.
       horsepower : Entier : Puissance de la voiture.

       Exemple
       -------
       aventador = Car(color = "orange", model = "Aventador", horsepower = 700)
       """
     def __init__(self, color, model, horsepower):
          self.color = color
          self.model = model
          self.horsepower = horsepower

     def change_color(self, new_color):
         """
          Modifie la couleur d'une voiture.

          Paramètres
          ----------
          new_color : Chaîne de caractères : Nouvelle couleur de la voiture.
          """
          self.color = new_color
```

À présent, lorsqu'un utilisateur a besoin d'aide pour utiliser cette classe, il peut utiliser la fonction **`help`** pour afficher sa documentation :

```python
  help(Car)
```

```
   class Car(builtins.object)
    |  Car(color, model, horsepower)
    |  
    |  La classe Car permet de construire une voiture.
    |  
    |  Paramètres
    |  ----------
    |  color : Chaîne de caractères : Couleur de la voiture.
    |  model : Chaîne de caractères : Modèle de la voiture.
    |  horsepower : Entier : Cylindrée de la voiture.
    |  
    |  Exemple
    |  -------
    |  aventador = Car(color = "orange", model = "Aventador", horsepower = 700)
    |  
    |  Methods defined here:
    |  
    |  __init__(self, color, model, horsepower)
    |      Initialize self.  See help(type(self)) for accurate signature.
    |  
    |  change_color(self, new_color)
    |      Modifie la couleur d'une voiture.
    |      
    |      Paramètres
    |      ----------
    |      new_color : Chaîne de caractères : Nouvelle couleur de la voiture.
```

L'intérêt d'une documentation est d'être **lue et comprise par d'autres utilisateurs**.  
Elle nous permet aussi de comprendre l'intérêt d'une méthode que nous avions définie et dont nous avons oublié l'utilité.

La documentation est la **première** ressource à consulter pour comprendre comment manipuler une classe.  
Toutes les classes que vous utiliserez dans votre formation ont des documentations **très complètes**. Néanmoins, elles peuvent être difficiles à comprendre avec peu d'expérience.


## 3. Les Modules

Un module (aussi connu sous le nom _package_ ou _librairie_) est un fichier Python contenant des définitions de classes et de fonctions.

Les modules permettent de réutiliser des fonctions déjà écrites sans avoir à les copier.

Les modules sont facilement partageables et en général les modules se spécialisent dans des tâches très spécifiques comme :

> - La manipulation de données (`pandas`).
> 
> - Le calcul optimisé (`numpy`).
> 
> - Le traçage de graphiques (`matplotlib`).
> 
> - Le machine learning (`scikit-learn`).

Toutes les tâches de Data Science que vous verrez dans votre formation dépendent de modules écrits par d'autres développeurs.  
Ces modules font toute la richesse du langage Python et l'absence de ces modules ferait de Python un langage sous-optimal pour la Data Science.

Il existe de nombreux langages de programmation plus performants que Python. Néanmoins, tant que les modules que nous utilisons ne seront pas disponibles dans ces langages, il sera très difficile de migrer.

Afin d'importer un module, il faut utiliser le mot-clé **`import`** :

```python
   # On importe toute la librairie Numpy
   import numpy
```

Pour utiliser une fonction de ce module, il faut y accéder en passant par le module :

```python
   x = 0

   # La fonction 'cos' de numpy permet de calculer le cosinus d'un nombre
   print(numpy.cos(x))
   >>> 1.0
```

Il n'est pas très pratique de devoir écrire `numpy` à chaque fois que nous voulons utiliser une fonction de ce module.  
Pour cela, nous pouvons **abréger** son nom à l'aide du mot clé **`as`** :

```python
   # On importe numpy et on abrège son nom avec 'np'
   import numpy as np

   x = 0
   print(np.cos(x))
   >>> 1.0
```

On dit que `np` est l'**alias** de `numpy`.

Cette pratique est très souvent utilisée. Dans le reste de votre formation, vous verrez très souvent les instructions :

```python
   import numpy as np
   import pandas as pd
   import matplotlib.pyplot as plt
```

Si on ne souhaite pas importer le module entièrement, il est possible de n'importer que **quelques** fonctions ou classes du module à l'aide du mot-clé **`from`** :

```python
   # On n'importe que les fonctions cos, sin et exp du module numpy
   from numpy import cos, sin, exp
```



---
---

### Les Classes

En Python, une classe est définie de la manière suivante:  

```python
class Vehicule: # définition de la classe Vehicule
   def __init__(self, a, b = []):
       self.seats = a  # nombre de places dans le vehicule  
       self.passengers = b  #liste contenant le nom des passagers
   def print_passengers(self):
       for i in range(len(self.passengers)):
           print(self.passengers[i])

voiture1= Vehicule(4, ['Pierre','Adrian']) # déclaration d'un objet de la classe Vehicule
```

  
Le code ci-dessus correspond à la définition d'une classe nommée `Vehicule` qui contient 2 informations: le nombre de places du `Vehicule` dans la variable **seats** et les noms des passagers à bord du `Vehicule` dans la variable **passengers**.

Cette classe contient une méthode `print_passengers` qui permet d’afficher les noms des passagers à bord dans la console.

L'instruction `voiture1 = Vehicule(4, ['Pierre', 'Adrian'])` correspond à une _instanciation_ de la classe `Vehicule`.

#### Remarques et définitions importantes

- `Vehicule` est une _classe_ d'objets.
- **voiture1** est une _instance_ de la classe `Vehicule`
- **seats** et **passengers** sont appelés les _attributs_ ou _membres_ de la classe `Vehicule`
- Les fonctions définies dans la classe `Vehicule` comme `print_passengers` et `__init__` sont appelées les _méthodes_ de la classe `Vehicules`
- La méthode `__init__` prend en argument les variables qui définiront les attributs d’une instance lors de sa création.  
    
La méthode `__init__` est automatiquement appelée lors de l’instanciation de n’importe quelle classe.
    
Toutes les méthodes définies au sein d’une classe ont comme premier paramètre l’argument `self`. Ce paramètre sert à préciser à la méthode l’instance qui l’a appelée.

Une fois qu'un objet d'une classe est instancié, il est possible d'acceder à ses attributs et méthodes en utilisant les commandes `.attribut` et `.methode()` comme ci-dessous:

```python
class Vehicule:
    def __init__(self, a, b=[]):
        self.seats = a
        self.passengers = b
    def print_passengers(self):
        for i in range(len(self.passengers)):
            print(self.passengers[i])



#Lancez la cellule. Vous pouvez modifier l'instanciation pour faire apparaître les modifications.
voiture2 = Vehicule(4,['Dimitri', 'Charles', 'Yohan'])

print(voiture2.seats)          # Affichage de l'attribut seats
voiture2.print_passengers()    # Execution de la méthode print_passengers 
```

La flexibilité des classes en programmation orientée objet permet au développeur d'enrichir une classe en lui ajoutant de nouveaux attributs et méthodes. Toutes les instances de cette classe pourront ensuite faire appel à ces méthodes. Par exemple, nous pouvons définir dans la classe `Vehicule` une nouvelle méthode `add` qui ajoutera un individu dans la liste des passagers:  

```python
   class Vehicule:
       def __init__(self, a, b=[]):
           self.seats = a
           self.passengers = b
       def print_passengers(self):
           for i in range(len(self.passengers)):
               print(self.passengers[i])


       def add(self,name): #Nouvelle méthode
           self.passengers.append(name)
```

En Python, une liste est une instance de la classe prédéfinie `list`. Ainsi, l'appel de la méthode `append` se fait de la même façon que l'appel d'une méthode de la classe `Vehicule` ou `Complexe`.

```python
class Vehicule:
    def __init__(self, a, b=[]):
        self.seats = a
        self.passengers = b
    
    def print_passengers(self):
        for i in range(len(self.passengers)):
            print(self.passengers[i])
    
    def add(self,name): #Nouvelle méthode
        self.passengers.append(name)
        

voiture1 = Vehicule(4, ['Charles', 'Paul']) #declaration de l'instance voiture1
voiture1.add('Raphaël')                     #ajout de 'Raphaël' dans la liste des passagers

voiture1.print_passengers()                 #affichage de la liste des passagers dans la console
```

- Définir dans la classe `Complexe` une méthode `add` qui prend en paramètre un `Complexe` et le somme à l'instance appelant la méthode. Le résultat de cette somme sera stocké dans les attributs du `Complexe` appelant la méthode.

- Tester la nouvelle méthode `add` sur deux instances de la classe `Complexe` et afficher leur somme sur la console.

Ex : 
- Définir une nouvelle classe `Complexe` à 2 attributs:
    - **partie_re** qui contient la partie réelle du `Complexe`
    - **partie_im** qui contient la partie imaginaire `Complexe`

- Définir dans la classe `Complexe` une méthode `afficher` qui permet d'afficher un `Complexe` sous sa forme algébrique _a ± bi_. Il faudra adapter cette méthode au signe de la partie imaginaire (L'affichage devrait donner `4 - 2i`, `6 + 2i`, `5`).

- Définir dans la classe `Complexe` une méthode `add` qui prend en paramètre un `Complexe` et le somme à l'instance appelant la méthode. Le résultat de cette somme sera stocké dans les attributs du `Complexe` appelant la méthode.

- Instancier deux `Complexe` correspondant au nombres complexes 4+5𝑖 et 3−2𝑖 puis les afficher sur la console.

- Tester la nouvelle méthode `add` sur deux instances de la classe `Complexe` et afficher leur somme sur la console.

```python
class Complexe:
    def __init__(self, a, b):
        self.partie_re = a
        self.partie_im = b
    def afficher(self):
        if(self.partie_im < 0):
            print(self.partie_re,'-', -self.partie_im,'i')
        if(self.partie_im == 0):
            print(self.partie_re)
        if(self.partie_im > 0):
            print(self.partie_re, '+',self.partie_im,'i')
            
    def add(self, C):
        self.partie_re = self.partie_re + C.partie_re
        self.partie_im = self.partie_im + C.partie_im
        
C1 = Complexe(4, -1)
C2 = Complexe(-1, 3)

C1.add(C2)
C1.afficher()
```




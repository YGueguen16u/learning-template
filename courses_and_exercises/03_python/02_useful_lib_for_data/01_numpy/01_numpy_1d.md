# <h1>NumPy : Tableaux unidimensionnels</h1>


## <h2>Table of Contents</h2>

<div class="alert alert-block alert-info" style="margin-top: 20px">
<ul>
  <li><a href="#intro">Introduction</a></li>
  <li><a href="#creation">Création de tableaux</a></li>
  <ul>
    <li><a href="#from-list">Depuis une liste Python</a></li>
    <li><a href="#from-list-comprehension">Depuis une liste Python par compréhension</a></li>
    <li><a href="#quick-creation">Fonctions de création rapide</a></li>
    <ul>
      <li><a href="#zeros">Tableaux remplis de zéros</a></li>
      <li><a href="#ones">Tableaux remplis de uns</a></li>
      <li><a href="#eye">Matrice identité</a></li>
      <li><a href="#empty">Tableau vide</a></li>
      <li><a href="#arange">Plage de valeurs</a></li>
      <li><a href="#linspace">Plage linéaire</a></li>
      <li><a href="#logspace">Tableaux logarithmiques</a></li>
      <li><a href="#random">Tableaux aléatoires</a></li>
    </ul>
  </ul>
  <li><a href="#properties">Propriétés des tableaux</a></li>
  <li><a href="#indexing">Indexation</a></li>
  <li><a href="#slicing">Découpage (Slicing)</a></li>
  <li><a href="#operations">Opérations mathématiques et vectorisation</a></li>
  <li><a href="#functions">Fonctions utiles</a></li>
  <li><a href="#dtype">Gestion des types (`dtype`)</a></li>
  <li><a href="#broadcasting">Broadcasting</a></li>
  <li><a href="#performance">Performance et comparaison avec les listes Python</a></li>
  <li><a href="#best-practices">Bonnes pratiques</a></li>
  <li><a href="#exercises">Exercices</a></li>
</ul>
</div>


## <h2 id="intro">Introduction</h2>

**NumPy** est une bibliothèque Python fondamentale pour les calculs scientifiques.
Elle fournit :

* Des **tableaux multidimensionnels** efficaces (appelés `ndarray`).
* Des fonctions rapides pour le calcul numérique.
* Une interface optimisée en C pour des performances proches de langages bas-niveau.

Pour travailler sur des **tableaux unidimensionnels**, il faut comprendre :

* La différence avec les **listes Python**.
* Les **types homogènes** et les **opérations vectorisées**.

`numpy` (pour _Numerical Python_) est une bibliothèque numérique très avancée pour la manipulation de larges tableaux multidimensionnels et de routines mathématiques de haut niveau (algèbre linéaire, statistiques, fonctions mathématiques complexes etc...).

La classe d'objets que nous allons principalement manipuler est la classe **`array`** de `numpy`.

Ces arrays correspondent à des matrices N-dimensionnelles qui pourront contenir des données très diverses comme des données tabulaires, des séries temporelles ou des images.

L'intérêt du module `numpy` repose sur la possibilité d'appliquer des opérations sur ces arrays de manière très efficace, c'est-à-dire que le nombre de **lignes de code** nécessaires et le **temps de calcul** pour effectuer ces opérations seront très réduits par rapport à une syntaxe Python traditionnelle.

NumPy est **10 à 100 fois plus rapide** grâce à l’implémentation en C et à la vectorisation.

<h3 id="importation">1. Importation</h3>

```python
import numpy as np
```

<h2 id="creation">Création de tableaux</h2>
ref : [01_Creation/00_creation.md]


<h2 id="properties">Propriétés des tableaux et Fonctions de manipulation</h2>

<h3 id="shape">Forme et dimensions</h3>

- **`shape`** : Returns a tuple representing the dimensions of the array (tuple).
  - The tuple format of the shape is (rows, columns, depth) and is useful for iteration.
  - `ndarray.shape` returns the shape of the array.
    - attribute
    - return : `tuple`
  - `np.shape(ndarray)` returns the shape of the array.
    - function :
      - arg : `ndarray`
      - return : `tuple`

- **`ndim`** : Returns the number of dimensions of the array (integer).
  - `ndarray.ndim` returns the number of dimensions of the array.
    - attribute
    - return : `int`
  - `np.ndim(ndarray)` returns the number of dimensions of the array.
    - function
      - arg : `ndarray`
      - return : `int`

- **`size`** : Returns the total number of elements in the array (integer).
  - `ndarray.size` returns the total number of elements in the array.
    - attribute
    - return : `int`
    - `ndarray.size = np.prod(ndarray.shape)` : `np.prod` returns the product of the array shape.
  - `np.size(ndarray)` returns the total number of elements in the array.
    - function
      - arg : `ndarray`
      - `axis` : the axis along which to perform the operation.
      - return : `int`

```python
arr = np.array([10, 20, 30, 40, 50])
arr_2 = np.array([[10, 20, 30], [40, 50, 60]])
arr_3 = np.array([[[10, 20, 30], [40, 50, 60]], [[10, 20, 30], [40, 50, 60]]])

# shape
print(arr.shape)   # (5,)
print(arr.shape[0])  # 5
print(arr_3.shape[2])  # 3

print(np.shape(arr))  # (5,)
print(np.shape(arr_3)[1])  # 2

# ndim
print(arr.ndim)    # 1
print(arr_2.ndim)  # 2
print(np.ndim(arr_3))  # 3

# size
print(arr.size)    # 5
print(np.size(arr_2))  # 6
print(np.size(arr_3, axis=0))  # 2


for i in range(arr_3.shape[0]):
    for j in range(arr_3.shape[1]):
        for k in range(np.shape(arr_3)[2]):
            print(arr_3[i, j, k])
```


<h3 id="type-size">Type et taille mémoire</h3>

**`dtype`** : Returns the data type of the array (dtype).
  - `ndarray.dtype` returns the data type of the array.
    - attribute
    - return : `dtype`
  - `np.dtype(dtype)` returns the data type of the array.
    - function
      - arg : `dtype`
      - return : `dtype`

**`itemsize`** : Returns the size of each element in bytes (integer).
  - `ndarray.itemsize` returns the size of each element in bytes.
    - attribute
    - return : `int`


**`nbytes`** : Returns the total size of the array in bytes (integer).
  - `ndarray.nbytes` returns the total size of the array in bytes.
    - attribute
    - return : `int`

```python
print(arr.dtype)   # int64 (selon l'OS)
print(arr.itemsize)  # 8 (octets)
print(arr.nbytes)    # 40 (octets)
```


<h2 id="indexing">Indexation</h2>

```python
arr = np.array([10, 20, 30, 40, 50])

print(arr[0])   # 10
print(arr[-1])  # 50
```

![alt text](image.png)



<h3 id="boolean-indexing">Indexation booléenne</h3>

```python
# Indexation booléenne
arr = np.array([10, 20, 30, 40, 50])
mask = arr > 25
print(mask)        # [False False  True  True  True]
print(arr[mask])   # [30 40 50]

# 2. Indexation avec une liste
X = np.array([3, -7, -10, 3, 6, 5, 2, 9])
y = np.array([0, 1, 1, 1, 0, 1, 0, 0])
print(X[y])  # [3 -7 -10 6 2]
X_2 = X.copy()
X_2[y == 1] = -1
print(X_2)  # [3 -1 -10 6 2]
```

<h3 id="slicing">Découpage (Slicing)</h3>

<h4>Syntaxe générale</h4>

```python
array[start:stop:step]
```

![alt text](image-1.png)

![alt text](image-2.png)

```python
arr_2 = np.array([[1, 2, 3, 4], [4, 5, 6, 7], [7, 8, 9, 10]])
print(arr_2[0, 0])  # 1
print(arr_2[-1, -1])  # 6
print(arr_2[0, -1])  # 3
print(arr_2[0, ::-1])


arr_2[0, 0] = 10
print(arr_2)
print(arr_2[0, 1:3])
print(arr_2[1:3, 1:3])

arr_4 = np.array([[[[1, 2, 3], [4, 5, 6]], [[1, 2, 3], [4, 5, 6]]]])
print(arr_4[0, 0, 0, 0])  # 1
print(arr_4[-1, -1, -1, -1])  # 6
print(arr_4[0, 0, -1, -1])  # 6
print(arr_4[0, -1, -1, -1])  # 6
print(arr_4[0, 0, 0, ::-1])

arr_4[0, 0, 0, 0] = 10
print(arr_4)
print(arr_4[0, 1, 1:4, 1:3])
```

<h4>Slicing avancé</h4>

```python
arr = np.arange(10)
print(arr[::2])    # [0 2 4 6 8]
print(arr[1::2])   # [1 3 5 7 9]
```

<h3 id='copy'>Copie</h3>

- `copy` : Returns a `deep copy` of the array.
  - copy the value of the array to a new array.
    - ids of the new array and its elements are different from the original array.
  - `ndarray.copy()` returns a copy of the array.
    - attribute
    - return : `ndarray`
  - `np.copy(ndarray)` returns a copy of the array.
    - function
      - arg : `ndarray`
      - return : `ndarray`

- `ndarray[:]` : Returns a `view` of the array.
  - different id from the original array, however the elements id are the same.

```python
arr = np.array([1, 2, 3, 4, 5])
arr_2 = arr.copy()
arr_3 = arr[:]

arr_2[0] = 10
arr_3[0] = 20
print(arr)    # [20 2 3 4 5]
print(arr_2)  # [10 2 3 4 5]
print(arr_3)  # [20 2 3 4 5]

print(id(arr))  # 4339060624
print(id(arr_2))  # 4339122416
print(id(arr_3))  # 4349672976

for i in range(arr.shape[0]):
    print(f"first element : id(arr[{i}]) = {id(arr[i])}, id(arr_2[{i}]) = {id(arr_2[i])}, id(arr_3[{i}]) = {id(arr_3[i])}")
    
```


## <h2 id="operations">Opérations mathématiques et vectorisation</h2>

### **1. Opérations élémentaires**

```python
arr = np.array([1, 2, 3, 4, 5])
print(arr + 10)   # [11 12 13 14 15]
print(arr * 2)    # [ 2  4  6  8 10]
print(arr ** 2)   # [ 1  4  9 16 25]
```

### **2. Opérations entre tableaux**

```python
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])

print(a + b)  # [5 7 9]
print(a * b)  # [4 10 18]
```

### **3. Fonctions universelles (`ufuncs`)**

```python
arr = np.array([1, 2, 3, 4, 5])

print(np.sqrt(arr))
print(np.exp(arr))
print(np.log(arr))
```

## <h2 id="functions">Fonctions utiles</h2>

| Fonction                            | Description                  |
| ----------------------------------- | ---------------------------- |
| `np.sum(arr)`                       | Somme des éléments           |
| `np.mean(arr)`                      | Moyenne                      |
| `np.std(arr)`                       | Écart-type                   |
| `np.var(arr)`                       | Variance                     |
| `np.min(arr)` / `np.max(arr)`       | Min/Max                      |
| `np.argmax(arr)` / `np.argmin(arr)` | Index du max/min             |
| `np.sort(arr)`                      | Tri sans modifier l'original |
| `np.unique(arr)`                    | Éléments uniques triés       |

**Exemple**

```python
arr = np.array([1, 2, 2, 3, 4, 4, 5])
print(np.unique(arr))  # [1 2 3 4 5]
```

## <h2 id="dtype">Gestion des types (`dtype`)</h2>

### **Vérifier et convertir les types**

```python
arr = np.array([1, 2, 3], dtype=np.float32)
print(arr.dtype)  # float32

arr_int = arr.astype(np.int32)
print(arr_int.dtype)  # int32
```

## <h2 id="broadcasting">Broadcasting</h2>

Le **broadcasting** permet d'effectuer des opérations entre des tableaux de dimensions différentes **sans boucle explicite**.

```python
arr = np.array([1, 2, 3, 4, 5])
print(arr + 10)  # [11 12 13 14 15]
```

Cas avancé :

```python
vector = np.array([1, 2, 3])
matrix = np.array([[10], [20], [30]])
print(matrix + vector)
```

## <h2 id="performance">Performance et comparaison avec les listes</h2>

```python
import time

size = 10_000_000
lst = list(range(size))
arr = np.arange(size)

# Liste Python
start = time.time()
lst2 = [x*2 for x in lst]
print("List:", time.time() - start)

# NumPy
start = time.time()
arr2 = arr * 2
print("NumPy:", time.time() - start)
```

NumPy est **10 à 100 fois plus rapide** grâce à l’implémentation en C et à la vectorisation.

## <h2 id="best-practices">Bonnes pratiques</h2>

* Toujours **privilégier les opérations vectorisées**.
* Vérifier le **dtype** pour éviter des conversions implicites coûteuses.
* Utiliser des **slices** plutôt que des copies quand possible.
* Privilégier `np.copy()` ou `deepcopy` si vous modifiez des données sensibles.

## <h2 id="exercises">Exercices</h2>

### **Exercice 1 : Création**

* Créez un tableau avec les valeurs `[10, 20, 30, 40, 50]`.
* Convertissez-le en `float32`.

### **Exercice 2 : Indexation**

* À partir de `np.arange(1, 11)`, récupérez :

  * Le premier élément
  * Les trois derniers
  * Tous les nombres pairs

### **Exercice 3 : Opérations**

* Calculez la somme, la moyenne et l’écart-type d’un tableau `np.arange(1, 21)`.

### **Exercice 4 : Broadcasting**

* Ajoutez `10` à un tableau `np.arange(5)` sans boucle.
* Multipliez-le par un tableau `[2, 4, 6, 8, 10]`.

### **Exercice 5 : Performance**

* Comparez le temps de calcul entre une liste Python et un tableau NumPy pour multiplier par 2 un tableau de `10_000_000` entiers.



---
---

# DataScientest



## **3. Opérations sur les arrays Numpy : Exemple**
Le module `numpy` ne sert pas qu'à créer des matrices. La plupart du temps, les matrices seront créées à partir de vraies données.

L'interêt du module `numpy` est son code **optimisé** qui permet d'effectuer des calculs sur de grandes matrices en un temps très réduit.

Le module `numpy` contient des fonctions mathématiques de base telles que :

|Fonction|Fonction Numpy|
|---|---|
|𝑒𝑥|`np.exp(x)`|
|log(𝑥)|`np.log(x)`|
|sin(𝑥)|`np.sin(x)`|
|cos(𝑥)|`np.cos(x)`|
|Arrondi à **`n`** décimales|`np.round(x, decimals = n)`|

La liste complète d'opérations mathématiques de `numpy` est donnée [ici](https://numpy.org/doc/stable/reference/routines.math.html).

Ces fonctions peuvent être appliquées sur tous les arrays `numpy`, peu importe leurs dimensions :

```python

   X = np.array([i/100 for i in range(100)])  # 0, 0.01, 0.02, 0.03, ..., 0.98, 0.99

   # Calcul de l'exponentielle de x pour x = 0, 0.01, 0.02, 0.03, ..., 0.98, 0.99
   exp_X = np.exp(X)
```

Dans la cellule suivante, nous avons créé l'array :

$$𝑋=(00.010.02...0.980.99)$$

- **(a)** Définir une fonction `f` prenant en argument un array `X` et permettant de calculer en **une seule ligne de code** la fonction suivante :

> $$𝑓(𝑥)=exp(sin(𝑥)+cos(𝑥))$$

- **(b)** Afficher les **10 premiers** éléments du résultat **arrondi à 2 décimales** de la fonction `f` appliquée à l'array `X`.

- **(c)** Définir une fonction `f_python` qui effectue la même opération $𝑓(𝑥)=exp(sin(𝑥)+cos(𝑥))$ sur chaque élément de X à l'aide d'une boucle `for`.
    
    > Les dimensions d'un array `X` peuvent être récupérées à l'aide de l'attribut **`shape`** de `X` qui est un **tuple** : `shape = X.shape`.
    > 
    > Pour un array à **une** dimension, le nombre d'éléments contenus dans cet array correspond au **premier** élément de sa shape : `n = X.shape[0]`.


## Conclusion

```python
def f(X):
    return np.exp(np.sin(X) + np.cos(X))
  
def f_python(X):
    n = X.shape[0]
    for i in range(n):
        X[i] = np.exp(np.sin(X[i]) + np.cos(X[i]))
    return X  

from time import time

# Création d'un array à 10 millions de valeurs
X = np.array([i/1e7 for i in range(int(1e7))])

heure_debut = time()
f(X)
heure_fin = time()

temps = heure_fin - heure_debut

print("Le calcul de f avec numpy a pris", temps, "secondes")

heure_debut = time()
f_python(X)
heure_fin = time()

temps = heure_fin - heure_debut

print("Le calcul de f avec une boucle for a pris", temps, "secondes")
```

```
Le calcul de f avec numpy a pris 0.12964272499084473 secondes
Le calcul de f avec une boucle for a pris 42.54175567626953 secondes
```

Comme vous pouvez le voir, le temps de calcul avec une boucle for est extrêmement long.

C'est pourquoi il est toujours préférable d'effectuer des calculs sur des matrices à l'aide de numpy plutôt qu'avec des boucles. Ce sera le cas lorsque nous ferons des statistiques sur des données.


---

# Manipulation des arrays numpy

## **1. Indexation Conditionnelle d'un array Numpy**
Dans le notebook précédent, nous avons vu comment indexer un array à l'aide du **slicing** sur plusieurs dimensions :

  
![](https://assets-datascientest.s3-eu-west-1.amazonaws.com/train/indexation_array_slicing2.png)  

Une technique plus avancée consiste à indexer les éléments d'un array à l'aide d'une **condition**. Ceci permet d'accéder et modifier facilement des éléments qui respectent une condition spécifique :

```python
  # Création d'un array de dimension 3x3
   X = np.array([[-1, 0, 30],
                 [-2, 3, -5],
                 [5, -5, 10]])

   # On assigne à tous les éléments négatifs la valeur 0
   X[X<0] = 0

   # Affichage de la matrice modifiée
   print(X)
   >>> [[ 0  0 30]
   >>>  [ 0  3  0]
   >>>  [ 5  0 10]]
```

De plus, il est possible d'indexer un array à l'aide d'une condition **évaluée sur un autre array** :

```python

   # Création de 2 arrays à 8 éléments
   X = np.array([3, -7, -10, 3, 6, 5, 2, 9])

   y = np.array([0, 1, 1, 1, 0, 1, 0, 0])

   # On assigne la valeur -1 aux éléments de X pour lesquels la valeur de y à l'indice correspondant vaut 1
   X[y == 1] = -1

   # Affichage de X
   print(X)
   >>> [3 -1 -1 -1 6 -1 2 9]

   # Affichage des éléments de X pour lesquels la valeur de y à l'indice correspondant vaut 0
   print(X[y == 0])
   >>> [3 6 2 9]
```


Nous disposons de données d'un supermarché américain qui se prépare pour le [Black Friday](https://en.wikipedia.org/wiki/Black_Friday_\(shopping\)), une journée où les commerces américains proposent de très grandes réductions pour finir leurs saisons.

Ces données sont distribuées sur 3 arrays :

> - `items` : Le nom des objets qui seront en promotion.
> 
> - `quantities` : Le stock disponible pour chaque objet en promotion.
> 
> - `discounts` : La réduction de prix de chaque objet. Les objets peuvent avoir une réduction de 25, 50, 75 ou 90 pourcents.

- **(a)** Lancer la cellule suivante pour instancier les arrays contenant les données du supermarché.

```python
import numpy as np

items = np.array(["grid paper","plate","rubber band","key chain","bread","speakers","chocolate",
                  "fridge","bowl","shirt","truck","canvas","monitor","piano","sailboat","clamp",
                  "spring","picture frame","knife","hanger","pool stick","buckel","vase","wagon",
                  "balloon","thread","couch","drawer","packing peanuts","bottle","needle",
                  "rusty nail","blanket","lamp","box","cookie jar","washing machine","paint brush",
                  "puddle","sketch pad","sandal","doll","floor","sidewalk","sand paper","stockings",
                  "bag","perfume","magnet","fake flowers","street lights","carrots","purse","thermostat",
                  "candle","mouse pad","remote","clothes","rubber duck","hair brush","computer","toe ring",
                  "scotch tape","nail file","window","table","model car","toothbrush","shoes","leg warmers",
                  "cat","pillow","rug","hair tie","phone","tooth picks","broccoli","newspaper","towel",
                  "watch","lotion","apple","pants","air freshener","pen","lace","car","headphones",
                  "charger","toilet","candy wrapper","soy sauce packet","sticky note","shoe lace",
                  "zipper","soda can","bed","cell phone","lip gloss","thermometer"])

quantities = np.array([310, 455, 295, 613, 812, 907, 564, 904, 829, 167, 517, 272, 416, 14, 251, 476, 757, 343, 472, 71, 160, 996, 182, 721, 565, 582, 279,  66, 297, 800, 914,  69, 498, 885, 114, 876, 635, 295, 146, 601, 941, 100, 370, 467, 423, 101, 504, 298, 757, 291, 163, 970, 921, 953, 458, 381, 692, 393, 749, 285, 454, 174,  37, 289, 863, 885, 331, 585, 678, 834, 349, 732, 149, 486, 993, 869, 967, 537, 220,  15, 457, 483, 387, 180, 579, 155, 134, 163, 314, 334, 429, 154, 18, 426, 363, 146, 454, 902, 145, 95])

discounts = np.array([25, 25, 50, 25, 50, 50, 50, 25, 50, 50, 25, 25, 25, 25, 50, 75, 25, 50, 50, 50, 25, 25, 25, 25, 75, 50, 25, 25, 25, 25, 90, 50, 25, 25, 25, 50, 50, 25, 25, 75, 75, 50, 25, 25, 50, 25, 90, 90, 50, 90, 25, 25, 25, 25, 25, 25, 25, 50, 25, 25, 75, 50, 50, 25, 50, 25, 25, 50, 25, 75, 25, 25, 50, 25, 25, 50, 75, 25, 25, 90, 25, 75, 25, 25, 25, 25, 25, 25, 50, 50, 75, 25, 50, 25, 25, 50, 25, 25, 25, 75])
```

- **(b)** À l'aide d'une indexation conditionnelle sur `items` et `quantities`, afficher le nom et la quantité de chaque objet qui aura une réduction de 90%.
```python
# Affichage du nom des objets dont la réduction est de 90%
print(items[discounts == 90])

# Affichage de la quantité des objets dont la réduction est de 90%
print(quantities[discounts == 90])
```

- **(c)** Vous souhaitez vous acheter un nouveau téléphone portable (`"cell phone"`) et des enceintes sonores (`"speakers"`). Déterminer à l'aide d'une indexation conditionnelle sur `discounts` la réduction qui leur sera accordée.
```python
print(f"pour les cell phones et les speakers : {discounts[(items == 'cell phone') | (items == 'speakers')]}")
# !!! utioliser | and not or with numpy

# or 

reduction_telephone = discounts[items == 'cell phone']
print("Les téléphones auront une réduction de", reduction_telephone[0], "pourcents.")


reduction_enceintes = discounts[items == 'speakers']
print("Les enceintes auront une réduction de", reduction_enceintes[0], "pourcents.")

```

- **(d)** Le gérant du supermarché voudrait savoir quels objets risquent de partir très vite. Afficher le nom des objets dont la quantité est inférieure à 50 et la réduction qui leur est accordée.

- **(e)** Quel objet risque de partir **extrêmement** vite ?

```python
low_q = items[quantities <= 50]
low_d1 = discounts[quantities <= 50]

print(low_q, "\n",low_d1) # celui avec la plus grosse reduction
```


## **2. Itération sur les éléments d'un array**

Un pixel d'écran peut simuler une couleur en superposant 3 canaux correspondant aux couleurs rouge, vert et bleu.  
En variant l'intensité lumineuse de ces canaux, il est possible de parcourir une grande partie de la gamme des couleurs visibles par l'œil humain.

  
![](https://assets-datascientest.s3-eu-west-1.amazonaws.com/train/rgb_channels.png)  

Pour cette raison, une image en **couleurs** de dimensions 32x32 pixels est souvent représentée par un array de dimensions 32x32x3 où la 3ème dimension correspond à l'intensité lumineuse de chaque canal pour chaque pixel de l'image :

  
![](https://assets-datascientest.s3-eu-west-1.amazonaws.com/train/rgb_array.png)> Pour transformer une image en couleur en une image en **échelle de gris**, il suffit, **pour chaque pixel de l'image**, de faire la **moyenne** des intensités lumineuses des canaux de couleur.
> 
> Nous allons devoir itérer sur chaque pixel de l'image, mais pour les arrays numpy à plusieurs dimensions, les itérations doivent se faire **dimension par dimension** :
> 
```python
# Création d'un array de dimensions 32x32x3   (lignes x colonnes x canaux)
X = np.zeros(shape = (32, 32, 3))

# Itération sur la première dimension de l'array (les lignes)
for ligne in X:
	# Itération sur la deuxième dimension de l'array (les pixels de la ligne)a
    for pixel in ligne:
		# Itération sur la troisième dimension de l'array (les canaux du pixel)
		for canal in pixel:
		    ...
            ...
```
> 
> Un pixel de l'image est donc un array à 3 éléments correspondant aux intensités lumineuses des canaux.  
> Nous pourrons faire la moyenne de ces trois éléments pour obtenir l'intensité lumineuse du pixel en échelle de gris.

- **(c)** : Écrire une fonction nommée `rgb_to_gray` pour effectuer la conversion en niveaux de gris

> **1 .** Créer un nouveau tableau X_gray ayant le même nombre de lignes et de colonnes que l'image d'entrée, mais avec un seul canal.
> 
> **2 .** Parcourir l'image et calculer l'intensité moyenne pour chaque pixel.
> 
> **3 .** Stocker l'intensité moyenne à la position correspondante dans X_gray.


## **3. Redimensionnement d'un array**

La **shape** d'un array correspond à ses dimensions.  
De manière équivalente, redimensionner un array est connu sous le nom de **reshaping**.

Il arrive qu'un array de données ne soit pas de la dimension appropriée pour être **visualisé** ou **traité avec des algorithmes de machine learning** qui souvent ne peuvent traiter que des **vecteurs** et non des matrices.

Ainsi, il est possible à l'aide de la méthode **`reshape`** d'un array de reconstruire les données de l'array avec des dimensions différentes.  
L'argument de la méthode `reshape` est la shape que nous souhaitons obtenir :

- reshape : arg = int or tuple of int -> return : ndarray

```python
   # Création d'un array à partir d'une liste à 10 éléments
   X = np.array([i for i in range(1, 11)])   # 1, 2, ..., 10

   # Affichage des dimensions de X
   print(X.shape)
   >>> (10,)

   # Affichage de X
   print(X)
   >>> [1  2  3  4  5  6  7  8  9 10]

   # Reshaping de l'array en une matrice à 2 lignes et 5 colonnes
   X_reshaped = X.reshape((2, 5))

   # Affichage du nouvel array
   print(X_reshaped)
   >>> [[ 1  2  3  4  5]
   >>>  [ 6  7  8  9 10]]
```

Il est possible de redimensionner un array en n'importe quelle shape **tant que les deux shapes ont le même nombre d'éléments**.

Dans l'exemple précédent, l'array `X` contient 10 éléments et la shape que nous souhaitions aussi (2 x 5 = 10).

Dans la suite, nous allons brièvement explorer le jeu de données **`digits`** du module **scikit-learn**, un module Python permettant d'expérimenter avec des modèles de machine learning.

Le jeu de données **`digits`** contient **1797** images de chiffres manuscrits allant de 0 à 9. L'objectif de ce jeu de données est de trouver un algorithme de machine learning capable de lire des chiffres manuscrits.

Les images de ce jeu de données ont une résolution de **8x8 pixels en échelle de gris**.

- **(a)** Lancer la cellule suivante pour charger le jeu de données **digits** du module scikit-learn.

```python
# La fonction load_digits permet de charger le jeu de données "digits" dans un array
from sklearn.datasets import load_digits

# La fonction load_digits renvoie un dictionnaire contenant
# les données ainsi que d'autres informations sur le jeu de données
digits = load_digits()

# Les données des images se trouvent dans la clé "data"
X = digits['data']
```

> Toutes les images ont été chargées dans l'array `X`.

- **(b)** Afficher les dimensions de `X` à l'aide de l'attribut `shape`.

```python
print(X.shape)
```

L'array `X` contenant les images a les dimensions **1797 x 64**, ce qui ne correspond pas du tout aux dimensions des images.

Pour les rendre **compatibles** avec les algorithmes de scikit-learn qui **ne sont pas capables de traiter des données matricielles**, les 1797 images de dimensions 8x8 ont été **redimensionnées en vecteurs de taille 8x8 = 64**.

Ensuite, les 1797 vecteurs ont été **empilés** dans une **matrice** pour former `X`.  
Cela permet d'avoir **tout le jeu de données dans une seule matrice**.  
Chaque ligne de `X` correspond donc à une image qui a été transformée en vecteur.

Si nous voulons visualiser les images, nous devons redimensionner les vecteurs de 64 éléments en matrices de dimensions 8x8.  
En effet, les fonctions pour afficher des images ne peuvent traiter que des matrices et non des vecteurs.

Pour afficher les images contenues dans `X`, nous allons redimensionner `X` pour obtenir un array de dimensions 1797x8x8.

- **(c)** Stocker la matrice `X` redimensionnée avec la shape `(1797, 8, 8)` dans un array nommé **`X_reshaped`**.

- **(d)** Stocker l'image contenue à l'indice `1100` de `X_reshaped` dans un array nommé `img`.

```python
X_reshaped = X.reshape((1797, 8, 8))
img = X_reshaped[1100]
```

## **4. Concaténation d'arrays**

Il est parfois nécessaire de fusionner plusieurs arrays pour former un jeu de données.  
Pour cela, nous pouvons utiliser la fonction `np.concatenate` :

```python
   # Création de deux arrays de 2 lignes et 3 colonnes
   # Le premier est rempli de 1
   X_1 = np.ones(shape = (2, 3))
   print(X_1)
   >>> [[1. 1. 1.]
   >>>  [1. 1. 1.]]

   # Le deuxième est rempli de 0
   X_2 = np.zeros(shape = (2, 3))
   print(X_2)
   >>> [[0. 0. 0.]
   >>>  [0. 0. 0.]]

   # Concaténation des deux arrays sur l'axe des lignes
   X_3 = np.concatenate([X_1, X_2], axis = 0)
   print(X_3)
   >>> [[1. 1. 1.]
   >>>  [1. 1. 1.]
   >>>  [0. 0. 0.]
   >>>  [0. 0. 0.]]

   # Concaténation des deux arrays sur l'axe des colonnes
   X_4 = np.concatenate([X_1, X_2], axis = 1)
   print(X_4)
   >>> [[1. 1. 1. 0. 0. 0.]
   >>>  [1. 1. 1. 0. 0. 0.]]
```

> - Les arrays à concaténer doivent être renseignés sous forme d'une **liste** ou d'un **tuple**.
> 
> - L'argument **`axis`** définit sur **quelle dimension** les arrays doivent être concaténés. Il faut que, excepté sur cette dimension, les arrays soient de **même taille**.

  
![](https://assets-datascientest.s3-eu-west-1.amazonaws.com/train/concatenate_arrays.png)  

L'argument **`axis`** revient souvent dans les fonctions de `numpy`.  
Lorsqu'un array a 2 dimensions, on peut interpréter une opération sur **l'`axis` 0** comme une opération sur l'axe des **lignes** (la première dimension) et une opération sur **l'`axis` 1** comme une opération sur l'axe des **colonnes** (la deuxième dimension).

## Interprétation de axis dans numpy[](https://train.learn.datascientest.com/notebooks/660/39#Interpr%C3%A9tation-de-axis-dans-numpy)

Lorsqu'un array a 2 dimensions :

L'**`axis=0`** correspond à l'axe des lignes (première dimension).

Une concaténation sur axis=0 signifie ajouter des arrays **l'un en dessous de l'autre**.

L'**`axis=1`** correspond à l'axe des colonnes (deuxième dimension).

Une concaténation sur axis=1 signifie ajouter des arrays **côte à côte**.

- **(a)** Stocker l'image contenue à l'indice `560` de `X_reshaped` dans un array nommé `img1`.

- **(b)** Stocker l'image contenue à l'indice `561` de `X_reshaped` dans un array nommé `img2`.

- **(c)** Concaténer les arrays `img1` et `img2` **côte à côte** dans un array nommé `img3` .

```python
# Récupération des images
img1 = X_reshaped[560]
img2 = X_reshaped[561]

# Concaténation horizontale des images
img3 = np.concatenate([img1, img2], axis = 1)
```

- **(d)** Lancer la cellule suivante pour afficher le résultat de la concaténation.

```python
# Affichage de la première image
plt.subplot(1, 3, 1)
_ = plt.imshow(img1, cmap = 'gray')
_ = plt.axis("off")
_ = plt.title("Image 1")

# Affichage de la deuxième image
plt.subplot(1, 3, 2)
_ = plt.imshow(img2, cmap = 'gray')
_ = plt.axis("off")
_ = plt.title("Image 2")

# Affichage de la concaténation des images
plt.subplot(1, 3, 3)
_ = plt.imshow(img3, cmap = 'gray')
_ = plt.axis("off")
_ = plt.title("Concaténation Horizontale")

# Redimensionnement de l'affichage
fig = plt.gcf()
fig.set_size_inches((10,6))
```


--- 

# Opérations sur les arrays

## 1. Opérateurs arithmétiques

Numpy permet de faire des opérations mathématiques sur des tableaux de manière optimisée :

- Appliquer une des opérations arithmétiques de base (`/`, `*`, `-`, `+`, `**`) entre un tableau et une valeur, appliquera l'opération à **chacun des éléments** du tableau.

- Il est également possible de faire une opération arithmétique **entre deux tableaux**. Cela appliquera l'opération **entre chaque paire d'éléments**.

```python
# Création de deux arrays à 2 valeurs
a = np.array([4, 10]) 
b = np.array([6, 7])   

# Multiplication entre deux arrays
print(a * b)
# >>> [24 70]
```

- **(a)** Importer le package **`numpy`** sous le nom **`np`**.

- **(b)** Créer un array de dimensions 10x4 rempli de 1.

- **(c)** À l'aide d'une boucle `for` et de la fonction `enumerate`, multiplier chaque ligne par son indice. Afin de modifier la matrice, il faut que vous y accédiez par indexation.

```python
import numpy as np

M = np.ones((10,4))

# Pour chaque ligne de la matrice M
for i, row in enumerate(M):
    # On multiplie la ligne par son indice
    M[i, :] = row * i
    # Alternativement M[i, :] *= i
    
print(M)
```

Comme expliqué ci-dessus, l'opérateur * permet de calculer un produit élément par élément entre des matrices. Cela signifie que chaque élément correspondant de deux matrices est multiplié directement. Par exemple :

$$
\begin{pmatrix} 
5 & 1 \\
3 & 0
\end{pmatrix} \times 
\begin{pmatrix}
2 & 4 \\
0 & 8
\end{pmatrix} =
\begin{pmatrix}
10 & 4 \\
0 & 0
\end{pmatrix}
$$


En revanche, le produit matriciel (ou produit **dot**) est une opération complètement différente. Dans un produit matriciel, le résultat est calculé en multipliant les lignes de la première matrice par les colonnes de la deuxième matrice, conformément aux règles de l'algèbre linéaire. :

```python
# Création de deux arrays de dimensions 2x2
M = np.array([[5, 1],
              [3, 0]])

N = np.array([[2, 4],
              [0, 8]])

# Produit matriciel entre les deux arrays
print(M.dot(N))
>>> [[10 28]
    [ 6 12]]
```

En effet, le produit matriciel est rappelé ci-dessous :

$$
M = \begin{pmatrix} 
5 & 1 \\
3 & 0
\end{pmatrix}, 
N = \begin{pmatrix}
2 & 4 \\
0 & 8
\end{pmatrix}
$$

Alors : 

$$
MN = \begin{pmatrix} 
5 & 1 \\
3 & 0
\end{pmatrix} \times
\begin{pmatrix}
2 & 4 \\
0 & 8
\end{pmatrix} = 
\begin{pmatrix}
(5 * 2)+(1 * 0) & (5 * 4)+(1 * 8) \\
(3 * 2)+(0 * 0) & (3 * 4)+(0 * 8)
\end{pmatrix} =
\begin{pmatrix}
10 & 28 \\
6 & 12
\end{pmatrix}
$$

Soit :

$$
A = \begin{pmatrix}
1 & -1 \\
-1 & 1
\end{pmatrix}
$$

- **(d)** Définir une fonction `puissanceA` prenant en argument un entier positif `n`. Cette fonction devra calculer et retourner 𝐴𝑛 au sens du produit matriciel.

- **(e)** Calculer et afficher 𝐴2, 𝐴3 et 𝐴4. Arrivez-vous à deviner une formule générale pour 𝐴𝑛 ?

```python
def puissanceA(n):
    A = np.array([[1, -1],
                  [-1, 1]])
    for i in range(n-1):
        A = A.dot(A)
    return A

print(puissanceA(2))
print(puissanceA(3))
print(puissanceA(4))
```

Dans un plan à deux dimensions, les rotations autour de l'origine sont représentées par les matrices de la forme :

$$
A(\theta) = \begin{pmatrix}
\cos(\theta) & -\sin(\theta) \\
\sin(\theta) & \cos(\theta)
\end{pmatrix}
$$

où $\theta$ définit l'angle de la rotation en radian.

Ainsi, la rotation d'un point qui se trouve aux coordonnées 

$$
x = \begin{pmatrix}
x_1 \\
x_2
\end{pmatrix}
$$ se calcule grâce à la formule $\tilde{x} = A(\theta)x$.


(f) Définir une fonction `rotation_matrix` prenant en argument un nombre $\theta$ (`theta`) et retournant la matrice $A(\theta)$ associée.

> Vous pourrez calculer les fonctions cos et sin à l'aide des fonctions `np.cos` et `np.sin` de numpy.

- **(g)** Soit un point 
$$
x = \begin{pmatrix}
1 \\
1
\end{pmatrix}$$

Calculer et afficher $A(\pi)x$, ce qui est équivalent à une rotation de 180° autour de l'origine.

> Vous avez accès à la constante $\pi$ avec la commande `np.pi`.

```python
def rotation_matrix(theta):
    A = np.array(
        [
            [np.cos(theta), -np.sin(theta)],
            [np.sin(theta), np.cos(theta)]
        
        ])
    return A

x = np.array([[1, 1]])
x = x.reshape([2, 1])
 # x = np.array([[1], [1]]) 
Api=rotation_matrix(np.pi)

print(x)

print(Api.dot(x))
```

## 2. Broadcasting entre une matrice et une valeur

Lorsque l'on effectue une opération entre des éléments de dimensions différentes, Numpy effectue ce que l'on appelle du **Broadcasting** pour comprendre l'opération et l'exécuter.

Le terme broadcasting (_diffusion_ en français) est employé car un des array est "diffusé" sur l'array de dimensions plus grandes pour que les deux arrays aient des dimensions compatibles.  
Cette définition sera illustrée dans la suite.

Dans cette partie, nous essaierons de comprendre les règles du broadcasting dans les cas suivants :

> - Opération entre une matrice et une constante.
> 
> - Opération entre une matrice et un vecteur.

Une opération arithmétique telle que l'addition entre une matrice et une constante n'a pas de sens mathématiquement.  

Avec Numpy, la règle de broadcasting dans ce cas-là est de faire l'opération avec la constante pour chaque terme de la matrice.

$$
M = \begin{pmatrix}
3 & 1 & 2 \\
-2 & 1 & 5
\end{pmatrix}, c = 10
$$

$$
M + c = \begin{pmatrix}
3+10 & 1+10 & 2+10 \\
-2+10 & 1+10 & 5+10
\end{pmatrix} = \begin{pmatrix}
13 & 11 & 12 \\
8 & 11 & 15
\end{pmatrix}
$$

En interne, la constante $c$ est "diffusée" (broadcast) en une matrice $C$ de mêmes dimensions que $M$ :

$$
c \xrightarrow{\text{broadcasting}} C = \begin{pmatrix}
c & c & c \\
c & c & c
\end{pmatrix}
$$

Ainsi, $M + C$ devient une opération mathématiquement valide entre matrices de mêmes dimensions.

## 3. Broadcasting entre une matrice et un vecteur

De même, numpy nous permet d'effectuer des opérations arithmétiques entre une matrice et un vecteur.  
Néanmoins, il existe certaines **contraintes** qui déterminent si le vecteur peut être _broadcasté_ en dimensions **compatibles** avec la matrice.

Afin de déterminer si les dimensions du vecteur et de la matrice sont compatibles, numpy va comparer chaque dimension des deux arrays et déterminer si :

> - les dimensions sont égales.
> 
> - une des dimensions vaut 1.

Si pour chaque dimension, une de ces conditions est vérifiée, alors les dimensions sont compatibles et l'opération a été comprise.  
Sinon, une erreur `ValueError: operands could not be broadcast together` s'affichera.

Soient :

$$
M = \begin{pmatrix}
3 & 1 & 2 \\
-2 & 1 & 5
\end{pmatrix}, v = \begin{pmatrix}
2 \\
5
\end{pmatrix}
$$

**Est-ce que 𝑀 et 𝑣 ont des dimensions compatibles pour le broadcasting ?**

> - 𝑀 est une matrice de dimensions 2x3.
> 
> - 𝑣 est un vecteur à 2 éléments, mais numpy va plutôt voir 𝑣 comme une **matrice de dimensions 2x1**, c'est-à-dire une matrice à deux lignes et une colonne.
> 
> - La première dimension de 𝑀 et 𝑣 vaut 2 : la condition de compatibilité est vérifiée pour cette dimension.
> 
> - La deuxième dimension de 𝑀 vaut 3 et celle de 𝑣 vaut 1 : la condition de compatibilité est toujours vérifiée car une des dimensions vaut 1.

𝑀 et 𝑣 **ont donc des dimensions compatibles**.

**Le vecteur 𝑣 sera alors broadcasté sur la dimension où la dimension de 𝑣 vaut 1**.  
Dans notre cas, c'est la dimension des **colonnes**.  
Le broadcasting de 𝑣 sera donc donné par :

$$
v = \begin{pmatrix}
2 \\
5
\end{pmatrix} \xrightarrow{\text{broadcasting}} V = [v \quad v \quad v] = \begin{pmatrix}
2 & 2 & 2 \\
5 & 5 & 5
\end{pmatrix}
$$

Le résultat de 𝑀∗𝑣 sera alors donné par :

$$
M * v \xrightarrow{\text{broadcasting}} M * V = \begin{pmatrix}
3*2 & 1*2 & 2*2 \\
-2*5 & 1*5 & 5*5
\end{pmatrix} = \begin{pmatrix}
6 & 2 & 4 \\
-10 & 5 & 25
\end{pmatrix}
$$

Supposons maintenant que nous avons un vecteur ligne 𝑢=(3  4).

Pour numpy, ce vecteur a les dimensions 1x2 (une ligne et 2 colonnes).  
Les vecteurs 𝑢 et 𝑣 sont compatibles pour le broadcasting car sur chaque dimension un des vecteurs a une dimension égale à 1.

Comment et sur qui s'effectue le broadcasting dans ce cas-là ?

Le broadcasting s'effectuera sur les deux vecteurs et la matrice résultante du broadcasting aura la plus grande dimension entre les deux vecteurs :

$$
v = \begin{pmatrix}
2 \\
5
\end{pmatrix} \xrightarrow{\text{broadcasting}} V = \begin{pmatrix}
2 & 2 \\
5 & 5
\end{pmatrix}
$$

$$
u = \begin{pmatrix}3 & 4\end{pmatrix} \xrightarrow{\text{broadcasting}} U = \begin{pmatrix}
3 & 4 \\
3 & 4
\end{pmatrix}
$$

$$
v + u = \begin{pmatrix}
2 \\
5
\end{pmatrix} + \begin{pmatrix}3 & 4\end{pmatrix} \xrightarrow{\text{broadcasting}} V + U
= \begin{pmatrix}
2 & 2 \\
5 & 5
\end{pmatrix} + \begin{pmatrix}
3 & 4 \\
3 & 4
\end{pmatrix} = \begin{pmatrix}
5 & 6 \\
8 & 9
\end{pmatrix}
$$

Ces règles nous permettent de comprendre et prédire le résultat d'une opération entre deux arrays qui n'ont pas la même shape.  
Elles seront utiles pour l'exercice suivant :

La normalisation **Min-Max** est une méthode qui s'utilise pour **rééchelonner les variables d'une base de données dans la plage [0,1]**.

Supposons que notre base de données contienne 3 individus et 2 variables :

> - Jacques : 24 ans, de taille 1.88m.
> 
> - Mathilde : 18 ans, de taille 1.68m.
> 
> - Alban : 14 ans, de taille 1.65m.

Ces données peuvent être représentées par la matrice :

$$
X = \begin{pmatrix}
24 & 1.88 \\
18 & 1.68 \\
14 & 1.65
\end{pmatrix}
$$

Chaque ligne correspond à un individu, et chaque colonne correspond à une variable.  
Ce format est le format standard des bases de données.

Nous voulons comparer les écarts d'âge aux écarts de taille entre les individus. Néanmoins, les variables de cette base n'ont pas la même échelle, il faut donc utiliser la normalisation Min-Max pour que les variables aient la même échelle.

On note 𝑋𝑖,𝑗 la valeur de la variable 𝑗 pour l'individu 𝑖 et 𝑋:,𝑗 la colonne de la variable 𝑗.

La normalisation Min-Max va produire une nouvelle matrice 𝑋̃  telle que pour chaque entrée de la matrice 𝑋:

Pour chaque élément $X_{i,j}$ :
$$
\tilde{X}_{i,j} = \frac{X_{i,j} - \min(X_{:,j})}{\max(X_{:,j}) - \min(X_{:,j})}
$$

Ainsi, pour implémenter la normalisation Min-Max il suffit :

> - Pour chaque colonne 𝑋:,𝑗, calculer min(𝑋:,𝑗) et max(𝑋:,𝑗).
> 
> - Pour chaque élément $X_{i,j}$ de la colonne, calculer $\tilde{X_{i,j}}$.

Par défaut, une boucle `for` sur 𝑋 va parcourir les lignes de 𝑋.  
Afin de parcourir les colonnes de 𝑋, il suffit de parcourir les lignes de la **transposée** de 𝑋, que l'on note $X^T$.

$$
X^T = \begin{pmatrix}
24 & 18 & 14 \\
1.88 & 1.68 & 1.65
\end{pmatrix}
$$
La transposition d'un array s'obtient avec son attribut `T` : $𝑋^𝑇$ = `X.T`.

- **(a)** Définir une fonction nommée `normalisation_min_max` prenant en argument une matrice 𝑋 et qui retournera 𝑋̃ .

- **(b)** Appliquer la normalisation Min-Max sur 𝑋. Vous devriez obtenir à deux décimales près la matrice suivante :
    
```python
def normalisation_min_max(X):
    # Création d'une copie de X pour éviter de modifier les données originales
    X_tilde = np.zeros_like(X, dtype=float)
    
    # Calcul pour chaque colonne
    for j in range(X.shape[1]):
        min_Xj = np.min(X[:, j])  # Minimum de la colonne
        max_Xj = np.max(X[:, j])  # Maximum de la colonne
        
        # Gestion des cas où min == max pour éviter une division par zéro
        if max_Xj - min_Xj == 0:
            X_tilde[:, j] = 0  # Met tout à zéro si tous les éléments sont identiques
        else:
            X_tilde[:, j] = (X[:, j] - min_Xj) / (max_Xj - min_Xj)
    
    return X_tilde

# Exemple d'utilisation
X = np.array([[24, 1.88],
              [18, 1.68],
              [14, 1.65]])

X_tilde = normalisation_min_max(X)

print(X_tilde)
```

## 4. Les méthodes statistiques

En plus des opérations mathématiques courantes, les arrays numpy disposent également de plusieurs [méthodes](https://docs.scipy.org/doc/numpy-1.12.0/reference/arrays.ndarray.html#array-methods) pour des opérations plus complexes sur les arrays.

Une des opérations les plus utilisées est le calcul d'une moyenne à l'aide de la méthode **`mean`** d'un array :

```python
A = np.array([[1, 1, 10],
              [3, 5, 2]])

# Calcul de la moyenne sur TOUTES les valeurs de A
print(A.mean())
>>> 3.67

# Calcul de la moyenne sur les COLONNES de A
print(A.mean(axis = 0))
>>> [2. 3. 6.]

# Calcul de la moyenne sur les LIGNES de A
print(A.mean(axis = 1))
>>> [4. 3.33]
```

L'argument **`axis`** détermine **quelle dimension sera parcourue** pour calculer la moyenne :

- `axis = 0` signifie que la dimension parcourue sera celle des **colonnes**, ce qui signifie que le résultat sera **la moyenne de chaque colonne**.

- `axis = 1` signifie que la dimension parcourue sera celle des **lignes**, ce qui signifie que le résultat sera **la moyenne de chaque ligne**.

  
![](https://assets-datascientest.s3-eu-west-1.amazonaws.com/train/mean_axis.png)

L'argument `axis` revient **très souvent** pour les opérations sur les matrices, et **pas que pour Numpy**. Il est très important de comprendre son effet.

Il existe d'autres méthodes statistiques qui se comportent comme la méthode **`mean`**, telles que :

- **`sum`** : Calcule la somme des éléments d'un array.

- **`std`** : Calcul de l'écart type.

- **`min`** : Trouve la valeur **minimale** parmis les éléments d'un array.

- **`max`** : Trouve la valeur **maximale** parmis les éléments d'un array.

- **`argmin`** : Renvoie l'indice de la valeur **minimale**.

- **`argmax`** : Renvoie l'indice de la valeur **maximale**.

Ces méthodes ne sont pas utiles pour les bases de données si on ne renseigne pas de valeur pour l'argument `axis`.

En général, nous utiliserons la valeur **`axis = 0`** pour obtenir le résultat **pour chaque colonne**, c'est-à-dire **pour chaque variable de la base de données**.

Ainsi, nous pouvons calculer la normalisation Min-Max très rapidement à l'aide des méthodes **`min`** et **`max`** et du **broadcasting** :

```python
X_tilde = (X - X.min(axis = 0)) / (X.max(axis = 0) - X.min(axis = 0))

print(X_tilde)
>>> [[1.         1.        ]
    [0.4        0.13043478]
    [0.         0.        ]]
```

  

L'[Erreur Quadratique Moyenne](https://en.wikipedia.org/wiki/Mean_squared_error) est une métrique permettant de quantifier l'erreur de prédiction obtenue par un modèle de régression. Cette notion sera vue en plus de détails dans la suite de votre formation.

La formule de l'erreur quadratique moyenne, abrégée par MSE pour _mean squared error_, se calcule avec la formule suivante :

$MSE = \frac{1}{n} \sum_{i=1}^n (\hat{y}_i - y_i)^2$

Où:
- $n$ est le nombre d'échantillons
- $\hat{y}_i$ est la valeur prédite pour l'échantillon $i$
- $y_i$ est la valeur réelle pour l'échantillon $i$
- $MSE$ (Mean Squared Error) est l'erreur quadratique moyenne

- 𝑦̂  et 𝑦 sont des **vecteurs** de dimensions 𝑛.
- 𝑦̂  est donné par le produit matriciel entre une matrice 𝑋 et un _vecteur de régression*_ 𝛽, ie :
    
    𝑦̂ =𝑋𝛽

Dans le cas de la régression linéaire, l'objectif de l'erreur quadratique moyenne est de trouver le vecteur de régression 𝛽 qui **minimise** cette erreur.

- **(a)** Définir une fonction nommée `mean_squared_error` prenant en argument une matrice `X`, un vecteur `beta` et un vecteur `y` et qui, **sans boucle `for`**, retourne l'erreur quadratique moyenne associée.

- **(b)** Pour `beta` prenant les valeurs 0.01, 0.02, ..., 0.13, 0.14 et 0.15, calculer la MSE associée à l'aide de la fonction `mean_squared_error` définie précédemment. Stocker les valeurs dans une liste.
	- Pour créer la liste `[0.01, 0.02, ..., 0.13, 0.14, 0.15]`, vous pouvez utiliser la fonction `np.linspace` dont la signature est similaire à la fonction `range` :
    
    ```python
    print(np.linspace(start = 0.01, stop = 0.15, num = 15))
    >>> [0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.1  0.11 0.12 0.13 0.14 0.15]
    ```
    

- L'argument `num` permet de définir **le nombre d'éléments désiré** entre `start` et `stop`. **Il ne s'agit pas du pas entre deux valeurs consécutives**.
- **(c)** Convertir la liste contenant les MSE en un array numpy.

- **(d)** Déterminer le 𝛽∗ qui minimise la MSE à l'aide de la méthode `argmin`.

- **(e)** Quelles sont les tailles prédites par ce 𝛽∗ optimal ? Les tailles prédites par le modèle sont données par le vecteur 𝑦̂ =𝑋𝛽∗.

```python
def mean_squared_error(X, beta, y):
    # Calcul de ^y
    y_hat = X.dot(beta)
    
    # Calcul de l'erreur quadratique (^y_i - y_i)**2
    mse = (y_hat - y)**2
    
    # On fait la moyenne de l'erreur pour obtenir la MSE
    mse = mse.mean()
    
    return mse
    
X = np.array([24,
              18,
              14])

y = np.array([1.88,
              1.68,
              1.65])

# Liste contenant les mse
errors = []

# Liste contenant les betas à tester
betas = np.linspace(start = 0.01, stop = 0.15, num = 15)

# Pour beta allant de 0.01 à 
for beta in betas:
    errors.append(mean_squared_error(X, beta, y))
    
# Array contenant les MSE pour chaque beta
errors = np.array(errors)

# Indice de la MSE minimale
index_beta_optimal = errors.argmin()

# On récupère le beta optimal grâce à l'indice
beta_optimal = betas[index_beta_optimal]

print("Le beta optimal est:", beta_optimal)

y_hat = X.dot(beta_optimal)
print("Tailles prédites: \n", y_hat)
```








---
---

# Note pour plus tard 

```python
import numpy as np

print(np.array([1, 2, 3]))
print(type(np.array([1, 2, 3])))

print(np.array([1, 2, 3], dtype=np.int64))
print(type(np.array([1, 2, 3], dtype=np.int64)))

print(np.concatenate([[1, 2, 3], [4, 5, 6]], axis=0))
print(type(np.concatenate([[1, 2, 3], [4, 5, 6]], axis=0)))

print(np.concatenate(np.array([[1, 2, 3], [4, 5, 6]]), axis=0))
print(type(np.concatenate(np.array([[1, 2, 3], [4, 5, 6]]), axis=0)))

print(np.concatenate(np.array([[1, 2, 3], np.array([4, 5, 6])]), axis=1))
print(type(np.concatenate(np.array([[1, 2, 3], np.array([4, 5, 6])]), axis=1)))
```


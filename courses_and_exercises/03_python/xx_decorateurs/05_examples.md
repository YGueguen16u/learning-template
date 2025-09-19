### 5. Exemple intéressant d'utilisation : les décorateurs @cache

En plus de pouvoir alléger notre code, certains décorateurs peuvent **raccourcir nos temps de calculs** s'ils sont utilisés correctement. C'est le cas pour les décorateurs `@cache`, notamment `@lru_cache()`, de la librairie native [functools](https://docs.python.org/3/library/functools.html).

Ces décorateur permettent de garder en cache les différentes valeurs calculées par la fonction qu'il décore. Ceci est extrêmement intéressant pour des fonctions dites **récursives**, qui font appel à elles mêmes lors de leur exécution.  
Prenons l'exemple d'une fonction qui calcule la factorielle d'un nombre. On rappelle que la factorielle d'un nombre entier n est définie par :

$∀𝑛∈ℕ∗,𝑛!=𝑛×(𝑛−1)×...×1$

Cette définition nous permet d'envisager les factorielles comme une suite entière :

$∀𝑛∈ℕ∗$,
- $Fn = n × F(n-1)$
- $F0 = 1$

Cette définition peut se traduire aisément en Python de la manière suivante :

```python
def factorial(n):
   if n==1:
       return(n)
    else:
       return(n*factorial(n-1))
```

- **a-** Implémentez la fonction `factorial` telle que définie plus haut.
- **b-** Définissez une fonction `boucle` qui calculera et stockera dans une liste les factorielles de 1 à 500. Décorez cette fonction à l'aide du décorateur `@temps_execution` et exécutez là.
- **c-** Décorez la fonction `factorial` avec `@lru_cache()`. Ré-exécutez la fonction `boucle` et observez. N'oubliez pas d'importer le décorateur à partir du module **functools**.

```python
from functools import lru_cache
@lru_cache()

def factorial(n):
    if n==1:
        return(n)
    else:
        return(n*factorial(n-1))

@temps_execution
def boucle(n=500):
    L = []
    for k in range(1, 500):
        L.append(factorial(k))
    return L

boucle(500)
```
```
2.384185791015625e-07

[1,
 2,
 6,
 24,
 120,
 720,
 5040,
 40320,
 .
 .
 .
```

À stocker les valeurs en cache, on gagne du temps sur l'exécution de notre fonction. Voyons un nouvel exemple plus flagrant.

- **d-** Définissez une nouvelle fonction `print_hello` qui retournera **au bout de 5 secondes** une chaine de caractère valant par défaut `'hello'`. Décorez la avec `@lru_cache()` et `@temps_execution` puis exécutez-là sans préciser d'argument.
- **e-** Stockez la valeur retournée dans une variable `a` quelconque.

```python
@temps_execution
@lru_cache()
def print_hello(a='hello'):
    time.sleep(5)
    return a

a=print_hello()
a

b= print_hello()
b
```
```
4.76837158203125e-07

'hello'
```

Comme prévu, la fonction met environ 5 secondes à s'exécuter. Mais la valeur calculée reste stockée en cache, pour vous en rendre compte, définissez une nouvelle variable `b` qui stockera une nouvelle itération de la fonction `print_hello` et constatez le changement.

Cette fois-ci, l'exécution a été **quasi-instantanée** et la mise en cache a permis de **court-circuiter le temps d'attente** de 5 secondes prévu par la fonction lors de sa seconde itération. On peut légitimement penser que la mise en cache n'est pas responsable de ce gain de temps, vous pouvez exécuter la cellule suivante pour vous rendre compte du contraire.

```python
@temps_execution
def print_hello(a='hello'):
    time.sleep(5)
    return a

a= print_hello()
b= print_hello()
```
```
2.384185791015625e-07
7.152557373046875e-07
```

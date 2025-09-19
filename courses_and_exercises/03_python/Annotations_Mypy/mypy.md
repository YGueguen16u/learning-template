# 3. MyPy

[MyPy](https://mypy.readthedocs.io/en/stable/) est une librairie Python conçue pour vérifier le typage statique d’un code. Elle s’appuie sur les **annotations de type** et s’assure qu’elles sont bien respectées.
Contrairement à un compilateur, MyPy ne rend pas un code invalide si le typage est incorrect : le code s’exécute toujours, mais MyPy renvoie un **rapport détaillé des erreurs**.
C’est donc un outil de **débogage et de documentation** très utilisé dans les environnements professionnels et les gros projets.

### Utilisation classique

1. Écrire un script Python et l’enregistrer en `.py`.
2. Dans le terminal, exécuter :

   ```bash
   mypy mon_fichier.py
   ```
3. MyPy renvoie alors la **nature de l’erreur**, sa **position** dans le code et sa **cause**.

### Utilisation dans un Jupyter Notebook

Pour Jupyter, on peut définir un *magic* qui permet d’appeler MyPy directement dans une cellule :

```python
from IPython.core.magic import register_cell_magic
@register_cell_magic
def typecheck(line, cell):
    from IPython import get_ipython
    from mypy import api
    cell = '\n' + cell
    mypy_result = api.run(['-c', cell] + line.split())
    if mypy_result[0]: 
        print(mypy_result[0])
    if mypy_result[1]:  
        print(mypy_result[1])
    shell = get_ipython()
    shell.run_cell(cell)
```

Une fois cette cellule exécutée, il suffit de mettre `%%typecheck` au tout début d’une cellule pour vérifier les types du code qu’elle contient. Attention : le *magic* doit être en première ligne.

### Exemple (b–c) : Fonction avec liste

On définit une fonction qui ajoute un élément à une liste :

```python
%%typecheck

def function(L: list) -> list:
    L = L + ['2']
    return L

print(function(['1+1 =']))
```

Résultat :

```
Success: no issues found in 1 source file
['1+1 =', '2']
```

La fonction s’exécute correctement et MyPy confirme que le typage est valide.

### Exemple (d–e) : Typage non respecté

Définissons une fonction qui double un entier :

```python
%%typecheck

def double(a: int) -> int: 
    return a * 2

double(27.6)
```

Sortie :

```
<string>:7: error: Argument 1 to "double" has incompatible type "float"; expected "int"
Found 1 error in 1 file (checked 1 source file)

55.2
```

* Python exécute la fonction et renvoie `55.2`.
* MyPy signale une erreur car un `float` a été passé alors qu’un `int` était attendu.

### Exemple (f) : Incompatibilité avec NumPy

Essayons maintenant avec un vecteur NumPy :

```python
%%typecheck

import numpy as np 
vec = np.array([2, 4, 6])
double(vec)
```

Sortie :

```
<string>:7: error: Name "double" is not defined
Found 1 error in 1 file (checked 1 source file)

array([ 4,  8, 12])
```

Deux points à noter :

1. **Absence d’annotations natives pour NumPy**
   MyPy ne reconnaît pas directement `numpy.array` car les types ne sont pas inclus dans la version standard de NumPy. Il faut installer des *stubs* séparés (ex. `numpy-stubs`) ou utiliser une version plus récente avec annotations intégrées.

2. **Limite du magic Jupyter**
   La fonction `double()` définie dans une cellule précédente n’est pas reconnue dans la nouvelle cellule. Pour éviter ces “fausses erreurs”, il est recommandé de **regrouper tout le code à vérifier dans une seule cellule**.

### Exemple de type mismatch classique

```python
def divide_et_impera(x: int, y: int) -> int:
    return x / y

print(divide_et_impera(4, 3))  
```

Sortie :

```
1.3333333333333333
```

Problème :

* La fonction est annotée pour renvoyer un `int`.
* Or `x / y` retourne un `float`.
* Python ne se plaint pas, mais MyPy le détectera.

### Correction avec Union Types

Pour accepter plusieurs types d’entrée et déclarer correctement la sortie :

```python
def divide_et_impera(x: int | float, y: int | float) -> float:
    return x / y
```

Améliorations :

* Accepte `int` et `float` en entrée.
* Déclare explicitement un `float` en sortie.
* Passe la vérification des outils de typage.


### Bonnes pratiques

* **Toujours être explicite** sur les types de retour.
* Utiliser les **Union Types** (`|`) lorsqu’une fonction gère plusieurs types.
* Vérifier son code avec un outil adapté :

```bash
# Avec MyPy
mypy your_file.py

# Avec Pyright
pyright your_file.py
```

### Avantages du typage statique

* Détection d’erreurs **avant l’exécution**.
* Améliore la **lisibilité et la documentation** du code.
* Aide les IDE pour l’**autocomplétion** et les **hints**.
* Rend la **maintenance** de gros projets plus fiable.


En résumé, MyPy ne change pas le comportement de Python à l’exécution mais fournit une **couche de sécurité supplémentaire** : il met en lumière les incohérences de typage, ce qui est essentiel pour des projets professionnels, collaboratifs ou de grande ampleur.


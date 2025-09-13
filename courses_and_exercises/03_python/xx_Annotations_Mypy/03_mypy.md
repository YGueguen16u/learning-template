## 3. MyPy

[MyPy](https://mypy.readthedocs.io/en/stable/) est une librairie Python développée pour permettre à un utilisateur de vérifier le typage statique d'un code. Elle fonctionne de paire avec les annotations et s'assure donc que celles-ci sont bien respectées. À défaut de rendre _invalide_ le code si le typage n'est pas respecté, MyPy renvoie un **rapport détaillé** des erreurs rencontrés même si celui s'exécutera toujours si l'erreur n'est pas plus profonde.  
La façon la plus courante de l'utiliser est de l'employer comme un débugger selon le schéma suivant :

1. Rédiger son code Python et l'enregistrer comme un fichier `.py`.

2. Sur un terminal, entrer la commande suivante : `mypy mon_fichier.py`

Si des erreurs sont détectées elles seront renvoyées par MyPy précisant le **type** de l'erreur, sa **position** dans le code ainsi que la **cause** de l'erreur.

Pour faire fonctionner `MyPy` dans un jupyter notebook, nous allons définir un `magic`. Nous ne rentrerons pas en détail là dessus, sachez juste que cela permet d'incorporer les fonctionnalités de vérification de type proposés par MyPy lors de l'exécution des cellules Jupyter.

- (a) Exécutez la cellule suivante pour instancier MyPy sur Jupyter.

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

Dès lors que cette cellule est lancée, il suffit de faire paraître `%\%typecheck` au début de chacune des cellules dont on souhaite vérifier le type. Faîtes attention au fait que les `magic` doivent être dans la première ligne de la cellule... Il faudra donc certainement supprimer les commentaires en début de cellule de réponse.

- (b) Définissez une fonction qui prendra en argument une liste et qui retournera une nouvelle liste à laquelle on ajoute un élement au choix. Précisez les annotations correspondantes.
- (c) Exécutez la fonction avec en argument une liste quelconque et en faisant attention à bien mentionner le magic de vérification de type.

```python
%%typecheck


def function(L : list) -> list:
    L = L + ['2']
    return(L)
           
print(function(['1+1 =']))
```

```
Success: no issues found in 1 source file
['1+1 =', '2']
```

On obtient, en plus du retour de notre fonction, un message qui atteste du bon fonctionnement de notre typage.  
Essayons de voir le cas de figure contraire, celui où le typage n'aurait pas été valide.

- (d) Définissez une nouvelle fonction `double` qui prendra en argument un entier (type `int`) et retournera le double de cet entier (type `int`).
- (e) À l'aide de cette fonction, afficher le double de 27.6. Observez.

```python
%%typecheck

def double(a : int) -> int: 
    a = a*2
    return(a)

double(27.6)
```
```
<string>:7: error: Argument 1 to "double" has incompatible type "float"; expected "int"
Found 1 error in 1 file (checked 1 source file)

55.2
```

Bien que la fonction s'exécute et retourne la valeur attendue, MyPy nous renvoie un message d'erreur indiquant que le typage annoté n'a pas été respecté. Ce message se lit de la façon suivante :

- **La position de l'erreur** désignée par le numéro de la ligne où elle est repérée, ici elle correspond au numéro de la ligne où l'on exécute notre fonction `double()`.

- **La cause de l'erreur**, ici il s'agit de l'incompatibilité entre le type du premier argument entré, `float`, et le type de l'argument attendu, `int`.

- **Un récapitulatif** du nombre d'erreurs recensées par MyPy.

Ce type d'erreur rapporté par la librairie est le plus classique, mais il en existe d'autres auxquels on peut s'attendre.

- (f) Toujours à partir de la fonction `double()`, exécutez celle-ci en prenant comme argument un vecteur numérique quelconque appartenant à la classe numpy.array. N'oubliez pas d'importer le package correspondant.

```python
%%typecheck

import numpy as np 

vec = np.array([2,4,6])

double(vec)
```
```
<string>:7: error: Name "double" is not defined
Found 1 error in 1 file (checked 1 source file)

array([ 4,  8, 12])
```

Ici, on remarque que deux "erreurs" sont retournées alors qu'on ne s'attendait qu'à une sur l'incompatibilité de type.

- La première correspond au fait que les annotations de type ('type hints') **ne sont pas fournies** avec la version de numpy que nous avons importé. Par conséquent, bien que MyPy reconnaisse l'import de numpy dans notre cellule, il n'est pas en mesure de **reconnaitre les nouveaux types** qui accompagnent cette librairie, dont les types `numpy.array`. Pour palier ce problème soit il est possible de télécharger indépendamment les annotations des nouveaux types qu'introduisent la librairie soit ces annotations sont disponibles dans des versions plus récentes de la librairie en question.

- La deuxième erreur vient du fonctionnement même du magic MyPy, cette erreur n'aurait pas été relevée lors d'une utilisation "classique" de la librairie, donc sans passer par un magic Jupyter. En effet, bien que l'on ait défini sans problème la fonction `double()` dans une cellule plus haut, celle-ci n'est plus reconnue par MyPy dans une nouvelle cellule. Une utilisation optimale de MyPy sur Jupyter serait donc de **regrouper tout notre code dans une seule et même cellule** afin de vérifier le typage efficacement sans biaiser le rapport fourni par de fausses erreurs telles que celle-ci.


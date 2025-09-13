# Classes prédéfinies

En Python, de nombreuses classes prédéfinies telles que les classes `list`, `tuple` ou `str` sont régulièrement utilisées pour faciliter les tâches du développeur. Comme toutes les autres classes, elles disposent de leurs propres attributs et méthodes qui sont à la disposition de l'utilisateur.  
  
Un des grands intérêts de la programmation orientée objet est de pouvoir créer des classes et les partager avec d'autres développeurs. Ceci se fait grâce à des packages tels que `numpy`, `pandas` ou `scikit-learn`. Tous ces packages sont en fait des classes créées par d'autres développeurs de la communauté Python afin de nous donner des outils qui faciliteront le développement de nos propres algorithmes.  
  
Nous allons dans un premier temps aborder l'une des classes d'objets prédéfinies les plus importantes, la classe `list`, afin d'apprendre à l'exploiter au maximum de ses capacités.  
Ensuite, nous introduirons brièvement la classe `DataFrame` du package `pandas` et apprendrons à identifier et manipuler ses méthodes.

### La classe list

- Utiliser la commande `dir(list)` pour afficher tous les attributs et méthodes de la classe `list`.

```python
dir(list)
```

```
['__add__',
 '__class__',
 '__class_getitem__',
 '__contains__',
 '__delattr__',
 '__delitem__',
 '__dir__',
 '__doc__',
 '__eq__',
 '__format__',
 '__ge__',
 '__getattribute__',
 '__getitem__',
 '__gt__',
 '__hash__',
 '__iadd__',
 '__imul__',
 '__init__',
 '__init_subclass__',
 '__iter__',
 '__le__',
 '__len__',
 '__lt__',
 '__mul__',
 '__ne__',
 '__new__',
 '__reduce__',
 '__reduce_ex__',
 '__repr__',
 '__reversed__',
 '__rmul__',
 '__setattr__',
 '__setitem__',
 '__sizeof__',
 '__str__',
 '__subclasshook__',
 'append',
 'clear',
 'copy',
 'count',
 'extend',
 'index',
 'insert',
 'pop',
 'remove',
 'reverse',
 'sort']
```

- Utiliser la commande `help(list)` pour afficher la _documentation_ de la classe `list`. Cette documentation vous sera utile pour comprendre l'utilisation des méthodes d'une classe.

```python
help(list)
```

```
Help on class list in module builtins:

class list(object)
 |  list(iterable=(), /)
 |  
 |  Built-in mutable sequence.
 |  
 |  If no argument is given, the constructor creates a new empty list.
 |  The argument must be an iterable if specified.
 |  
 |  Methods defined here:
 |  
 |  __add__(self, value, /)
 |      Return self+value.
 |  
 |  __contains__(self, key, /)
 |      Return key in self.
 |  
 |  __delitem__(self, key, /)
 |      Delete self[key].
 |  
 |  __eq__(self, value, /)
 |      Return self==value.
 |  
 |  __ge__(self, value, /)
 |      Return self>=value.
 |  
 |  __getattribute__(self, name, /)
 |      Return getattr(self, name).
 |  
 |  __getitem__(...)
 |      x.__getitem__(y) <==> x[y]
 |  
 |  __gt__(self, value, /)
 |      Return self>value.
 |  
 |  __iadd__(self, value, /)
 |      Implement self+=value.
 |  
 |  __imul__(self, value, /)
 |      Implement self*=value.
 |  
 |  __init__(self, /, *args, **kwargs)
 |      Initialize self.  See help(type(self)) for accurate signature.
 |  
 |  __iter__(self, /)
 |      Implement iter(self).
 |  
 |  __le__(self, value, /)
 |      Return self<=value.
 |  
 |  __len__(self, /)
 |      Return len(self).
 |  
 |  __lt__(self, value, /)
 |      Return self<value.
 |  
 |  __mul__(self, value, /)
 |      Return self*value.
 |  
 |  __ne__(self, value, /)
 |      Return self!=value.
 |  
 |  __repr__(self, /)
 |      Return repr(self).
 |  
 |  __reversed__(self, /)
 |      Return a reverse iterator over the list.
 |  
 |  __rmul__(self, value, /)
 |      Return value*self.
 |  
 |  __setitem__(self, key, value, /)
 |      Set self[key] to value.
 |  
 |  __sizeof__(self, /)
 |      Return the size of the list in memory, in bytes.
 |  
 |  append(self, object, /)
 |      Append object to the end of the list.
 |  
 |  clear(self, /)
 |      Remove all items from list.
 |  
 |  copy(self, /)
 |      Return a shallow copy of the list.
 |  
 |  count(self, value, /)
 |      Return number of occurrences of value.
 |  
 |  extend(self, iterable, /)
 |      Extend list by appending elements from the iterable.
 |  
 |  index(self, value, start=0, stop=9223372036854775807, /)
 |      Return first index of value.
 |      
 |      Raises ValueError if the value is not present.
 |  
 |  insert(self, index, object, /)
 |      Insert object before index.
 |  
 |  pop(self, index=-1, /)
 |      Remove and return item at index (default last).
 |      
 |      Raises IndexError if list is empty or index is out of range.
 |  
 |  remove(self, value, /)
 |      Remove first occurrence of value.
 |      
 |      Raises ValueError if the value is not present.
 |  
 |  reverse(self, /)
 |      Reverse *IN PLACE*.
 |  
 |  sort(self, /, *, key=None, reverse=False)
 |      Sort the list in ascending order and return None.
 |      
 |      The sort is in-place (i.e. the list itself is modified) and stable (i.e. the
 |      order of two equal elements is maintained).
 |      
 |      If a key function is given, apply it once to each list item and sort them,
 |      ascending or descending, according to their function values.
 |      
 |      The reverse flag can be set to sort in descending order.
 |  
 |  ----------------------------------------------------------------------
 |  Class methods defined here:
 |  
 |  __class_getitem__(...) from builtins.type
 |      See PEP 585
 |  
 |  ----------------------------------------------------------------------
 |  Static methods defined here:
 |  
 |  __new__(*args, **kwargs) from builtins.type
 |      Create and return a new object.  See help(type) for accurate signature.
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes defined here:
 |  
 |  __hash__ = None
```

Les commandes `dir` et `help` sont les premières commandes à lancer lorsque vous ne comprenez pas comment utiliser une méthode d'une classe ou lorsque vous ne vous souvenez plus du nom d'une méthode.


### La classe DataFrame

Le package `pandas` contient une classe nommée `DataFrame` dont l'utilité en fait le package le plus utilisé par les datascientists pour manipuler des données.  
  
Pour utiliser le package `pandas`, il faut d'abord l'importer. Ensuite, pour instancier un `DataFrame`, il faut appeler son constructeur défini dans le package `pandas`.

```python
import pandas as pd
df = pd.DataFrame()
```

Si vous lancez l'instruction `dir(df)` ou `dir(pd.DataFrame)`, vous verrez que la classe `DataFrame` possède énormément de méthodes et attributs. Il est très difficile de tous les retenir, d'où l'utilité des commandes `dir` et `help`.  
  
Cependant, comme la documentation est très complète, utiliser directement `dir(df)` ou `help(df)` peut s'avérer fastidieux. Au lieu de cela, pour accéder rapidement à la documentation d'une méthode spécifique, vous pouvez utiliser la fonction `help` avec la méthode comme argument (par exemple, `help(df.method)`).

- En vous aidant de la commande `help(pd.DataFrame)`, construire un `DataFrame` nommé `df1` grâce à la liste `liste_4`.

Contrairement aux méthodes de la classe `list`, les méthodes de la classe `DataFrame` ne modifient pas l'instance appelant la méthode. Ces méthodes renvoient une nouvelle `DataFrame` sur laquelle la méthode sera appliquée. Il faudra systématiquement stocker cette nouvelle `DataFrame` pour conserver le résultat de la méthode.

Une autre méthode de la classe `DataFrame` qui est très utilisée est la méthode `apply`. Cette méthode permet d'appliquer une fonction passée en argument à toutes les cases du `DataFrame` appelant la méthode.

- En vous aidant de la commande `help(pd.DataFrame)`, construire un `DataFrame` nommé `df1` grâce à la liste `liste_4 = [1, 5, 45, 42,None, 123, 4213 ,None, 213]`.
- En utilisant la méthode `dropna` de la classe `DataFrame`, créer une nouvelle `DataFrame` nommée `df2` qui ne contiendra pas de valeurs manquantes.
- Définir une fonction `divise2` qui retourne la division par 2 de l'argument passé en paramètre.
- Créer un `DataFrame` nommé `df3` qui contiendra les valeurs de `df2` que l'on aura divisé par 2.

```python
liste_4 = [1, 5, 45, 42,None, 123, 4213 ,None, 213]
df = pd.DataFrame(liste_4)
df2 = df1.dropna()

def divise2(x):   # Définition de la fonction que nous allons appliquer aux cellules du DataFrame
    return x/2

df3 = df2.apply(divise2)
```
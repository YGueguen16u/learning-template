### 4. Envelopper une fonction

Quand nous décorons une fonction comme dans les parties qui précèdent, nous perdons les informations annexes de la fonction (sa documentation par exemple).  
Lancer la cellule de code suivante pour le voir par vous-même.

```python
def print_before_execution(function):
    def print_then_execute(*args, **kwargs):
        print('voici ce que renvoie la fonction {}'.format(function.__name__))
        function(*args, **kwargs)
    return print_then_execute

@print_before_execution
def print_hello_world():
    '''
    Description de ma fonction
    '''
    print("hello world")
    
help(print_hello_world)
```
```
Help on function print_then_execute in module __main__:

print_then_execute(*args, **kwargs)
```

Pour remédier à ce problème, on enveloppe notre fonction à décorer à l'aide de **wraps**, qui retourne un décorateur lorsqu’appelé avec une fonction. wraps est disponible dans la librairie **functools**.

```python
from functools import wraps

def print_before_execution(function):
    @wraps(function)
    def print_then_execute(*args, **kwargs):
        print('voici ce que renvoie la fonction {}'.format(function.__name__))
        function(*args, **kwargs)
    return print_then_execute

@print_before_execution
def print_hello_world():
    '''
    Description de ma fonction
    '''
    print("hello world")
    
help(print_hello_world)
```

Aussi contre-intuitifs qu'ils puissent paraitre, les décorateurs sont, une fois maitrisés, des **outils puissants** permettant de **modifier des fonctions** sans modifier leurs définitions. On comprend donc que lorsque l'on cherche à exploiter à plusieurs reprises certaines fonctionnalités précises, définir un décorateur réalisant ces dites fonctionnalités **allègera de façon conséquente notre code**, sans avoir à réaliser d'importantes modifications à celui-ci.

En pratique, certains décorateurs sont plus utilisés que d'autres, un cas d'utilisation notoire est la création d'API en Python, que ce soit avec Flask, FastAPI ou même Streamlit, chacune de ses librairies propose ses propres décorateurs, permettant à un utilisateur de rapidement faire appel à certaines fonctionnalités sans avoir à les redefinir constamment.


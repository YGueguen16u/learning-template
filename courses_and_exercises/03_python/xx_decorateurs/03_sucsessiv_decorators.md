### 3. Enchaîner les décorateurs

Il est tout à fait possible d'affecter plusieurs décorateurs à une fonction pour accumuler leurs effets.

```python
def print_before_execution(function):
    def print_then_execute(*args, **kwargs):
        print('voici ce que renvoie la fonction {}'.format(function.__name__))
        function(*args, **kwargs)
    return print_then_execute

def print_after_execution(function):
    def execute_then_print(*args, **kwargs):
        function(*args, **kwargs)
        print('La fonction a fini de tourner')
    return execute_then_print

@print_after_execution
@print_before_execution
def print_hello_world():
    print('hello world')

print_hello_world()
```
```
>>> voici ce que renvoie la fonction print_hello_world
    hello world
    La fonction a fini de tourner
```

En fait, **@print_before_execution** s'applique à la fonction print_hello_world, puis **@print_after_execution** s'applique à la fonction renvoyée par @print_before_execution.  
**ATTENTION**, l'ordre dans lequel on applique les décorateurs est important!

```python
@print_before_execution
@print_after_execution
def print_hello_world():
    print('hello world')

print_hello_world()
```
```
>>> voici ce que renvoie la fonction print_after_execution  
    # @print_before_execution s'applique à la fonction renvoyée par @print_after_execution
    hello world
    La fonction a fini de tourner
```

- **a-** Enchaîner les décorateurs **temps_execution** et **entree_contient** créés dans les parties précédentes. On reprendra le code de la fonction **importer_csv**.

```python
@entree_contient('.csv')
@temps_execution
def importer_csv(*args, **kwargs):
    '''
    Fonction qui permet d'importer un fichier csv dans un DataFrame pandas.
    '''
    return pd.read_csv(*args, **kwargs)

importer_csv('country_vaccinations.csv')
```
```
4.76837158203125e-07
```


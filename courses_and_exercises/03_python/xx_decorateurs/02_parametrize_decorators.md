### 2. Paramétrer un décorateur

On peut paramétrer le comportement d'un décorateur de la même manière qu'on paramètre celui d'une fonction.  
Un décorateur paramétré est en fait une fonction qui retourne un décorateur simple.

```python
def decorateur_parametre(description): 
    def decorateur(function): 
        def print_before_execution(*args, **kwargs): 
            print(description.format(function.__name__))
            function(*args, **kwargs)
        return print_before_execution
    return decorateur

@decorateur_parametre('voici ce que renvoie la fonction {}')
def print_hello_world():
    print('hello world')    

print_hello_world()
```

```
>>> voici ce que renvoie la fonction print_hello_world
    hello world
```

- **a-** Construire un décorateur nommé **entree_contient** qui prend en paramètre une chaîne de caractère **a_contenir**.  
    Si **a_contenir** est incluse dans le premier argument de la fonction décorée, alors cette dernière s'exécute normalement.  
    Sinon, un message d'erreur doit être renvoyé.

```python
def entree_contient(a_contenir):
    def decorator(function): 
        def new_function(*args, **kwargs): 
            if a_contenir in str(args[0]):
                return function(*args, **kwargs)
            else:
                return "la première entrée doit contenir {}".format(a_contenir)
        return new_function
    return decorator

@entree_contient('.csv')
def importer_csv(*args, **kwargs):
    '''
    Fonction qui permet d'importer un fichier csv dans un DataFrame pandas.
    '''
    return pd.read_csv(*args, **kwargs)
    
importer_csv('country_vaccinations')
```
```
'la première entrée doit contenir .csv'
```

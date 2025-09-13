### 1. Les Décorateurs

Un **décorateur** en Python peut être vu comme une fonction qui modifie le comportement d'autres fonctions.  
En général, on utilise les décorateurs lorsqu'on veut ajouter un certain code à plusieurs fonctions, sans avoir à modifier ces dernières.

Pour appliquer un décorateur à une fonction, on précède la ligne de définition de cette dernière par une ligne comportant un `@` puis le nom du décorateur.

**Exemple d'implémentation**: On cherche un moyen d'introduire les fonctions par leur nom au moment de leur exécution.

```python
def print_before_execution(function):
   def print_then_execute(*args, **kwargs):
       print('voici ce que renvoie la fonction {}'.format(function.__name__))
       function(*args, **kwargs)
   return print_then_execute

@print_before_execution
def print_hello_world():
    print("hello world")

print_hello_world()
```

Le résultat renvoyé est le suivant

```
>>> voici ce que renvoie la fonction print_hello_world
    hello world
```

- **a-** Construire un décorateur nommé **affiche_doc** qui affiche la documentation d'une fonction avant de retourner cette dernière.

La documentation d'une fonction peut être renvoyée avec `fonction.__doc__`

```python
def affiche_doc(function):
    def print_doc(*args, **kwargs):
        print(function.__doc__)
        return function(*args, **kwargs)
    return print_doc
    
import pandas as pd

@affiche_doc
def importer_csv(*args, **kwargs):
    '''
    Fonction qui permet d'importer un fichier csv dans un DataFrame pandas.
    '''
    return pd.read_csv(*args, **kwargs)

importer_csv('country_vaccinations.csv')
```

```
Fonction qui permet d'importer un fichier csv dans un DataFrame pandas.
```   

| country | iso_code  | date | total_vaccinations | people_vaccinated | people_fully_vaccinated | daily_vaccinations_raw | daily_vaccinations | total_vaccinations_per_hundred | people_vaccinated_per_hundred | people_fully_vaccinated_per_hundred | daily_vaccinations_per_million | vaccines | source_name | source_website     |                                                   |
| ------- | --------- | ---- | ------------------ | ----------------- | ----------------------- | ---------------------- | ------------------ | ------------------------------ | ----------------------------- | ----------------------------------- | ------------------------------ | -------- | ----------- | ------------------ | ------------------------------------------------- |
| 0       | Argentina | ARG  | 2020-12-29         | 700.0             | NaN                     | NaN                    | NaN                | NaN                            | 0.00                          | NaN                                 | NaN                            | NaN      | Sputnik V   | Ministry of Health | http://datos.salud.gob.ar/dataset/vacunas-cont... |
| 1       | Argentina | ARG  | 2020-12-30         | NaN               | NaN                     | NaN                    | NaN                | 15656.0                        | NaN                           | NaN                                 | NaN                            | 346.0    | Sputnik V   | Ministry of Health | http://datos.salud.gob.ar/dataset/vacunas-cont... |
|         |           |      |                    |                   |                         |                        |                    |                                |                               |                                     |                                |          |             |                    |                                                   |

On utilise souvent les décorateurs pour afficher le temps d'exécution d'une fonction sans avoir à modifier son code.

- **b-** Construire un décorateur nommé **temps_execution** qui affiche le temps qu'une fonction a mis pour s'exécuter.

Pour rappel, on utilise le module **time** pour mesurer le temps d'exécution d'une fonction :

```python
import time

heure_debut = time.time()
ma_fonction()
heure_fin = time.time()

temps_execution = heure_fin - heure_debut
```

```python
import time

def temps_execution(function):
    def timer(*args, **kwargs):
        heure_debut = time.time()
        results = function(*args, **kwargs)
        heure_fin = time.time()
        temps = heure_fin - heure_debut
        print("Cette fonction s'est exécutée en {} s".format(temps))
        return results
    return timer

@temps_execution
def importer_csv(*args, **kwargs):
    '''
    Fonction qui permet d'importer un fichier csv dans un DataFrame pandas.
    '''
    return pd.read_csv(*args, **kwargs)

importer_csv('country_vaccinations.csv')
```

2.384185791015625e-07


| country | iso_code  | date | total_vaccinations | people_vaccinated | people_fully_vaccinated | daily_vaccinations_raw | daily_vaccinations | total_vaccinations_per_hundred | people_vaccinated_per_hundred | people_fully_vaccinated_per_hundred | daily_vaccinations_per_million | vaccines | source_name | source_website     |                                                   |
| ------- | --------- | ---- | ------------------ | ----------------- | ----------------------- | ---------------------- | ------------------ | ------------------------------ | ----------------------------- | ----------------------------------- | ------------------------------ | -------- | ----------- | ------------------ | ------------------------------------------------- |
| 0       | Argentina | ARG  | 2020-12-29         | 700.0             | NaN                     | NaN                    | NaN                | NaN                            | 0.00                          | NaN                                 | NaN                            | NaN      | Sputnik V   | Ministry of Health | http://datos.salud.gob.ar/dataset/vacunas-cont... |
| 1       | Argentina | ARG  | 2020-12-30         | NaN               | NaN                     | NaN                    | NaN                | 15656.0                        | NaN                           | NaN                                 | NaN                            | 346.0    | Sputnik V   | Ministry of Health | http://datos.salud.gob.ar/dataset/vacunas-cont... |
|         |           |      |                    |                   |                         |                        |                    |                                |                               |                                     |                                |          |             |                    |                                                   |



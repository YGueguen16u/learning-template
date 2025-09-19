## 2. Les annotations ou le typage statique selon Python

Pour simuler un typage statique, Python propose un système d'**annotations**, qui permet à l'utilisateur de préciser le type des variables que l'on souhaite avoir en argument d'une fonction ainsi le type voulu en sortie d'une fonction.

Les annotations s'utilisent comme suit :

```python
def une_fonction(a : str='Hello World') -> None : 
   print(a)
```

La fonction que l'on définit en exemple est extrêmement simple. Cette fonction qui prend en argument une chaine de caractère `a`, valant par défaut `'Hello World'` et qui affiche cette chaîne de caractère en sortie.  
À cette définition, on précise deux annotations.

- La première annotation correspond au type de la variable souhaitée en argument, `a : str`. Ici, on **indique** que l'argument `a` entré par l'utilisateur de notre fonction doit être de type `str`.

- La deuxième annotation indique le type de la valeur en sortie de notre fonction, `-> None`. Ici, on **indique** que la fonction _retourne_ rien, ce qui est cohérent avec son objectif d'_afficher_ uniquement un résultat.

Ces annotations sont accessibles à l'aide de l'attribut `__annotations__`, dans le cas de notre exemple, on aura les annotations suivantes :

```python
print(une_fonction.__annotations__)



>>> {'a': str, 'return': None}
```

```python
def multiply(x: int, y: int) -> int:
    return x * y
```

	•	x: int → x should be an integer
	•	y: int → y should be an integer
	•	-> int → the function returns an integer

```python
def int_list(list_int: list[int]) -> list[int]:
    return list_int

int_list([1, 2, 3, 4, 5])

--- Exécution ---

>>> [1, 2, 3, 4, 5]
```

- (a) Définissez une nouvelle fonction qui calculera l'aire d'un rectangle. Elle prendra en argument la **longueur** et la **largeur** du rectangle, et retournera l'aire de ce dernier. Les variables de la fonction ainsi que son résultat seront annotés du type `float`.
- (b) Affichez les annotations de la fonction.

```python
def aire( l : float, L : float ) -> float :
    return l*L
    
print(aire.__annotations__)
```

```python
{'l': <class 'float'>, 'L': <class 'float'>, 'return': <class 'float'>}
```

Néanmoins, ces annotations ne sont que des annotations et non pas des déclarations de type. En effet, cela ne suffit pas à changer la nature fondamentalement dynamique du typage en Python. En réalité, on peut même se permettre d'annoter nos fonctions avec ce que l'on veut sans enfreindre la bonne exécution de celle-ci.

- (c) Définissez une fonction **afficher**, qui prendra en argument une chaîne de caractères et qui affichera, sans retourner, cette dernière.
- (d) Annotez la fonction.
- (e) Exécutez la fonction avec un argument de type autre que `str`. Commentez.

```python
def afficher(variable : str) -> str:
    print(variable)

print(afficher.__annotations__)

afficher(3)
```

```
{'variable': <class 'str'>, 'return': <class 'str'>}
3
```

Vous l'aurez remarqué, la fonction ne renvoie aucune erreur même si le type de l'argument entré ne correspond pas au type annoté au préalable. Encore une fois, ce système d'annotation n'est en réalité qu'un système **d'indications**, libre à l'utilisateur de suivre ces indications ou non. 


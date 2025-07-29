<h1>Functions</h1>

<h2>Table of Contents</h2>

<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#functions">Functions</a></li>
    <li><a href="#exercise">Exercise</a></li>
  </ul>
</div>
  
<h2 id="preamble">Preamble</h2>

A function is a named block of code used to group a set of instructions that you want to execute together. Its purpose can be twofold:

1. To reuse the same instructions multiple times across your code.
2. To organize a set of complex instructions that only make sense when executed together — even if they are only used once.

By grouping these instructions into a function and assigning it a clear name, the code becomes more readable, maintainable, and self-explanatory for anyone reviewing it.


There are two main types of functions in Python:
	
1. Pre-defined functions (e.g., print(), len())
2. User-defined functions (created by the programmer)

<h2 id="functions">Defining a Function in Python</h2>

To define a function, follow these rules:

1. Use the def keyword, followed by the function name and parentheses () : `def function_name():`
    - The function name should be descriptive and follow Python naming conventions, avoid using reserved keywords
2. Inside the parentheses, specify any parameters (inputs) : `def function_name(param1, param2):`
    - Parameters are optional, but if you have multiple parameters, separate them with commas
    - You can have 0, 1, 2 ... an infinite number of parameters (also called "arguments")
    - It is recommended to have no more than 2-3 parameters/arguments in a function. If you have more, it is often a sign that you need to break the function into two smaller functions.
3. After the parentheses, use a colon : to start the indented body of the function : `def function_name(param1, param2):`
4. You may add an optional docstring to describe the function : 
    ```python
    def function_name(param1, param2): 
        """Description of the function"""
    ```
5. Use the return statement to exit the function and optionally pass back a result : 
    ```python
    def function_name(param1, param2): 
        return param1 + param2
    ```


### Example

```python
def add(a):
    """
    Add 1 to a
    """
    b = a + 1
    print(a, "if you add one", b)
    return b
```

This function takes an input a, adds 1 to it, prints the result, and returns the new value b.

### Indentation

Indenting code means “adding tabs or spaces to a text file.”
Example: try running the code below — what happens?

```python
def my_function():  # no indentation
    print("hello")  # 4-space indentation

def another_function():
  print("yo")  # 2-space indentation

my_function()
another_function()
```

```
hello
yo
```

Whether you use 2 or 4 spaces, the code still works. Now try placing the function’s content without indentation:

```python
def my_function():  # no indentation
print("hello")  # no indentation
```

```
  File "/Users/GUEGUEN/CascadeProjects/tech-learning-template/try.py", line 2
    print("hello")  # no indentation
    ^
IndentationError: expected an indented block
```

Indentation tells Python: “All the code indented with the same number of spaces belongs to the same block.”


Python will let you write code with 1, 2, or even 3 spaces…
But the community standard among developers is :4 spaces per level of indentation!


<h3>help</h3>

- Use the built-in `help()` function to get information about a function or module

```python
help()
```

- If you wrote a docstring, it will be displayed

```python
def my_function(x):
    """
    Add 1 to a
    """
    b = a + 1
    print(a, "if you add one", b)
    return b

help(my_function)
```

```
Help on function my_function in module __main__:

my_function(x)
    Add 1 to a
(END)
```

<h3>Call a function</h3>

To call a function, use the function name followed by parentheses ()

```python
def my_function():
    print("hello")

my_function()
```








```python
def my_function(x):
    output_string = f"vous avez inséré {x} dans la fonction"
    return output_string

print(my_function("salut"))  # résultat: "vous avez inséré salut dans la fonction"

def double(x):
    output = x * 2
    return output

print(double(21))  # résultat: 42
print(double("abc"))  # résultat: "abcabc"

def fonction_affine_maths(x):
    y = 4 * x + 2  # A = 4, b = 2
    return y

resultat = fonction_affine_maths(4)
print(resultat)  # résultat: 18

def fonction_qui_renvoie_toujours_la_meme_chose():
    return 42

response = fonction_qui_renvoie_toujours_la_meme_chose()
print(response)  # résultat: 42

```

        
💡note pour les lecteurs avancés: il y a bien sûr toujours des exceptions justifiées, mais rappelez-vous que quand vous étiez débutant vous aviez probablement le réflexe de créer une maxi_fonction_qui_fait_tout() avec 9 arguments et 150 lignes de code derrière :)

	
	

	

# Exercices

- Créer une fonction hello_there() qui ne renvoie rien mais print “hello_there” (et l’utiliser)
    
    ```python
    def hello_there():
    		print("Hello there !")
    		
    hello_there()  # tant que vous n'appelez pas la fonction, il ne se passe rien !
    ```
    
    
- Rappel f-string: créer une fonction print_bonjour, et lui ajouter un paramètre/argument prenom_a_inserer et faire en sorte que la fonction print: bonjour prenom_a_inserer ! (ex: si on mets Benjamin en input, elle print “bonjour Benjamin”)
    
    ```python
    def print_bonjour(prenom_a_inserer):
    		print(f"bonjour {prenom_a_inserer } !")
    	
    moi = "Benjamin"
    
    print_bonjour(moi)
    ```
    
- créez une fonction create_greeting() avec un argument _name_ qui _renvoie_ Hello _name_
    
    ```python
    def create_greeting(name):
    		return f"Hello {name}"
    		
    greeting = create_greeting("Benjamin")
    print(greeting)
    ```
    
- creéz une fonction jesus avec un argument pains et un deuxième argument chiffre multiplicateur (multipliez le premier argument par le 2e). Cette fonction renvoie le total des pains après multiplication
    
    ```python
    def jesus(pains, multiplicateur):
    		return pains * multiplicateur
    		
    nombre_pains = 3
    multiple = 2 
    
    nombre_final_pains = jesus(nombre_pains, multiple)
    print(nombre_final_pains)
    ```
    
    
    Essayez de mettre “trois” dans le nombre_pains et “Judas” dans la variable multiple que vous passez en 2nd paramètre à la fonction Jesus. Que se passe-t’il ?
        
💡 Quand on explique pas aux utilisateurs de notre code comment ils doivent utiliser nos fonctions, il peut se passer des comportement inattendus comme ça.

C’est pour cette raison que Python permet depuis sa version 3.5 de donner des indications sur ce qu’il faut rentrer comme paramètre, et sur ce qu’on peut attendre de la fonction en sortie.

On appelle ça les type hints, et je vais vous montrer ça dans la partie suivante


# Les fonctions “modernes”

En Python, vous pouvez faire:

```python
x = 5
x = "whatTheF*ck"
```

Et ça ne pose aucun problème.

Dans d’autre langages informatiques, vous devez _dire explicitement_ à votre programme que votre variable x sera un int, ou un float, ou une chaine de caractère, et vous ne pouvez plus en changer par la suite:


Ca rend le code plus verbeux. Mais ça évite des bugs en production.

Beaucoup de développeurs ont jugé pratique le fait de pouvoir spécifier dans le code quel type une variable devait avoir, et ça a été introduit en Python 3.5.

Voici comment ça marche:

![[01_06.png]]
Si la fonction ne renvoie rien (comme nos fonctions hello_there qui ne faisaient que des print() et n’utilisaient pas le keywork _return_), alors il faut utiliser → None:

- Exercice: créez une fonction _multiply_ qui prends deux entiers x et y et les multiplie l’un par l’autre
    
    ```python
    #à l'ancienne
    def mutiply(x, y):
    		return x * y
    
    # les vrais pros depuis Python 3.5:
    def multiply(x: int, y: int) -> int:
    		return x * y
    ```
    
- Exercice: recréez la fonctions jesus en précisant que les argument nombres_pains et multiple doivent être des int
    
    ```python
    def jesus(pains: int, multiplicateur: int) -> int:
    		return pains * multiplicateur
    
    nombre_pains = "trois"
    multiple = "Judas"
    
    nombre_final_pains = jesus(nombre_pains, multiple)
    print(nombre_final_pains)
    ```
    
- Exercice: créez une fonction divede_et_impera qui prends deux entiers et les divise l’un par l’autre. Puis testez votre fonction avec x = 4 et y = 3. Que remarquez vous ?
    
![[Pasted image 20250620134118.png]]    
    Notre fonction renvoie un float. Pourtant, j’avais précisé que la sortie serait un entier (INTeger).
    
💡 Il se s’est rien passé parce que Python vous laisse faire. Mais quand vous serez en entreprise, vous utiliserez surement des outils comme mypy ou pyright qui feront le check de la qualité de votre code et vous alerteront sur le fait que votre sortie peut être un float dans ce cas de figure

> Mais… comment je fais pour laisser l’option entre plusieurs types ?
    
Il faut le faire avec un caractère appelé _pipe_ (pas comme dans l’item pour les fumeurs, mais comme dans tuyau en anglais). Le pipe est créé avec AltGR + 6 sur Windows:
    
```python
def divide_et_impera(x: int, y: int) -> int | float:
		return x / y
```
    
améliorez cette fonction pour qu’elle puisse prendre en argument des float et des ints.

- Solution
	
```python
def divide_et_impera(x: int | float, y: int | float) -> int | float:
	return x / y

```
        

> Ohlala, c’est hyper pénible d’écrire autant de code pour un truc aussi simple. On est vraiment obligés de faire ça ?

💡 Python 3.5 a été introduit en Septembre 2015. Ca fait déjà 10 ans ! Il n’y a plus aucune excuse pour que les tutoriels en ligne ne présentent pas les type hints et les annotations de fonction… Surtout que c’est indispensable quand on travaille sérieusement en entreprise ;)

C’est pour ça que les tutos gratuits fait en une après-midi sur Youtube, c’est généralement pas la folie:

![Un tuto sur Youtube publié en 2024. Heureusement que c’est gratuit, parce qu’enseigner du code comme ça, c’est franchement pas rendre service aux apprenants…](attachment:b8b98010-30f3-43d9-9d44-4a2b4ebf5b7c:image.png)

Un tuto sur Youtube publié en 2024. Heureusement que c’est gratuit, parce qu’enseigner du code comme ça, c’est franchement pas rendre service aux apprenants…

Mais pourquoi est-ce que c’est aussi utilisé ?

1. meilleure relecture du code. Croyez moi, on dirait pas comme ça, mais le code est plus facile à relire quand son auteur nous dit ce qui entre et ce qui sort de chacune des fonctions
    
2. détection d’erreurs: les outils comme mypy et pyright vont détecter des bugs pour vous dans votre code avant même que vous n’ayez besoin d’uploader le code
    
3. votre IDE fonctionnera mieux: beaucoup d’Environnements de Développement Intégrés (Integrated Development Envrionments ou IDE) utilisent ces type hints pour vous fournir une meilleure auto-complétion par exemple.


# Composition de fonctions

Vous pouvez “englober” le résultat d’une fonction par une autre fonction.

```python
print(42)

print(type(42))

print(type(str(42)))

```

Dans ce cas de figure, les fonctions sont exécutées de l’intérieur vers l’extérieur. Voici comment fonctionne la 3e ligne de code:

1. str(42) est exécuté, ce qui _return_ “42”
2. type(”42”) est exécuté, ce qui _return_ <class 'str'>
3. print(”<class 'str'>”) est exécuté, ce qui _affiche_ <class 'str'> dans le terminal

---

Dernier point important !

En python, il y a une distinction entre les types atomiques et les types composites. C’est du verbiage barbare pour distinguer les types qui sont composés d’autres types (une liste peut contenir des int, des floats, etc…, un dictionnaire peut contenir des int, des floats, etc), et les autres ;)

D’un côté, vous avez int, float, et str qui ne contiennent rien d’autre qu’eux-même (_atomiques_) De l’autre côté vous avez les types qui peuvent contenir autre chose (_composites_)

Pourquoi je vous parle de ça ?

![[01_07.png]]
> Heeuuu Benjamin… C’est quoi ce truc _from typing import List ?!_

Glad you asked 😄. C’est ce qu’on va voir dans le prochain chapitre.

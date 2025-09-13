# Les fonctions “natives” (built-in)

Python est livré avec une petite liste de fonction déjà existantes.

- On en a déjà vu ensemble quelques unes. Pouvez-vous vous en souvenir ?
    
    print()
    
    round()
    
    type()
    
    len()
    

    
- Allez jeter un oeil à la liste officielle des functions built-in
[https://docs.python.org/3/library/functions.html](https://docs.python.org/3/library/functions.html)

# input()
    
Testez le code suivant:

```python
age = input("Insérez votre age: ")
print(f"Vous avez {age} ans")
```

C’est le bread and butter des tutoriels Python débutant. Les formateurs s’en servent ensuite pour vous faire créer des “mini programmes” comme un Morpion (Tic Tac Toe) et vous faire croire que vous avez fait un truc stylé ^^ En réalité, vous ne vous resservirez sans doute jamais de input() dans votre vie professionnelle, donc je préfère ne pas m’attarder dessus.

1. **print()**
    
    - Usage: Debugging, afficher l’output de votre code
    
    ```python
    print("Hello, There !")
    # Output: Hello, There !
    ```
    
2. **len()**
    
    - Usage: vérifier la longueur d’une liste, d’une string, ou d’un autre iterable
    
    ```python
    my_list = [1, 2, 3, 4]
    print(len(my_list))
    # Output: 4
    ```
    
3. **range() # on va le revoir plus tard** 🙂
    
    - Usage: génération de séquence pour des boucles for
    
    ```python
    for element in range(5):
        print(element)
    # Output: 0, 1, 2, 3, 4
    ```
    
4. **int(), str(), float(), bool()**
    
    - Usage: convertir un type
    
    ```python
    num = "42"
    print(int(num))    # Output: 42
    print(float(num))  # Output: 42.0
    print(bool(num))   # Output: True
    print(str(42))     # Output: "42"
    ```
    
5. **input()**
    
    - Usage: capturer l’input d’un utilisateur pour s’en resservir dans votre script
    
    ```python
    name = input("What is your name? ")
    print(f"Hello, {name}!")
    # Si input: Alice
    # Alors output: Hello, Alice!
    ```
    
6. **type()**
    
    - Usage: check le type d’un objet python
    
    ```python
    x = 42
    print(type(x))
    # Output: <class 'int'>
    ```
    
7. **isinstance() # on va le revoir plus tard** 🙂
    
    - Usage: check la classe d’un objet python en POO
    
    ```python
    x = 42
    print(isinstance(x, int))    # Output: True
    print(isinstance(x, str))    # Output: False
    print(isinstance(x, dict))   # Output: False
    ```
    
8. **list(), dict(), set(), tuple()**
    
    - Usage: creation de data structures basiques
    
```python
    my_tuple = (1, 2, 3)
    print(list(my_tuple))  # Output: [1, 2, 3]
    
    my_list = [("a", 1), ("b", 2)]
    print(dict(my_list))   # Output: {'a': 1, 'b': 2} -- assez rare d'avoir ça
    
    my_list = [1, 2, 3, 2]
    print(set(my_list))    # Output: {1, 2, 3}
    
    my_list = [1, 2, 3]
    print(tuple(my_list))  # Output: (1, 2, 3)
```
    
9. **sum(), min(), max(), round()**
    
    - Usage: maths et stats
    
    ```python
    numbers = [10, 20, 30, 40]
    
    # `sum()`
    print(sum(numbers))  # Output: 100
    
    # `min()`
    print(min(numbers))  # Output: 10
    
    # `max()`
    print(max(numbers))  # Output: 40
    
    # round()
    print(round(3.141592653589793, 2))
    ```
    

# Recall !

Comment afficher la longueur d’un itérable (liste, tuple, string…)

- Solution
    
    ```python
    print(len(iterable))
    ```
    

Quelle fonction utiliser pour laisser l’utilisateur saisir une information ?

- Solution
    
    ```python
    input()
    
    # exemple
    new_var = input("Entrez votre input ici: ")
    ```
    

Comment savoir si un objet Python est de type str ?

- Solution
    
    ```python
    x = "42"
    print(isinstance(x, str))
    ```
    

Comment créer une liste, un tuple, un dictionnaire et un set ?

- Solution
    
    ```python
    my_tuple = (1, 2, 3)
    print(list(my_tuple))  # Output: [1, 2, 3]
    
    my_list = [("a", 1), ("b", 2)]
    print(dict(my_list))   # Output: {'a': 1, 'b': 2}
    
    my_list = [1, 2, 3, 2]
    print(set(my_list))    # Output: {1, 2, 3}
    
    my_list = [1, 2, 3]
    print(tuple(my_list))  # Output: (1, 2, 3)
    ```
    

—

Voici deux listes de notes:

```python
grades_class_a = [11, 10, 8, 12, 9, 10]
grades_class_b = [20, 20, 20, 0, 0, 0]
```

A) Calculez la moyenne de chaque classe:

- Solution
    
    ```python
    grades_class_a = [11, 10, 8, 12, 9, 10]
    grades_class_b = [20, 20, 20, 0, 0, 0]
    
    mean_a = sum(grades_class_a) / len(grades_class_a)
    print(mean_a)
    mean_b = sum(grades_class_b) / len(grades_class_b)
    print(mean_b)
    
    # Que constatez-vous ?
    ```
    

B )Trouvez la note la plus élevée et la plus faible de la classe A:

- Solution
    
    ```python
    grades_class_a = [11, 10, 8, 12, 9, 10]
    
    print(min(grades_class_a))
    print(max(grades_class_a))
    ```
    


## Avancées

**map(), filter()** # intéressant pour votre culture générale, mais pas utile tout de suite

Usage: Functional programming

```Python
# `map()` 
def square(x: int | float) -> int | float: 
	return x * x 

numbers = [1, 2, 3, 4] 
squared = map(square, numbers) 
print(list(squared)) # Output: [1, 4, 9, 16]

# `filter()` 
def is_even(x: int | float) -> bool: 
	return x % 2 == 0 

numbers = [1, 2, 3, 4] 
even_numbers = filter(is_even, numbers) 
print(list(even_numbers)) # Output: [2, 4]

​
# `zip()` 
list1 = [1, 2, 3] 
list2 = ["a", "b", "c"] 
zipped = zip(list1, list2) 
print(list(zipped)) # Output: [(1, 'a'), (2, 'b'), (3, 'c')]
```
​

<h1>Tuples</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#properties">Properties</a></li>
    <li><a href="#indexing">Indexing</a></li>
    <li><a href="#concatenation-and-replication">Concatenation and Replication</a></li>
    <li><a href="#slicing-stride">Slicing and Stride</a></li>
    <li><a href="#methods-and-functions">Methods and Functions</a></li>
    <li><a href="#adding-or-removing-elements">Adding or removing elements</a></li>
    <li><a href="#exercises">Exercises</a></li>
  </ul>
</div>

<h2 id="properties">Properties</h2>

You can create a tuple with `()` or the `tuple()` constructor.

- **Immutable**: Tuples are immutable, meaning you cannot change their contents.
- **Ordered**: Tuples are ordered, meaning the order of elements is preserved (indexing).
- **Heterogeneous**: Tuples can contain elements of different data types.

```python
tuple_1 = (1, "apple", 3.14, True) # several types : Heterogeneous
tuple_2 = tuple((1, "apple", 3.14, True))
# You can also create a tuple without using the tuple() constructor or parentheses
tuple_3 = "hello !", True, 3.14, 5, [1, 2, 3], {1, 2, 3} 
print(tuple_1)
print(tuple_2)
print(tuple_3)
print(type(tuple_1)) # <class 'tuple'>
print(type(tuple_2)) # <class 'tuple'>
print(type(tuple_3)) # <class 'tuple'>
```

**Create a Tuple with one element**

- You must add a comma after the element to create a tuple with one element.
- If you don't add a comma, Python will consider the type as the type of the element.
```python
tuple_1 = (1,)
print(tuple_1) # (1,)
print(type(tuple_1)) # <class 'tuple'>

tuple_2 = (1)
print(tuple_2) # 1
print(type(tuple_2)) # <class 'int'>

tuple_3 = ("apple",)
print(tuple_3) # ('apple',)
print(type(tuple_3)) # <class 'tuple'>

tuple_4 = ("apple")
print(tuple_4) # apple
print(type(tuple_4)) # <class 'str'>
```

- The power of tuples is not immediately obvious, but one of the major advantages of this class is what we call tuple assignment, which allows you to assign values to multiple variables simultaneously :

```python
a, b, c = 1, 2, 3
print(a) # 1
print(b) # 2
print(c) # 3
```

- Tuple assignment gives a syntaxic solution to the problem of value exchange : We have two variables a and b and we want to exchange their values, that is, that a takes the value of b and b the value of a.

- In classic programming languages, we would be forced to create a temporary variable that contains one of the values of a or b:

```python
   # On stocke la valeur de a dans une variable temporaire
   tmp = a

   # On met à jour a avec la valeur de b
   a = b

   # On met à jour b avec la valeur de la variable temporaire
   b = tmp
```

- With tuple assignment, this operation can be done in one line :

```python 
   # Exchange values between a and b
   a, b = b, a
```


<h2 id="indexing">Indexing</h2>

```python
my_tuple = ("Element 1", "Element 2", "Element 3", "Element 4", "Element 5")
```

**Positive Indexes**

| Index | Value |
|-------|-------|
| 0 | Element 1 |
| 1 | Element 2 |
| 2 | Element 3 |
| 3 | Element 4 |
| 4 | Element 5 |

**Negative Indexes**

| Index | Value |
|-------|-------|
| -5 | Element 1 |
| -4 | Element 2 |
| -3 | Element 3 |
| -2 | Element 4 |
| -1 | Element 5 |

```python
my_tuple = ("Element 1", "Element 2", "Element 3", "Element 4", "Element 5")

print(my_tuple[0]) # Element 1
print(my_tuple[-1]) # Element 5
print(type(my_tuple[0])) # <class 'str'>
```

**immutable**

```python
my_tuple = ("Element 1", "Element 2", "Element 3", "Element 4", "Element 5")
my_tuple[0] = "Element 6"
print(my_tuple)
```

```
Traceback (most recent call last):
  File "/Users/GUEGUEN/CascadeProjects/tech-learning-template/python/basics/try.py", line 2, in <module>
    my_tuple[0] = "Element 6"
TypeError: 'tuple' object does not support item assignment
```

**Nested data structure**

- You can create a tuple of any data type and nested data structure.

```python
my_tuple = tuple(("hello !", {"key_1": "value_1", "key_2": "value_2"}, 3.14, (3, "hello !", 5), [1, 2, 3], {1, 2, 3}))
print(my_tuple)
print(type(my_tuple))
print(type(my_tuple[0]))
print(type(my_tuple[1]["key_1"]))
print(type(my_tuple[4][0]))

my_tuple_2 = tuple(("hello !", (1, "hello !", (3, "hello !", 5))))
print(my_tuple_2)
print(type(my_tuple_2))
print(my_tuple_2[1][2][0])
```

<h2 id="concatenation-and-replication">Concatenation and Replication</h2>

**Concatenation**

```python
my_tuple_1 = (1, 2, 3)
my_tuple_2 = (4, 5, 6)
my_tuple_3 = my_tuple_1 + my_tuple_2
print(my_tuple_3)
```

```
(1, 2, 3, 4, 5, 6)
```

- Note :

```python
my_tuple = (1, 2, 3)
print(id(my_tuple)) # e.g., 4335632768
my_tuple += (4, 5, 6)
print(my_tuple)
print(id(my_tuple)) # e.g., 4334979168
```

```
(1, 2, 3, 4, 5, 6)
```

- You can see that the memory address has changed when you use the `+=` operator, because you can't modify a tuple.

**Replication**

```python
my_tuple_1 = (1, 2, 3)
my_tuple_2 = my_tuple_1 * 3
print(my_tuple_2)
```

```
(1, 2, 3, 1, 2, 3, 1, 2, 3)
```

- Note : 

```python
my_tuple = (1, 2, 3)
print(id(my_tuple)) # e.g., 4299374976
my_tuple *= 3
print(my_tuple)
print(id(my_tuple)) # e.g., 4299107008
```

```
(1, 2, 3, 1, 2, 3, 1, 2, 3)
```

- You can see that the memory address has changed when you use the `*=` operator, because you can't modify a tuple.

<h2 id="slicing-stride">Slicing and Stride</h2>

- slicing : `tuple[start:stop]`
- stride : `tuple[start:stop:step]`

```python
my_tuple = ("hello !", True, 3.14, 5, [1, 2, 3])

# Retrieve the first two elements
print(my_tuple[0:2])

# Retrieve from the third to the sixth elements
print(my_tuple[2:5])

# Retrieve from the second last to the last element
print(my_tuple[-2:])

# Retrieve from the second to the second element with a stride of 2
print(my_tuple[1:2:2])

# Invert the tuple with a stride of 2
print(my_tuple[::-2])
```

<h2 id="methods-and-functions">Methods and Functions</h2>

| Function | Description | Example |
| --- | --- | --- |
| len() | Tuple length | len(t) → 4 |
| sum() | Sum of numeric elements | sum(t) → 14 |
| min() | Minimum value | min(t) → 1 |
| max() | Maximum value | max(t) → 7 |
| sorted() | Returns a sorted list (does not modify t) | sorted(t) → [1, 2, 4, 7] |

```python
my_tuple = (1, 2, 3)
print(len(my_tuple)) # 3
print(sum(my_tuple)) # 6
print(min(my_tuple)) # 1
print(max(my_tuple)) # 3
print(sorted(my_tuple)) # [1, 2, 3] # does not modify the tuple, creates a new list
```

<h2 id="adding-or-removing-elements">Adding or removing elements</h2>

- You can't add or remove elements from a tuple, because it's immutable.
- You can add or remove an element from a tuple by converting it to a list, modifying the list, and then converting it back to a tuple.

```python
my_tuple = (1, 2, 3)
my_list = list(my_tuple)
my_list.append(4)
my_tuple = tuple(my_list)
print(my_tuple) # (1, 2, 3, 4)
```

```python
my_tuple = (1, 2, 3)
my_list = list(my_tuple)
my_list.remove(2)
my_tuple = tuple(my_list)
print(my_tuple) # (1, 3)
```

```python
my_tuple = (1, 2, 3)
my_list = list(my_tuple)
a = my_list.pop(1)
my_tuple = tuple(my_list)
print(my_tuple) # (1, 3)
print(a) # 2
```

<h2 id="exercises">Exercises</h2>

<h3 id="exercise-1">Exercise 1</h3>


1. Create Two Tuples Using Different Methods
	- Create a tuple named fruits that contains the elements "apple", "banana", "cherry", and "grape" using two different methods.
	- Print both tuples and confirm their type using type().


2. Try to Modify a Tuple (Immutability)
	- Attempt to change the first element of the fruits tuple to "orange".
	- Observe and note the error message that appears.


3. Access Elements by Index
	- Create a tuple named cities from a list that contains exactly 5 city names of your choice.
	- Print:
	- The first element using a positive index.
	- The last element using a positive index.
	- The last element using a negative index.


4. Tuples Can Hold Mixed Data Types
	- Create a tuple named mixed with exactly 4 elements:
	1. An integer
	2. A float
	3. A string
	4. A boolean
	- Print the type of each element using type().


5. Create a Tuple with Only One Element
	- Create a tuple named one_item that contains only the string "coffee".
	- Then create another variable named not_a_tuple with the same syntax but without the comma.
	- Print the type of both to confirm the difference.


6. Create a Tuple with Nested Data Structures
	- Create a tuple named nested_tuple containing:
	1. A string "Hello"
	2. A dictionary with two keys and values of your choice
	3. A list with 3 integers
	4. A nested tuple (a tuple that contains another tuple)
	- Then:
        - print the third letter of the string.
        - print the second value in the dictionary.
        - print the inner value inside the nested tuple.

nested_tuple = ("Hello", {"key_1": "value_1", "key_2": "value_2"}, [1, 2, 3], (("hello !", 5), ("hello !", 6)))
print(nested_tuple[0][2])   # l
print(nested_tuple[1]["key_2"])   # value_2
print(nested_tuple[3][1][1])   # 6

7. In one or two sentences, explain what makes a tuple different from a list in Python?


```python
# 1. 
fruits = ("apple", "banana", "cherry", "grape")
fruits_2 = tuple(("apple", "banana", "cherry", "grape"))
print(fruits)
print(fruits_2)
print(type(fruits))
print(type(fruits_2))

# 2.
fruits[0] = "orange"

# 3.
list_cities = ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix"]
cities = tuple(list_cities)
print(cities)
print(cities[0])
print(cities[-1])

# 4.
mixed = (1, 2.0, "hello !", True)
print(type(mixed[0]))
print(type(mixed[1]))
print(type(mixed[2]))
print(type(mixed[3]))

# 5.
one_item = ("coffee",)
not_a_tuple = ("coffee")
print(type(one_item))
print(type(not_a_tuple))

# 6.
nested_tuple = ("Hello", {"key_1": "value_1", "key_2": "value_2"}, [1, 2, 3], (("hello !", 5), ("hello !", 6)))
print(nested_tuple[0][2])   # l
print(nested_tuple[1]["key_2"])   # value_2
print(nested_tuple[3][1][1])   # 6

# 7.
"""
Tuple is immutable, list is mutable
"""
```

<h3 id="exercise-2">Exercise 2</h3>

1. Concatenate two tuples
    - Create two tuples of integers.
    - Concatenate them into a third tuple.
    - Print the result.

2. Check memory change after using +=
    - Print the id of a tuple before and after += another tuple.
    - Observe whether the memory address changed. How can you explain this?

3. Replicate a tuple
    - Create a tuple of three elements.
    - Replicate it 3 times using *.
    - Print the result.

4. Check memory change after using *=
    - Print the id before and after using *=.
    - Observe the memory address.

5. Slice and Stride
    - Create a tuple with at least 5 different types of elements.
    - Print the following slices:
        • First two elements
        • From third to sixth
        • Last two elements
        • Slice with stride = 2
        • Reverse with stride = 2

```python
# 1. Concatenation
my_tuple_1 = (1, 2, 3)
my_tuple_2 = (4, 5, 6)
my_tuple_3 = my_tuple_1 + my_tuple_2
print(my_tuple_3)

# 2. Memory address change with +=
my_tuple = (1, 2, 3)
print(id(my_tuple))
my_tuple += (4, 5, 6)
print(my_tuple)
print(id(my_tuple))
# You can see that the memory address has changed when you use the += operator, because you can't modify a tuple.

# 3. Replication
my_tuple_1 = (1, 2, 3)
my_tuple_2 = my_tuple_1 * 3
print(my_tuple_2)

# 4. Memory address change with *=
my_tuple = (1, 2, 3)
print(id(my_tuple))
my_tuple *= 3
print(my_tuple)
print(id(my_tuple))
# You can see that the memory address has changed when you use the *= operator, because you can't modify a tuple.

# 5. Slicing and Stride
my_tuple = ("hello !", True, 3.14, 5, [1, 2, 3])

print(my_tuple[0:2])     # First two elements
print(my_tuple[2:5])     # From third to sixth (3rd, 4th, 5th)
print(my_tuple[-2:])     # Last two elements
print(my_tuple[::2])     # From index 0 to 4 with stride 2 (returns index 0, 2, 4)
print(my_tuple[::-2])    # Reverse with stride of 2

<h3 id="exercise-3">Exercise 3</h3>

1. Basic Functions on Tuples

You have the following tuple of scores:

```python
scores = (1, 2, 4, 7)
```

Use built-in Python functions to:

- Get the number of elements in the tuple.
- Get the total sum of the scores.
- Get the minimum and maximum values.
- Return a sorted version of the tuple (as a list).

2. Tuple Immutability — Adding Elements

You realize a score was missing. You want to add `10` to the tuple.
How to proceed ? 

3. Tuple Immutability — Removing Elements

You later find out the score `2` was an error and needs to be removed.
How to proceed ? 


4. Tuple Immutability — Popping Elements

Finally, you want to pop the second value from the tuple and store it in a variable called `popped_value`.


**Solutions**

```python
# 1. Basic Functions
scores = (1, 2, 4, 7)
print(len(scores))       # 4
print(sum(scores))       # 14
print(min(scores))       # 1
print(max(scores))       # 7
print(sorted(scores))    # [1, 2, 4, 7]

# 2. Adding Elements
scores = (1, 2, 4, 7)
scores_list = list(scores)
scores_list.append(10)
scores = tuple(scores_list)
print(scores)            # (1, 2, 4, 7, 10)

# 3. Removing an Element
scores_list = list(scores)
scores_list.remove(2)
scores = tuple(scores_list)
print(scores)            # (1, 4, 7, 10)

# 4. Popping an Element
scores_list = list(scores)
popped_value = scores_list.pop(1)
scores = tuple(scores_list)
print(scores)            # (1, 7, 10)
print(popped_value)      # 4
```

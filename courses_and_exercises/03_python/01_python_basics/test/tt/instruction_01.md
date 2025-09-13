### 1. What is Python?

* **Imperative**: a program consists of a sequence of predefined instructions that allow the execution of actions (writing, entering input, performing a calculation, reading a file, etc.);

* **Structured**: the execution of a program is not strictly sequential; control structures allow a sequence of instructions to be repeated in loops or executed only under certain conditions;

* **Low-level**: it handles access to memory, calculations within the microprocessor, and input-output operations;

* **Modular**: it has many libraries that can be loaded to perform more specific instructions;

* **Object-oriented**: it allows object-oriented programming, a more advanced concept that will not be covered this year.

### 2. Open a python shell in the terminal and print the type of `50` then exit the shell.

- write `python3` in the terminal
- In the shell, write `type(50)`
- Close the shell with `exit()`

### 3. How to konw systems settings about float type?

- `sys.float_info`

### 4. Cast `2.0` to boolean and `False` to float.

- `bool(2.0)` --> `True`
- `float(False)` --> `0.0`

### 5. List 12 different built-in type constructors with examples, categorized:**

| Group      | Type    | Constructor | Instance    |
|------------|---------|-------------|-------------|
| None       | object  | None        | None        |
| Numbers    | int     | int()       | 2           |
|            | long    | long()      | 2.896547..  |
|            | float   | float()     | 2.8         |
|            | complex | complex()   | 1j          |
|            | bool    | bool()      | True, False |
| Characters | str     | str()       | 'a'         |
| Sequences  | list    | list()      | [1, 2]      |
|            | tuple   | tuple()     | (1,2)       |
|            | range   | range()     | range(2)    |
| Mapping    | dict    | dict()      | {'A': 2}    |
| Sets       | set     | set()       | {1, 2, 3}   |

### 6. Why is Python a dynamically typed language?

- Python is dynamically typed because:
  - Type checking is only done at runtime
  - Variables can change types during their lifetime
  - Example: A variable can start as one type and be converted to another
  - For instance: `"2.5"` (string) can become `2.5` (float) using `float()`
  - Built-in objects can also change types:
    - Lists can be converted to tuples or sets
    - Numbers can be converted between int, float, etc.

### 7. Are `"2.5"` and `"hello"` of the same type? 

- `type("2.5") == type("hello")` --> `True`

### 8. What is PEMDAS in Python? Give an example showing the order of operations.

- PEMDAS is the order of operations in Python:
    - **P**arentheses
    - **E**xponents
    - **M**ultiplication and **D**ivision (left to right)
    - **A**ddition and **S**ubtraction (left to right)

Example:
```python
result = (30 + 2) * 60  # Parentheses first (32), then multiplication
print(result)           # Output: 1920
```

### 9. Why doesn't Python require type declaration for variables?

- Python uses dynamic typing:
    - Variable types are assigned automatically based on their value
    - The type is determined at runtime
    - The same variable can hold different types during its lifetime
- Example:
    ```python
    x = 42        # x is automatically an integer
    x = "Hello"   # now x is automatically a string
    ```

### 10. What are the rules for variable names in Python? Give examples of valid and invalid names. (What are naming conventions in Python?)

Invalid examples:
```python
1variable = 10     # Can't start with a number
print = "Hello"    # Can't use Python keywords
my-var = 20        # Can't use hyphens
```

Valid examples:
```python
my_variable = 10 # snake case
_private = 20 # snake case
camelCase = 30 # camel case
TOTAL_TIME = 40 # uppercase
```

### 11. Show 5 different ways to perform multiple variable assignment in Python.

```python
# 1. Direct multiple assignment
e, f, g = 2.5, 2, 'hello'
print(e, f, g)  # 2.5 2 hello

# 2. List unpacking
a, b, c = [1, 2, 3]
print(a, b, c)  # 1 2 3

# 3. Tuple unpacking
x, y, z = (4, 5, 6)
print(x, y, z)  # 4 5 6

# 4. String unpacking
s1, s2 = "ab"
print(s1, s2)  # a b

# 5. Dictionary key unpacking
k1, k2 = {"a": 1, "b": 2}
print(k1, k2)  # a b
```

### 12. Is it possible to change the last letter of the string "Skog Research Reactor" by indexing?

- No, Strings are immutable.

```python
reactor_name = "Skog Research Reactor"
reactor_name[-1] = "X"
```

```
Traceback (most recent call last):
  File "/Users/GUEGUEN/CascadeProjects/tech-learning-template/python/basics/try.py", line 18, in <module>
    reactor_name[-1] = "X"
TypeError: 'str' object does not support item assignment
```

### 13. Write the following string "Skog Research Reactor" with "reactor" in a new line, and "Research" with a tab.

```python
print("Skog \tResearch \nReactor")
```

### 14. Create a list with two possible ways. Then create Lists from string, tuple, range, set, dictionary.

```python
list_1 = [1, 2, 3]
list_2 = list([1, 2, 3])
list_3 = list("hello") # ['h', 'e', 'l', 'l', 'o']
list_4 = list((1, 2, 3)) # [1, 2, 3]
list_5 = list(range(1, 5)) # [1, 2, 3, 4]
list_6 = list({1, 2, 3}) # [1, 2, 3]
list_7 = list({"a": 1, "b": 2}) # ['a', 'b']
```

### 15. Properties of lists, sets, tuples and dictionaries.

- **List**: 
  - **Ordered**: Lists are ordered collections, meaning the order of elements is preserved (indexing).
  - **Mutable**: Lists are mutable, meaning you can modify their contents.
  - **Heterogeneous**: Lists can contain elements of different data types.  
  
- **Set**: 
  - Unordered
  - Mutable
  - Heterogeneous
  - No duplicates




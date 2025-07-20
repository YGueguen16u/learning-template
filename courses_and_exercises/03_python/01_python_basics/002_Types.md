<h1>Python Data Types</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#common-types">Common Python Data Types</a></li>
    <li><a href="#integers">Integers (int)</a></li>
    <li><a href="#floats">Floats (float)</a></li>
    <li><a href="#strings">Strings (str)</a></li>
    <li><a href="#booleans">Booleans (bool)</a></li>
    <li><a href="#casting">Type Casting</a></li>
    <li><a href="#complement">Complement</a>
    <ul>
      <li><a href="#numbers">1. Should numbers be quoted?</a></li>
      <li><a href="#built-in-types">2. Built-in Types</a></li>
      <li><a href="#dynamic-typing">3. Dynamic Typing</a></li>
      <li><a href="#type-comparisons">4. Type Comparisons</a></li>
    </ul> 
    </li>
  </ul>
</div>

<hr>

<h2 id="common-types">Common Python Data Types</h2>

A **type** in Python determines what kind of data a value holds and what operations can be performed on it.


|**Expression**|**Data Type**|**Example Use**|
|---|---|---|
|11|int|Number of apples|
|21.213|float|Measurement in meters|
|"Hello"|str|Name, message, sentence, etc.|

```python
type(11)         # <class 'int'>
type(21.213)     # <class 'float'>
type("Hello")    # <class 'str'>
```


<h2 id="integers">Integers (int)</h2>

- Whole numbers, positive or negative.
    
- Example: -5, 0, 12, 2048

**Example:**

```python
type(-7)    # <class 'int'>
```

**Exercise 1:** Try `type(50)` in a Python shell

**hint:**
- type python3 in your terminal to open a Python shell
- write `type(50)` in the shell when `>>>` appears
- close the shell with `exit()`

```bash
# Open a Python shell
GUEGUEN@mac tech-learning-template % python3
Python 3.9.6 (default, Apr 30 2025, 02:07:17) 
[Clang 17.0.0 (clang-1700.0.13.5)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> type(50)
<class 'int'>
>>> # Close the shell with `exit()`
>>> exit()
```



<h2 id="floats">Floats (float)</h2>

- Real numbers (with decimals), including in-between values.
    
- Example: 3.14, 0.5, -2.78

**Exercise 2:** Try `type(9.81)` in a Python shell

```bash
# Open a Python shell
GUEGUEN@mac tech-learning-template % python3
Python 3.9.6 (default, Apr 30 2025, 02:07:17) 
[Clang 17.0.0 (clang-1700.0.13.5)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> type(9.81)
<class 'float'>
>>> # Close the shell with `exit()`
>>> exit()
```


<h2 id="strings">Strings (str)</h2>

- A sequence of characters enclosed in quotes.
    
- Example: "Python" or 'Python', "123" or '123'
      
**Example:**

```python
type("123")     # <class 'str'>
```

**Exercise 3:** Try `type("Who are you ?")` in a Python shell

```bash
# Open a Python shell
GUEGUEN@mac tech-learning-template % python3
Python 3.9.6 (default, Apr 30 2025, 02:07:17) 
[Clang 17.0.0 (clang-1700.0.13.5)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> type("Who are you ?")
<class 'str'>
>>> # Close the shell with `exit()`
>>> exit()
```

**Exercise 4:** Try `type("55")` in a Python shell

```bash
# Open a Python shell
GUEGUEN@mac tech-learning-template % python3
Python 3.9.6 (default, Apr 30 2025, 02:07:17) 
[Clang 17.0.0 (clang-1700.0.13.5)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> type("55")
<class 'str'>
>>> # Close the shell with `exit()`
>>> exit()
```

`type("55")` returns <class 'str'>

#### System settings about float type

```python
import sys
sys.float_info
```

```bash
sys.float_info(max=1.7976931348623157e+308, ..., epsilon=2.220446049250313e-16, radix=2)
```


<h2 id="booleans">Booleans (bool)</h2>

- Represents True or False
    
- Note the uppercase first letter. 
    

**Examples:**

```python
type(True)   # <class 'bool'>
type(False)  # <class 'bool'>
```


<h2 id="casting">Type Casting (Changing Type)</h2>

| **From**     | **To**       | **Code & Result**            |
| ------------ | ------------ | ---------------------------- |
| int → float  | float(2)     | 2.0                          |
| float → int  | int(1.9)     | 1 _(info loss!)_             |
| str → int    | int("4")     | 4 _(only if numeric string)_ |
| int → str    | str(3)       | "3"                          |
| bool → int   | int(True)    | 1                            |
| int → bool   | bool(0)      | False                        |
| bool → float | float(False) | 0.0                          |

**Invalid example:**

```python
int("abc")    # ❌ ValueError: invalid literal for int()
int('1 or 2 people') # ❌ ValueError: invalid literal for int()
```


<h2 id="complement">Complement</h2>

<h3 id="numbers">1. Should numbers be quoted?</h3>

Yes, it changes everything. `"42"` is a string, `42` is an integer.

Also, precision affects memory: 
- float16
- float32
- float64

<ul>
  <li><a href="https://pythonspeed.com/articles/float64-float32-precision/">Precision and float sizes</a></li>
  <li><a href="https://www.kaggle.com/code/arjanso/reducing-dataframe-memory-size-by-65">Reduce DataFrame memory usage</a></li>
</ul>

<h3 id="built-in-types">2. Built-in Types</h3>


- Built-in data types are data types that are built into the Python interpreter
- It means they are pre-defined in python and can be used directly into the program

**Available built-in types in python**

For a comprehensive view of python available built-in types, check [python 3.9 standard library documentation](https://docs.python.org/3.9/library/stdtypes.html)

This list contains only the most common built-in types.

| Group      | type    | constructor | instance    |
| ---------- | ------- | ----------- | ----------- |
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

<h3 id="dynamic-typing">3. Dynamic Typing</h3>

- Python is a dynamically typed langage: Python interpreter does type checking only as code runs.

- The type of a variable is allowed to change over its lifetime.

- A variable can be initiated with a type and turned into another type

- For instance, a variable defined as "2.5" can be turned into 2.5 using the _float()_ function

- The type of some other built-in objects are allowed to change over time

- For instance, a list can be turned into a tuple or a set

```python
b = "2.5"
print(type(b), b)
b = float(b)
print(type(b), b)

# a list converted into tuple then set
tuple([1,2])
set([1,2])
```


<h3 id="type-comparisons">4. Type Comparisons</h3>

**What does type("hello" == "world") return?**
```python
type("hello" == "world") # bool
```


```python
print(type(2.5)==type(3.5))
print(type(3)==type(4.5))
print(type(5.5)==type("5.5"))
```

<h1>Functions</h1>

<h2>Table of Contents</h2>

<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#functions">Functions</a></li>
    <ul>
        <li><a href="#help">help</a></li>
        <li><a href="#call_a_function">Call a function</a></li>
        <li><a href="#type_of_parameters">Type of parameters</a></li>
        <li><a href="#default-parameters">Default Parameters</a></li>
        <li><a href="#functions-vs-procedures">Functions vs Procedures</a></li>
    </ul>
    <li><a href="#variable-scope">Variable Scope</a></li>
    <ul>
        <li><a href="#another-example">Another example</a></li>
    </ul>
    <li><a href="#if-else-and-loop-in-a-function">If Else and Loop in a Function</a></li>
    <li><a href="#collections-and-functions">Collections and Functions</a></li>
    <li><a href="#basic-function-annotations">Basic Function Annotations</a></li>
    <ul>
        <li><a href="#type-annotations-in-functions">Type Annotations in Functions</a></li>
        <li><a href="#basic-function-annotations">Basic Function Annotations</a></li>
        <li><a href="#functions-that-return-nothing">Functions That Return Nothing</a></li>
        <li><a href="#type-mismatch">Type Mismatch Issue</a></li>   
    </ul>
    <li><a href="#return-vs-no-return-vs-return-none">Return vs no return vs return none</a></li>
    <li><a href="#generators">Generators</a></li>
    <li><a href="#lambda">Lambda</a></li>
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


    - No line is read after the return statement

    ```python
    def add(a):
        """
        Add 1 to a
        """
        b = a + 1
        print(a, "if you add one", b)
        return b
        print("this will not be printed")
    ```

    ```
    1 if you add one 2
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


<h3 id="help">help</h3>

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

<h3 id="call_a_function">Call a function</h3>

- To call a function, use the function name followed by parentheses ()

```python
def my_function():
    print("hello")

my_function()
```

- You can pass arguments to a function

```python
def my_function(x):
    output_string = f"This is the return of the function: {x}"
    return output_string

x = "Hey"
print(my_function(x)) # returns: "This is the return of the function: Hey"
```

**example :**

- a function to give the square of a number

```python
def square(x):
    return x * x
```

```python
v = 2 
print(square(v))

# Directly enter a number as parameter
print(square(3))
```

```
4
9
```




<h3 id="type_of_parameters">Type of parameters</h3>

You don't need to specify the type of parameters in Python. You can pass any type of argument to a function.

**example :**

A function to multiply two numbers.

```python
def multiply(x, y):
    return x * y
```

You can multiply two integers, two floats, or an integer and a float.

```python
print(multiply(2, 3))
print(multiply(4.5, 5.9))
print(multiply(8.8, 3))
```

```
6
26.55
26.400000000000002
```


You can multiply a string and an integer.

```python
print(multiply("abc", 3))
```

```
abcabcabc
```

However you need to respect the basic rules of the language.

```python
print(multiply("abc", "def"))
```

```
Traceback (most recent call last):
  File "/Users/GUEGUEN/CascadeProjects/tech-learning-template/try.py", line 9, in <module>
    print(multiply("abc", "def"))
  File "/Users/GUEGUEN/CascadeProjects/tech-learning-template/try.py", line 2, in multiply
    return x * y
TypeError: can't multiply sequence by non-int of type 'str'
```

<h3 id="default-parameters">Default Parameters</h3>

You can set default values for parameters in a function.

```python
def multiply(x, y=1):
    return x * y
```

```python
print(multiply(2))
print(multiply(2, 3))
```

```
2
6
```

<h2 id="output-with-several-parameters">Output with several parameters</h2>

When a function returns several outputs, the result of the function is actually a tuple. We can use tuple assignment to store the outputs in different variables :

```python
# Definition of a function that returns the first and last
# element of a list
def first_and_last(a_list):
   return a_list[0], a_list[-1]

# Tuple assignment to store the outputs
first, last = first_and_last([-2, 32, 31, 231, 4])

print(type(first_and_last([-2, 32, 31, 231, 4]))) # <class 'tuple'>

print(first) # -2
print(last) # 4

print(type(first, last)) # Traceback (most recent call last): File "<stdin>", line 1, in <module> TypeError: type() takes 1 or 3 arguments
```



<h2 id="functions-vs-procedures">Functions vs Procedures</h2>

- A function process an action and returns a result to the caller
    - When the keyword `return` is used, the function returns a value to the caller
- A procedure process an action and does not return a result to the caller
    - When the keyword `return` is not used, the function does not return a value to the caller => it's a procedure

- In python, procedures are not procedures, everything is a function.
    - Indeed, if no 'return' is used, the function returns 'None'. The result is not mentioned in the console and everything happens as if the function was a procedure.



<h2 id="variable-scope">Variable Scope</h2>

**Function Parameters**
A formal parameter is a variable that serves as an input to a function. Think of it as a placeholder that receives a value when the function is called. It's like a mailbox waiting to receive a letter!

**Variable Scopes in Python**

**Local Variables**
A local variable is declared inside a function
It only exists within the function's boundaries (from start to end)
It's like a private room - what happens in the function, stays in the function!

```python
def my_function():
    # local variable
    x = 10
    print(x)

my_function()
```

**Global Variables**
A global variable is declared outside of any function
It can be accessed and modified throughout the entire program
Think of it as a public announcement board that everyone can see and use

```python
# global variable
x = 10

def my_function(a):
    # global variable
    print(a)

my_function(x)
```

```
10
```

**Understanding Global vs Local Variables**

```python
# First, let's see what happens with regular variables
message = "Hello World"  # This is a global variable

name = "John"

def greet(name):
    internal_name = "Alice"      # This is a local variable
    print(f"{message}, {internal_name}, {name}!")

greet(name)                 # Works fine! We can read global variables
greet(internal_name)           # Error! Can't access local variable outside function    
print(internal_name)           # Error! Can't access local variable outside function
```

```
Hello World, Alice, John!
```

**The `global` Keyword**
To modify a global variable inside a function, we need to declare it using the `global` keyword:

```python
# global variable
internal_counter = 0

def increment():
    global internal_counter    # Tell Python we want to use the 
    internal_counter += 1      # Now we can modify it
    print(f"Counter is now: {internal_counter}")

increment()  # Output: Counter is now: 1
increment()  # Output: Counter is now: 2
print(internal_counter)  # Output: 2
```

```
Counter is now: 1
Counter is now: 2
2
```

**Best Practices**
While global variables are powerful, use them sparingly! They can make code harder to understand and maintain. Consider passing variables as parameters instead:

```python
def better_increment(value):
    return value + 1

number = 5
number = better_increment(number)  # More explicit and easier to track
```

```
6
```

<h3 id="another-example">Another example</h3>

```python
# Global variable - accessible everywhere
favorite_artist = "AC/DC"

def rate_artist(artist_name):
    if artist_name == favorite_artist:
        return 10.0    # Big fan!
    else:
        return 8.0     # Still good!

# We can use the global variable here
print(f"Rating for {favorite_artist}: {rate_artist(favorite_artist)}")
print(f"Rating for Taylor Swift: {rate_artist('Taylor Swift')}")
```

```
Rating for AC/DC: 10.0
Rating for Taylor Swift: 8.0
```

**Local Variable Example**

```python
def rate_artist(artist_name):
    # Local variable - only exists inside this function
    top_artist = "AC/DC"
    
    if artist_name == top_artist:
        return 10.0
    else:
        return 8.0

print(f"Rating for AC/DC: {rate_artist('AC/DC')}")
# This would cause an error:
# print(f"Top artist is: {top_artist}")  # Error! top_artist only exists inside the function
```

```
Rating for AC/DC: 10.0
```

When Names Collide

```python
favorite_band = "AC/DC"  # Global variable

def get_rating(band_name):
    # Local variable with same name as global
    favorite_band = "Queen"  # This creates a new local variable
    
    if band_name == favorite_band:
        return 10.0
    return 8.0

print(f"Rating: {get_rating('AC/DC')}")  # Uses local variable (Queen)
print(f"My favorite band is still: {favorite_band}")  # Global variable (AC/DC)
```

```
Rating: 8.0
My favorite band is still: AC/DC
```

<h2 id="if-else-and-loop-in-a-function">IF / ELSE and Loop in a function</h2>

**Control Flow in Functions**
Functions become truly powerful when combined with control flow statements! Let's explore how to use conditions and loops within functions.

**Conditional Statements in Functions**
Functions can make decisions using `if/else` statements. The `return` statement is perfect for sending back different results based on conditions:

```python
def check_temperature(temp):
    print(f"Checking temperature: {temp}°C")
    if temp > 30:
        return "Too hot!"
    elif temp < 10:
        return "Too cold!"
    else:
        return "Just right!"

# Let's try it
result = check_temperature(35)
print(result)  # Output: Too hot!
```

**Loops in Functions**
Functions can also process multiple items using loops. Here's how you can work with sequences:

```python
def process_items(items):
    print("Processing each item:")
    for item in items:
        print(f"-> {item}")

# With a list
process_items(["apple", "banana", "cherry"])
# Output:
# Processing each item:
# -> apple
# -> banana
# -> cherry

# With a string (strings are sequences too!)
process_items("ABC")
# Output:
# Processing each item:
# -> A
# -> B
# -> C
```

<h2 id="Collections and Functions"> Collections and Functions</h2>

When the number of arguments  are unknown for a function, They can all be packed into a tuple as shown:

```python
def add_to_playlist(*songs):  # Pack all songs into a tuple
    print(f"Adding {len(songs)} songs to playlist:")
    for i, song in enumerate(songs, 1):
        print(f"{i}. {song}")
    print("Playlist updated!")

# Adding 3 songs
add_to_playlist('Thunderstruck', 'Highway to Hell', 'Back in Black')

# Adding 5 songs
add_to_playlist('Bohemian Rhapsody', 'Stairway to Heaven', 'Sweet Child O Mine', 
                'Hotel California', 'Smoke on the Water')
```

```
Adding 3 songs to playlist:
1. Thunderstruck
2. Highway to Hell
3. Back in Black
Playlist updated!
Adding 5 songs to playlist:
1. Bohemian Rhapsody
2. Stairway to Heaven
3. Sweet Child O Mine
4. Hotel California
5. Smoke on the Water
Playlist updated!
```

The arguments can also be packed into a dictionary as shown:

```python
def printDictionary(**args):
    for key in args:
        print(key + " : " + args[key])

printDictionary(Name='John',Province='Ontario',City='Toronto')
```

```
Name : John
Province : Ontario
City : Toronto
```

<h2 id="basic-function-annotations">Basic Function Annotations</h2>

<h3 id="type-annotations-in-functions">Type Annotations in Functions</h3>


In many other programming languages, you must explicitly declare the type of each variable. This makes the code more verbose, but also safer.

```python
int x = 5;
float y = 3.14;
String name = "Alice";
```

Once declared, the type cannot be changed later.
This helps avoid bugs, especially in large projects or production systems.

Python’s Evolution
Python is dynamically typed by default:

```python
x = 10       # int
x = "hello"  # now a string!
```

But since Python 3.5, you can add type hints to make your code more robust — without losing flexibility.



<h3 id="basic-function-annotations">Basic Function Annotations</h3>


You can specify the expected type for each argument, and for the return value.

```python
def multiply(x: int, y: int) -> int:
    return x * y
```

	•	x: int → x should be an integer
	•	y: int → y should be an integer
	•	-> int → the function returns an integer

Without type annotations (older style):

```python
def multiply(x, y):
    return x * y
```

```python
def int_list(list_int: list[int]) -> list[int]:
    return list_int
```

```python
int_list([1, 2, 3, 4, 5])
```

```
[1, 2, 3, 4, 5]
```


<h3 id="functions-that-return-nothing">Functions That Return Nothing</h3>

If a function doesn’t return anything (for example, if it only prints), annotate it with -> None:

```python
def greet(name: str) -> None:
    print(f"Hello, {name}!")
```

This tells the reader and static analysis tools that the function has no return value.


<h3 id="type-mismatch">Type Mismatch Issue</h3>

```python
def divide_et_impera(x: int, y: int) -> int:
    return x / y

print(divide_et_impera(4, 3))  # Output: 1.3333333333333333
```

```
1.3333333333333333
```

Notice something interesting? Our function:

Declares it returns an `int` (-> int)
But actually returns a `float` (1.3333...)
While Python itself won't complain (it's dynamically typed), this is problematic when:

- Using static type checkers (like mypy or pyright)
- Working in professional environments
- Maintaining large codebases
- Using Union Types

To properly handle multiple possible types, Python provides the Union type syntax using the | operator (pipe):

```python
def divide_et_impera(x: int | float, y: int | float) -> float:
    return x / y
```

This improved version:

- Accepts both integers AND floats as inputs
- Explicitly declares it returns a float
- Will pass type checking tools

**Best Practices**

- Be explicit about your return types
- Use union types when a function can handle multiple types
- Consider using type checkers in your development workflow:

```bash
# Using mypy
mypy your_file.py

# Using pyright
pyright your_file.py
```

**Type Checking Benefits**

- Catches errors before runtime
- Improves code documentation
- Enhances IDE support (better autocompletion and hints)
- Makes code maintenance easier

Remember: While Python won't enforce these types at runtime, using type hints makes your code more maintainable and helps catch potential issues early in development.




<h2 id="return-vs-no-return-vs-return-none">Return vs no return vs return none</h2>

If there is no <code>return</code> statement, the function returns <code>None</code>. The following two functions are equivalent:

```python
# Define functions, one with return value None and other without return value

def MJ():
    print('Michael Jackson')
    
def MJ1():
    print('Michael Jackson')
    return(None)

def MJ2():
    print('Michael Jackson')
    pass
```

```python
MJ()
MJ1()
MJ2()
```

```
Michael Jackson
Michael Jackson
Michael Jackson
```

```python
print(MJ())
```

```
Michael Jackson
None
```

```python
print(MJ1())
```

```
Michael Jackson
None
```

```python
print(MJ2())
```

```
Michael Jackson
None
```

**Best Practices Summary**

|Pattern|When to Use|Example Use Case|
|---|---|---|
|return None|When None is a valid result|Finding an optional value|
|return|For early function exits|Validation functions|
|No return|For action-only functions|Logging, printing, saving|

**Example Combining All Patterns:**

```python
def process_user_data(user_id: int) -> dict | None:
    # Early exit if invalid ID
    if user_id < 0:
        return
        
    # Get user data
    user = find_user_by_id(user_id)
    if user is None:
        return None  # Explicitly return None for missing user
        
    # Log activity (no return needed)
    log_user_activity(user.name, "data processed")
    
    # Return processed data
    return {"id": user_id, "name": user.name}
```

**Another Examples:**

1. Explicit return None

Use when None represents a meaningful result:

```python   
def find_user_by_id(user_id: int) -> str | None:
    if user_id in database:
        return database[user_id].name
    return None  # Explicitly indicates no user was found
```
2. Bare return

Use for early exits without a specific value:

```python
def validate_password(password: str) -> bool:
    # Early exits for invalid cases
    if len(password) < 8:
        return False
    if not any(c.isupper() for c in password):
        return False
        
    # If we get here, password is valid
    return True
```

3. No return (Implicit None)

Use for functions that perform actions but don't need to return values:

```python
def log_user_activity(user: str, action: str) -> None:
    print(f"User {user} performed {action}")
    # No return needed - function is used for its effect
```

<h2 id="generators">Generators</h2>

Generators are a special kind of function in Python that allow you to iterate over values one at a time, without storing the entire sequence in memory.

They are:

- A more efficient alternative to lists when you don’t need all items at once.
- Defined using the yield keyword (instead of return).
- Paused and resumed between calls, preserving their internal state.
- Iterable : use the operator `next()` to get the next value
- At the end of the iteration, the generator is empty. 
- Generators can also be called for all values using `list()` instead of `next()`
- Generators can be even more efficient when created from list comprehensions
- The syntax is identical to a list comprehensions, except `()` are used instead of `[]`

A generator yields one value at a time, and remembers where it left off:

```python
def square_list(list_num : list[int]) :
    for num in list_num :
        yield num * num 

list_number = square_list([1, 2, 3, 4, 5])

print(next(list_number))
print(next(list_number))
print(next(list_number))
print(next(list_number))
print(next(list_number))
print(next(list_number)) # Error
```

```
1
4
9
16
25
Traceback (most recent call last):
  File "/Users/GUEGUEN/CascadeProjects/tech-learning-template/try.py", line 12, in <module>
    print(next(list_number))
StopIteration
```

- At the end of the iteration, an error `StopIteration` is raised.

Use `list()`or `tuple()`to get all values at once:

```python
list_number = square_list([1, 2, 3, 4, 5])
print(list(list_number))
print(tuple(list_number))
print(set(list_number))
```

```
[1, 4, 9, 16, 25]
(1, 4, 9, 16, 25)
{1, 4, 9, 16, 25}
```

Use list comprehension to create a generator:

```python
to_generate = (i**2 for i in [4,5,6])
print(next(to_generate))
print(next(to_generate))
print(next(to_generate))
print(list(to_generate))
```

```
16
25
36
[16, 25, 36]
```

Take care, when all values are generated, the generator is empty. 
Even if you call with the `list()` function, it will return an empty list.

```python
to_generate = (i**2 for i in [4,5,6])
print(next(to_generate))
print(next(to_generate))
print(next(to_generate))
print(list(to_generate))
```

```
16
25
36
[]
```

**Why Use Generators?**

- **Memory-efficient**: great for working with large datasets or infinite streams.
- **Lazy evaluation**: values are computed only when needed.
- **Cleaner code**: avoids building unnecessary full lists in memory.

<h2 id="lambda">Lambda</h2>

The lambda keyword allows for a faster, one-line definition of simple functions that:

- Take one or more numeric parameters as arguments
- Return the value of a numeric expression

The syntax:

```python
FunctionName = lambda parameter_1, parameter_2, ... : expression
```

Example:

```python
add = lambda x, y: x + y
print(add(2, 3))
```

```
5
```

```python
norme = lambda x, y : (x**2 + y**2)**0.5
print(norme(3, 4))
```

```
5.0
```

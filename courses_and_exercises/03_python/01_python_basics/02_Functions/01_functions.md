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
    <li><a href="variable_scope.md">Variable and Scope</a></li>
    <li><a href="#if-else-and-loop-in-a-function">If Else and Loop in a Function</a></li>
    <li><a href="collections.md">Collections and Functions</a></li>
    <li><a href="../../Annotations_Mypy/00_annotation.md">Basic Function Annotations</a></li>
    <li><a href="#return-vs-no-return-vs-return-none">Return vs no return vs return none</a></li>
    <li><a href="generators.md">Generators</a></li> 
    <li><a href="lambda.md">Lambda</a></li> 
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

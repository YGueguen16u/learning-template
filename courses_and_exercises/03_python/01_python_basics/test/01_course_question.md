# Python Types - Practice Questions

## Basic Types and Type System

1. **What are the three main basic types in Python?**
   - Integer (int)
   - Float (float)
   - String (str)

2. **How can you determine the type of an object in Python? For example, how would you find the type of 27.8?**
   - Use the built-in `type()` function: 

   ```python
   type(27.8)
   ```

3. **What will the following commands return?**

   ```python
   type(17)      # Returns: <class 'int'>
   type(35.9)    # Returns: <class 'float'>
   type("Good-bye !") # Returns: <class 'str'>
   ```

4. **What is an integer? Give examples.**

   - Integers are whole numbers, positive or negative
   - Examples: -5, 0, 12, 2048

5. **How do you access Python in the terminal? When can you start writing Python instructions? How do you exit the Python shell?**

   - Type `python3` in your terminal to open a Python shell
   - You can write Python instructions when you see the `>>>` prompt
   - Close the shell with `exit()`

6. **What is a float? Give an example.**

   - Floats are real numbers (with decimals), including in-between values
   - Examples: 3.14, 0.5, -2.78

7. **What is a string? Give examples.**

   - A string is a sequence of characters enclosed in quotes
   - Examples: 
     - `"Python"` or `'Python'`
     - `"123"` or `'123'`

8. **How can you check the parameters of a type in Python? What must you not forget to write first?**

   ```python
   import sys  # Don't forget to import sys first!
   sys.float_info
   ```

9. **What values can a boolean take? What should you pay attention to?**

   - Booleans can be either `True` or `False`
   - Important: Note the uppercase first letter

10. **What is casting in Python? Give valid and invalid examples.**

    - Casting is converting an object from one type to another
    - Valid examples:
      ```python
      float(2)      # int to float: 2.0
      int(True)     # boolean to int: 1
      bool(2)       # int to bool: True
      bool(0)       # int to bool: False
      int("4")      # string to int: 4
      ```
    - Invalid examples:
      ```python
      float("hello")  # ValueError: invalid literal for float()
      int("hello")    # ValueError: invalid literal for int()
      ```

11. **List 12 different built-in type constructors with examples, categorized:**

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

12. **Why is Python a dynamically typed language?**

    - Python is dynamically typed because:
      - Type checking is only done at runtime
      - Variables can change types during their lifetime
      - Example: A variable can start as one type and be converted to another
      - For instance: `"2.5"` (string) can become `2.5` (float) using `float()`
      - Built-in objects can also change types:
        - Lists can be converted to tuples or sets
        - Numbers can be converted between int, float, etc.

13. **How to know if two objects are of the same type? Give an example.**

    - Use the `==` operator to compare types

    ```python
    type("hello") == type("world") # True
    ```

    ```python
    type("hello") == type(2) # False
    ```

14. **What are the (5) basic arithmetic operators in Python? What does each one do? Give examples.**

    ```python
    print(3 * 3)   # Multiplication: 9
    print(9 / 3)   # Division: 3.0 (always returns float)
    print(3 ** 3)  # Exponentiation: 27 (3 to the power of 3)
    print(10 % 3)  # Modulo: 1 (remainder of division)
    print(10 // 3) # Floor division: 3 (quotient without remainder)
    ```

15. **What is PEMDAS in Python? Give an example showing the order of operations.**

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

16. **Solve these arithmetic expressions:**

    a) What is the output of:

    ```python
    5 ** 2 + 3 * 2  # Exponent first, then multiplication, then addition
    ```
    Answer: 31 (25 + 6)

    b) What is the output of:

    ```python
    15 // 4 + 2 * 3  # Floor division first, then multiplication, then addition
    ```
    Answer: 9 (3 + 6)

17. **Convert units using Python arithmetic. How would you:**

    a) Convert 57.678 miles to kilometers (1 mile = 1.60934 km)?

    ```python
    miles = 57.678
    kilometers = miles * 1.60934
    print(kilometers)  # Output: 92.82697452
    ```

    b) Convert 100 Celsius to Fahrenheit using the formula: °F = (°C × 9/5) + 32

    ```python
    celsius = 100
    fahrenheit = (celsius * 9/5) + 32
    print(fahrenheit)  # Output: 212.0
    ```

18. **What's the difference between / and // in Python? Give examples.**

    - `/` (Division): Always returns a float
    - `//` (Floor Division): Returns the largest integer less than or equal to the division

    ```python
    print(7 / 2)   # Output: 3.5
    print(7 // 2)  # Output: 3
    print(-7 / 2)  # Output: -3.5
    print(-7 // 2) # Output: -4 (rounds down to nearest integer)
    ```



19. **What is a variable in Python?**
    - Variables are symbolic names that are references or pointers to objects in memory
    - They act as containers for storing data values
    - A variable has three components:
      - A name
      - A value
      - A type

20. **What symbol is used for variable assignment in Python? What are the components of a variable declaration?**
    - The `=` symbol is used for assignment
    - Example:
      ```python
      age = 25  # 'age' is name, '=' is assignment operator, 25 is value
      ```

21. **Why doesn't Python require type declaration for variables?**
    - Python uses dynamic typing:
      - Variable types are assigned automatically based on their value
      - The type is determined at runtime
      - The same variable can hold different types during its lifetime
    - Example:
      ```python
      x = 42        # x is automatically an integer
      x = "Hello"   # now x is automatically a string
      ```

22. **Why is it important to store operation results in variables?**
    - Results must be stored to be reused later
    - The Python interpreter:
      1. Executes an operation
      2. Deletes the result if not stored
      3. Cannot access the result later unless it was stored in a variable
    
    Example:
    ```python
    # Result lost after execution
    2 + 3 * 4

    # Result saved for later use
    result = 2 + 3 * 4
    print(result)  # Can use it later
    ```

23. **What are the rules for variable names in Python? Give examples of valid and invalid names.**
    
    Invalid examples:
    ```python
    1variable = 10     # Can't start with a number
    print = "Hello"    # Can't use Python keywords
    my-var = 20        # Can't use hyphens
    ```

    Valid examples:
    ```python
    my_variable = 10
    _private = 20
    camelCase = 30
    ```

24. **Why shouldn't you use Python keywords as variable names? Show an example of what could go wrong.**

    ```python
    # This breaks the print function
    print = "Hello"
    print("This won't work")  # TypeError: 'str' object is not callable
    
    # Correct way
    message = "Hello"
    print(message)
    ```

25. **Show 5 different ways to perform multiple variable assignment in Python.**

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

26. **Practice Exercise: Zoo Food Cost Calculator**
    
    Create a program to calculate monthly elephant food costs with these requirements:
    - Each elephant eats 50 kg of food daily
    - Food costs 2.5 currency units per kg
    - The zoo has 3 elephants
    - Calculate for a 30-day month

    Solution:
    ```python
    # Variables
    daily_food_kg_per_elephant = 50
    food_cost_per_kg = 2.5
    number_of_elephants = 3
    number_of_days = 30

    # Calculate total cost
    monthly_cost = (daily_food_kg_per_elephant * 
                   food_cost_per_kg * 
                   number_of_elephants * 
                   number_of_days)

    # Print result
    print(f"The total monthly food cost for the elephants is: {monthly_cost} units")
    ```

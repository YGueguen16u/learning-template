# Variable Scope

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
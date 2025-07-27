# Python Strings - Practice Questions

1. **What can a string contain in Python?**
   - Letters: `"Python"`
   - Digits: `"1234"`
   - Spaces: `"a b c"`
   - Special Characters: `"@#&*!"`

2. **How does string indexing work in Python? Give examples starting from both beginning and end.**

    - Strings are **ordered sequences**, and you can access characters using an index.

   ```python
   name = "Leonardo DiCaprio"
   
   print(name[0])    # 'L' → indexing starts at 0
   print(name[5])    # 'r'
   print(name[10])   # 'D'
   
   # From the end:
   print(name[-1])   # 'o'
   print(name[-18])  # 'L'
   ```

3. **What is string slicing? Show examples for:**
   - First 7 characters
   - Alternative way for first 7
   - From 9th to the end
   
   - Basic slicing: `string[start:stop]`

   ```python
   name = "Leonardo DiCaprio"
   
   print(name[0:8])   # 'Leonardo' (index 8 not included)
   print(name[:8])    # 'Leonardo' (same as above)
   print(name[9:])    # 'DiCaprio' (from index 9 to end)
   ```

4. **What is string striding? Give examples.**
   
   - Basic striding: `string[start:stop:step]`
   
   ```python
   name = "Leonardo DiCaprio"
   
   # Every 2nd character
   print(name[::2])     # 'LoadoiCpio'
   
   # Every 2nd character in first 5 chars
   print(name[0:6:2])   # 'Loa'
   ```

5. **How do you find the length of a string?**

   - Use len() to count characters:
   
   ```python
   name = "Michael Jackson"
   print(len(name))    # 15
   ```

6. **How do you concatenate strings? Give an example.**

   - Use `+` to join strings:
   
   ```python
   first = "Michael"
   last = "Jackson"
   full = first + " " + last
   print(full)    # 'Michael Jackson'
   ```

7. **How do you repeat a string? Show an example.**

   - Use `*` to repeat strings:
   
   ```python
   laugh = "ha"
   print(laugh * 3)    # 'hahaha'
   ```

8. **Can you modify an existing string? Explain why/why not.**

   - Strings are immutable - create new string instead:
   
   ```python
   name = "Leonardo DiCaprio"
   # name[0] = "M"    # TypeError: 'str' object does not support item assignment
   
   # Strings are immutable - create new string instead:
   new_name = "M" + name[1:]
   ```

9. **List 4 common escape sequences with examples:**

| Escape Code | Meaning   | Example               | Output        |
|------------|-----------|------------------------|---------------|
| `\n`       | New line  | `"Hello\nWorld"`      | Hello<br>World|
| `\t`       | Tab       | `"Hello\tWorld"`      | Hello    World|
| `\\`       | Backslash | `"C:\\Users"`         | C:\Users     |
| `r"..."`   | Raw string| `r"Line\nTab\t"`      | Line\nTab\t  |

10. **What is string interpolation? Give an example.**

    - Use f-strings to interpolate variables:
    
    ```python
    x = 10
    y = 20
    print(f"The sum of {x} and {y} is {x+y}")  # The sum of 10 and 20 is 30
    ```

11. **What are % operators in strings? Show usage.**

    - Use % operators to interpolate variables:
        - `%s`: String
        - `%d`: Integer
        - `%f`: Float
        - %(x, y): Tuple at the end
    
    ```python
    name = "John"
    age = 30
    print("My name is %s and I am %d years old." % (name, age))
    # Output: My name is John and I am 30 years old
    ```

12. **Why are raw strings important? Give a practical example.**

    - Raw strings are important because they allow you to include backslashes in a string without having to escape them.
    - Example: if you a have \n in a classic string, it will be interpreted as a newline character.
    
    ```python
    # Regular string - incorrect path
    path = "C:\new_folder\text.txt"
    print(path)  # C:
                 # ew_folder    ext.txt

    # Raw string - correct path
    path = r"C:\new_folder\text.txt"
    print(path)  # C:\new_folder\text.txt
    ```


13. **What method converts a string to uppercase and how can you verify if a string is in uppercase?**

    - Use `upper()` to convert a string to uppercase and `isupper()` to verify if a string is in uppercase.

```python
"hello".upper() # 'HELLO'

"hello".upper().isupper() # True
```

14. **Which method capitalizes only the first letter of a string?**

    - Use `capitalize()` to capitalize only the first letter of a string.

```python
"the text I want to capitalize".capitalize() # 'The text i want to capitalize'
```

15. **What method converts a string to lowercase and how can you verify if a string is in lowercase?**

    - Use `lower()` to convert a string to lowercase and `islower()` to verify if a string is in lowercase.

```python
# We want to make sure that all users have their name in lowercase 
# to do searches because sometimes search engines are sensitive to the "case"
"ROMUALD".lower() # 'romuald'

"ROMUALD".lower().islower() # True
```

16. **How do you replace a substring within a string? What does the count parameter do?**

    - Use `replace(old, new, count)` to replace a substring within a string. The count parameter limits the number of replacements.

```python
msg = "Michael Jackson"
new_msg = msg.replace("Michael", "Janet") # 'Janet Jackson'

# count limits the number of replacements
"the city near New York city is a big city".replace("city", "town", 2) # 'the town near New York town is a big city'
```

17. **How do you find the starting index of a substring in a string? What happens if the substring is not found?**

    - Use `find(substring, start_index, end_index)` to find the starting index of a substring in a string. If the substring is not found, it returns -1.

```python
text = "Leonardo DiCaprio"
print(text.find("Cap"))    # 10

# If substring is not found, returns -1
print(text.find("Romuald"))   # -1
```

18. **How do you count the number of occurrences of a substring within a string in a given range?**

    - Use `count(substring, start_index, end_index)` to count the number of occurrences of a substring within a string in a given range.

```python
"New York".count("y") # 2
"New York city".count("y", 1, 5) # 1
"New York city".count("y", 1, 10) # 2
```

19. **How do you add leading zeros to a string? When is this useful?**

    - Use `zfill(int)` to add leading zeros to a string. This is useful for formatting numbers with fixed width (dates, IDs, version numbers).

```python
# Useful for formatting numbers with fixed width (dates, IDs, version numbers)
print(str(1).zfill(2)) # '01'
print(str(10).zfill(2)) # '10'
print(str(100).zfill(2)) # '100'

print("hello".zfill(7)) # '00hello'
print(str(10).zfill(-4)) # '10'
```


20. **How do you split a string into a list? What are the different ways to use split()?**

    - Use `split(separator, maxsplit)` to split a string into a list of strings
    - By default, it splits by whitespace
    - You can specify different separators and limit the number of splits
        - `split(" ")` : splits the string by whitespace
        - `split(",")` : splits the string by comma
        - `split("?")` : splits the string by question mark
        - `split("!")` : splits the string by exclamation mark
        - `split(".")` : splits the string by period
    - `maxsplit` is optional, it limits the number of splits
    - It returns a list of strings

```python
# Split by whitespace
name = "Leonardo DiCaprio"
print(name.split())  # ['Leonardo', 'DiCaprio']

# Split by specific character
date = "2024/10/23"
print(date.split("/"))  # ['2024', '10', '23']

# Limit number of splits
print(date.split("/", 1))  # ['2024', '10/23']
```

21. **What is string formatting using format()? How does it work?**

    - Use `str.format()` with curly braces `{}` as placeholders
    - Variables are passed as arguments to format()

```python
name = "John"
age = 30

# Basic formatting
print("My name is {} and I am {} years old.".format(name, age))
# Output: My name is John and I am 30 years old

# Using numbered placeholders
print("I am {1} years old and my name is {0}.".format(name, age))
# Output: I am 30 years old and my name is John

# Using named placeholders
print("My name is {n} and I am {a} years old.".format(n=name, a=age))
# Output: My name is John and I am 30 years old
```


22. **What are Regular Expressions in Python and how do you use them? Give examples.**

    - Regular Expressions (RegEx) are tools for matching and handling strings
    - Python provides the `re` module for working with regular expressions
    - Always use raw strings (`r"..."`) for regex patterns

```python
import re

# Search for a pattern
pattern = r"he.*o"
text = "hello world"
if re.search(pattern, text):
    print("Pattern found!")  # Output: Pattern found!

# Find all matches
matches = re.findall(r"cat", "cat and cat")
print(matches)  # Output: ['cat', 'cat']

# Replace pattern
new_text = re.sub(r"cat", "dog", "I love cats")
print(new_text)  # Output: I love dogs

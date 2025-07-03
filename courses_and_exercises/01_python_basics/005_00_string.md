<h1>String</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#what-is-a-string">What Is a String?</a></li>
    <li><a href="#strings-can-contain">Strings Can Contain</a></li>
    <li><a href="#indexing-strings">Indexing Strings</a></li>
    <li><a href="#slicing-and-stride">Slicing and Stride</a></li>
    <li><a href="#functions-and-methods-to-know">Functions and Methods to know</a></li>
    <li><a href="#exercises">Exercises</a></li>
  </ul>
</div>

<h2 id="what-is-a-string">What Is a String?</h2>

A **string** is a sequence of characters enclosed in quotes or double quotes:

```python
string1 = "Hello, world!"
string2 = 'Python is fun'
```


<h2 id="strings-can-contain">Strings Can Contain:</h2>

- **Letters**: "Python"
    
- **Digits**: "1234"
    
- **Spaces**: "a b c"
    
- **Special Characters**: "@#&*!"
    

<h2 id="indexing-strings">Indexing Strings</h2>

Strings are **ordered sequences**, and you can access characters using an index.

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork/labs/Module%201/images/StringsIndex.png" width="600" align="center">

```python
name = "Leonardo DiCaprio"

print(name[0])      # 'L' → indexing starts at 0
print(name[5])      # 'r'
print(name[10])     # 'D'

# We can also start from the end:
print(name[-1])     # 'o'
print(name[-18])    # 'L'
```

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork/labs/Module%201/images/StringsNeg.png" width="600" align="center">


<h2 id="slicing-and-stride">Slicing and Stride</h2>

- Basic slicing: `string[start:stop]`


```python
name = "Leonardo DiCaprio"

print(name[0:8])       # 'Leonardo' — note: index 8 is not included
# If index 8 were included, you'd get "Leonardo " (with a space at the end)
# That’s because character at index 8 is the space: ' '

print(name[:8])        # Same as above — when starting from the beginning, 0 is optional
print(name[9:])        # From index 9 to the end — returns 'DiCaprio'
```

- With stride: `string[start:stop:step]`

```python
name = "Leonardo DiCaprio"

print(name[::2])       # 'LoadoiCpio' — every 2nd character from start to end
print(name[0:6:2])     # 'Loa' — characters from index 0 to 5, skipping every 2nd letter
```



<h2 id="functions-and-methods-to-know">5. Functions and Methods to know</h2>


### **1. Length of a String**

Use len() to count characters:

```python
name = "Michael Jackson"
print(len(name))    # 15
```


### **2. String Concatenation**

Use **+** to join strings:

```python
first = "Michael"
last = "Jackson"
full = first + " " + last
print(full)    # 'Michael Jackson'
```


#### **3. String Replication**

Use **`*`** to repeat strings:

``` python
laugh = "ha"
print(laugh * 3)    # 'hahaha'
```


#### **4. Strings Are Immutable**

You cannot change characters **in place**, but you can create a new string:

```python
name = "Leonardo DiCaprio"
name[0] = "M"
```

```
Traceback (most recent call last):
  File "/Users/GUEGUEN/CascadeProjects/tech-learning-template/python/basics/try.py", line 18, in <module>
    name[0] = "M"
TypeError: 'str' object does not support item assignment
```

```python
name = "Leonardo DiCaprio"
new_name = name + " is the best"
print(new_name)     # 'Michael Jackson is the best'
```


### **5. Escape Sequences**

| **Escape Code** | **Meaning** | **Example**             | **Output**      |
| --------------- | ----------- | ----------------------- | --------------- |
| `\n`            | New line    | `print("Hello\nWorld")` | Hello<br>World |
| `\t`            | Tab         | `print("Hello\tWorld")` | Hello World  |
| `\\`            | Backslash   | `print("C:\\Users")`    | C:\Users        |
| `r"..."`        | Raw string  | `print(r"Line\nTab\t")` | `Line\nTab\t`   |


### **6. String interpolation (f-strings)**

```python
name = "John"
age = 30
print(f"My name is {name} and I am {age} years old.")

x = 10
y = 20
print(f"The sum of x and y is {x+y}.") # The sum of x and y is 30
```

### **7. % Operator**

“**My name is `%s` and I am `%d` years old.**“: This is a string that includes format specifiers:

- **%s**: This is a placeholder for a string.
- **%d**: This is a placeholder for an integer.

**% (name, age)**: This is a tuple containing the variables name and age. The values of these variables will replace the placeholders in the string.

Each of these methods has its own advantages and use cases. However, f-strings are generally considered the most modern and preferred way to format strings in Python due to their readability and performance.

```python
name = "John"
age = 30
print("My name is %s and I am %d years old." % (name, age))
```

### **8. Raw String (r’’)**

By prefixing a string literal with the letter ‘r’, Python treats the string as raw, meaning it interprets backslashes as literal characters rather than escape sequences.

```python
regular_string = "C:\new_folder\file.txt"
print("Regular String:", regular_string)
```

```
Regular String: C:
ew_folder
         ile.txt
```

\n represents a newline character, which would lead to an incorrect file path representation.

```python
raw_string = r"C:\new_folder\file.txt"
print("Raw String:", raw_string)
```

```
Raw String: C:\new_folder\file.txt
```


### **9. String Methods**

#### **capitalize(): capitalize the first letter of the string**

```python
"the text I want to capitalize".capitalize()
```

#### **upper(): Converts to uppercase**

```python
"hello".upper() # 'HELLO'

"hello".upper().isupper() # True
```

#### **lower(): Converts to lowercase**

```python
# We want to make sure that all users have their name in lowercase 
# to do searches because sometimes search engines are sensitive to the "case"
"ROMUALD".lower()

"ROMUALD".lower().islower() # True

"romuald".upper().lower()
```

#### **replace(old, new, count) : Replace a substring**

- count is optional, if not specified or set to -1, it will replace all occurrences
```python
msg = "Michael Jackson"
new_msg = msg.replace("Michael", "Janet") # 'Janet Jackson'

"the city near New York city is a big city".replace("city", "town", 2) # 'the town near New York town is a big city'
```

#### **find(substring, start_index, end_index) : Returns the index of first match or -1 if not found**

```python
text = "Leonardo DiCaprio"
print(text.find("Cap"))    # 10

# If cannot find the substring in the string
print(text.find("Romuald"))   # -1
```

#### **count(substring, start_index, end_index) : Returns the number of non-overlapping occurrences of the substring in the string**

```python
"New York".count("y") # 2
"New York city".count("y", 1, 5) # 1
"New York city".count("y", 1, 10) # 2
```	

#### **str.zfill(int) : Adds zeros at the beginning of the string**

```python
# If we want to standardize user ids
add zero at the beginning of the string
print(str(1).zfill(2)) # '01'
print(str(10).zfill(2)) # '10'
print(str(100).zfill(2)) # '100'

print("hello".zfill(7)) # '00hello'
print(str(10).zfill(-4)) # '10'
```

#### **str.split(separator, maxsplit) : split the string into a list of strings**

- by default, it splits the string by whitespace
- it can also split the string by a specific character
	- str.split(" ") : splits the string by whitespace
	- str.split(",") : splits the string by comma
	- str.split("?") : splits the string by question mark
	- str.split("!") : splits the string by exclamation mark
	- str.split(".") : splits the string by period
- maxsplit is optional, it limits the number of splits
- it returns a list of strings --> `["2023", "12", "26"]

```python
name = "Leonardo DiCaprio"
split_string = name.split()
print(split_string) # ['Leonardo', 'DiCaprio']

# We want to split a date into "year" "month" "day"
"2024/10/23".split("/")
# ['2024', '10', '23']

"2024/10/23".split("/", 1)
# ['2024', '10/23']
```

#### **str.format()**

It uses curly braces {} as placeholders for variables which are passed as arguments in the format() method. For example:

```python
name = "John"
age = 30
print("My name is {} and I am {} years old.".format(name, age))
```

<h2 id="exercise">Exercise</h2> 

### exercice 1: Extract Region and Year Codes from Product Batch IDs

Imagine you’re working with product batch IDs in a logistics system. Each ID has the following structure:

Example: "FR-2023-BX9012"
	•	FR – Country/region code (2 letters)
	•	2023 – Year of production (4 digits)
	•	BX9012 – Product reference (2 letters + 4 digits)

Instructions:
	1.	Store the batch ID "FR-2023-BX9012" as a string.
	2.	Extract the region code (FR) using forward indexing.
	3.	Extract the year (2023) using forward indexing.
	4.	Extract the product code (BX9012) using negative indexing.
	5.	Print the three values.

**Solution**

```python
batch_id = "FR-2023-BX9012"

# Forward indexing for region and year
region = batch_id[0:2]
year = batch_id[3:7]

# Negative indexing for product reference
product_ref = batch_id[-6:]

print(region)       # Output: FR
print(year)         # Output: 2023
print(product_ref)  # Output: BX9012
```

### exercice 2: add a capital letter at the beginning of “i want to capitalize this string.”

```python
"i want to capitalize this string.".capitalize()
```

### exercice 3: transform "9" into "009"

```python
"9".zfill(3)
```

### exercice 4: from "PYTHON" to "Python" in one line of code

```python
print("PYTHON".lower().capitalize())
```

### exercice 5: replace “President Trump” by “President Biden”

```python
"President Trump".replace("Trump", "Biden")
```

What happened:

```python
"President Trump".replace("Trump", "Biden").replace("Biden", "Trump")
```

### exercice 6: Count Keywords in a Product Launch Announcement

You work in a Data Engineering team, and your manager asks you to analyze internal communications for keyword trends. You start with a recent product launch email sent to all employees.


Your Task:
1. Copy the email content below into a Python variable using triple quotes (""").
2. Use the .count() method to count how many times the following words appear:
    - "data"
    - "platform"
    - "team"
    - "scalable"
3. Print each count in a clear sentence (example: "The word 'data' appears X times.")


Email Snippet (copy this)

```python
announcement = """
Dear team,

We’re thrilled to announce the launch of our new data integration platform.

This platform is designed to unify fragmented pipelines, improve data quality, and enable scalable workflows for all teams. After months of collaboration between the engineering and analytics teams, we finally have a solution that will power our data strategy for years to come.

The platform is scalable, modular, and secure — and we’re already seeing teams across departments adopting it quickly.

Thanks to everyone who contributed to this incredible milestone.

Best,  
The Data Platform Team
"""
```

**Solution:**

```python
print("The word 'data' appears", announcement.count("data"), "times.")
print("The word 'platform' appears", announcement.count("platform"), "times.")
print("The word 'team' appears", announcement.count("team"), "times.")
print("The word 'scalable' appears", announcement.count("scalable"), "times.")
```

**Extra Challenge (optional):**
Use .lower() to make your count case-insensitive:

```python
text = announcement.lower()
print("The word 'data' appears", text.count("data"), "times.")
```

#### exercice 7: cut the date “2024-02-12”

```python
"2024-02-12".split("-") 
```

```python
jour_mois_annee = "2024/12/25".split("/")
jour_mois_annee
=> ["2024", "12", "25"]
type(jour_mois_annee) #list
```

#### exercice 8: 

- find the index of the second "why" in "Why do I need learn Python ? Why do you need to learn Python ?"
- count the number of "why" in "Why do I need learn Python ? Why do you need to learn Python ?"

**Solution:**

```python
"Why do I need learn Python ? Why do you need to learn Python ?".find("why", 1)
"Why do I need learn Python ? Why do you need to learn Python ?".count("why")
```


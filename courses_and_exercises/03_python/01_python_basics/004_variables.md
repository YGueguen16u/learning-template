<h1>Variables</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#assigning-values">Assigning Values</a></li>
    <li><a href="#meaningful-variable-names">Using Meaningful Variable Names</a></li>
    <li><a href="#naming-convention-tips">Naming Convention Tips</a></li>
    <li><a href="#another-way-to-write-x-x-1">Another way to write x = x + 1</a></li>   
    <li><a href="#keywords">Keywords</a></li>
    <li><a href="#multiple-assignation">Multiple assignation</a></li>
    <li><a href="#exercises">Exercises</a></li>
  </ul>
</div>

<hr>

<h2 id="preamble">Preamble</h2>

Calculating Price with Tax (VAT)

Let’s say you’re writing a program to show prices with tax included.

Without variables:

```python
print(100 + 100 * 0.2)
print(250 + 250 * 0.2)
print(75 + 75 * 0.2)
```

Why this is bad:
- The VAT rate (0.2) is repeated everywhere.
- If the rate changes (for example, from 20% to 19.6%), you have to edit every single line.
- It’s hard to read and maintain.



With a variable, it’s much cleaner:

```python
vat = 0.2

print(100 + 100 * vat)
print(250 + 250 * vat)
print(75 + 75 * vat)
```

Now if the VAT rate changes:

```python
vat = 0.196  # new rate
```

You only update it once, and the whole program still works correctly.


This shows the power of variables:

- They help you avoid repetition, improve readability, and make your code easier to maintain.


<h2 id="assigning-values">Assigning Values</h2>

Variables are symbolic names that are references or pointers to objects in memory. They are containers for storing data value

A variable has a `name`, a `value` and a `type`.

```
name = value
type(name)
```

A **variable** is a name used to store a value using the **`=`** assignment operator.

In python, variable `types` are assigned dynamically, so they don't need to be declared.

- By default, the variable will take the `type` of the `value` it has been assigned to

**Examples:**

```python
my_variable = 1
my_variable = 10       # Reassigned
```

The result of a computation must be stored in a variable to be reused.

- The python interpreter will execute an operation, then delete the result once it's done
- In order to access this result later, it must be stored in memory -> it must be affected to a variable

```python
x = 8 + 4 + 2 + 1      # x = 15
y = x / 5.625          # y ≈ 2.666
```

You can overwrite:

```python
x = y                  # x now ≈ 2.666
```

You can put almost anything on the right side of the `=` sign. On the other hand, on the left side, you need to be careful. For example, a number cannot be a variable name:

```python
1 = x                  # Error
```

<h2 id="meaningful-variable-names">Using Meaningful Variable Names</h2>

Always name variables clearly and descriptively:

```python
total_min = 142        # Total minutes of music
total_hour = total_min / 60
print(total_hour)      # ≈ 2.367
```

If total_min changes, total_hour will update when re-evaluated:

```python
total_min = 180
total_hour = total_min / 60    # Now 3.0
```

<h2 id="naming-convention-tips">Naming Convention Tips</h2>

|**Style**|**Example**|**Use Case**|
|---|---|---|
|Snake case|total_time|Most common in Python|
|Camel case|totalTime|Sometimes used in JS or classes|
|Uppercase|TOTAL_TIME|Constants (by convention only)|

- The name of a variable must start with a letter or an underscore (_).
- The name of a variable cannot start with a number.
- The name of a variable can only contain letters, numbers, and underscores (_).
- Variable names are case-sensitive. une_variable, Une_variable and UNE_VARIABLE are three different variables.

<h2 id="another-way-to-write-x-x-1">Another way to write x = x + 1</h2>

```python
x = 2 
print(x) # output: 2
x += 1 
print(x) # output: 3
x += 3 
print(x) # output: 6
x /=2
print(x) # output: 3.0
x *= 3
print(x) # output: 9.0
```


<h2 id="keywords">Keywords</h2>

You can find a list of keywords in the [official documentation](https://docs.python.org/3.11/reference/lexical_analysis.html#keywords).

Never use Python reserved keywords or built-in function names as your variable names — it can break your code!

**Example that causes a bug:**

```python
print = "Hello"
print("This won’t work")
```

**What happens?**

Python throws an error:

“TypeError: ‘str’ object is not callable”

Why? Because you just overwrote the built-in print() function by assigning it a string. Now, when you try to call print("..."), Python thinks you’re trying to “call” a string — which isn’t possible.

**Correct way:**

```python
message = "Hello"
print(message)
```

Always pick clear, unique variable names that don’t conflict with Python’s built-in functions like print, list, str, sum, max, etc.


<h2 id="multiple-assignation">Multiple assignation</h2>

Assign several variables in one line

```python
e, f, g = 2.5, 2, 'hello'
print(e, f, g)

# List unpacking
a, b, c = [1, 2, 3]
print(a, b, c) # output: 1 2 3

# Tuple unpacking
x, y, z = (4, 5, 6)
print(x, y, z) # output: 4 5 6

# String unpacking
s1, s2 = "ab"
print(s1, s2) # output: a b

# Dict unpacking
k1, k2 = {"a": 1, "b": 2}
print(k1, k2) # output: a b
```


<h2 id="exercises">Exercises</h2>

### Exercise 1 : Zoo Animal Food Cost Calculator

You are managing a zoo and want to calculate the monthly food expenses for one type of animal.
- Each elephant eats 50 kg of food per day.
- The cost of elephant food is 2.5 currency units per kg.
- The zoo has 3 elephants.
- There are 30 days in the month.

Create variables for:
- daily_food_kg_per_elephant
- food_cost_per_kg
- number_of_elephants
- number_of_days

Calculate:
- monthly_cost using these variables.

Print a sentence like:
- The total monthly food cost for the elephants is: XXXX units

**Solution:**

```python
# Variables
daily_food_kg_per_elephant = 50
food_cost_per_kg = 2.5
number_of_elephants = 3
number_of_days = 30

# Calculation
monthly_cost = daily_food_kg_per_elephant * food_cost_per_kg * number_of_elephants * number_of_days

# Output
print(f"The total monthly food cost for the elephants is: {monthly_cost} units")
```


### Exercise 2 : Player Inventory Description (String & Variables)

You’re building a basic text-based game. A player has a few items in their inventory.

1. Create variables for:
- player_name → (e.g. "Aelric")
- item_1 → (e.g. "Sword of Dawn")
- item_2 → (e.g. "Potion of Healing")
- gold_amount → (e.g. 120)
2. Create a variable called inventory_description that says something like:

Aelric’s inventory: Sword of Dawn, Potion of Healing, and 120 gold coins.

3. Print the result using an f-string.

**Solution:**

```python
player_name = "Aelric"
item_1 = "Sword of Dawn"
item_2 = "Potion of Healing"
gold_amount = 120

inventory_description = f"{player_name}'s inventory: {item_1}, {item_2}, and {gold_amount} gold coins."
print(inventory_description)
``` 

### Exercise 3 : Variable Assignment + Indexing — Extracting Date Components

You are given a date in the format "YYYY/MM/DD" as a string. Your task is to extract the year, month, and day using indexing and assign them to variables.

Instructions:
1. Create a variable called date with the value "2024/12/25".
2. Use string indexing to:
- Extract the day (should be "25")
- Extract the month (should be "12")
- Extract the year (should be "2024")
3. Print all three variables to verify.

```python
date = "2024/12/25"
day = ? # fill this in
month = ?  # fill this in
year = ?   # fill this in
```

**Solution:**

```python
date = "2024/12/25"
day = date[-2:]
month = date[5:7]
year = date[:4]

print(f"Year: {year}")
print(f"Month: {month}")
print(f"Day: {day}")
```







<h1>Dictionaries</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#properties">Properties</a></li>
    <li><a href="#accessing-dictionary-values">Accessing dictionary values</a></li>
    <li><a href="#add-key-value-pair">Add key-value pair</a></li>
    <li><a href="#replace-key-value-pair">Replace key-value pair</a></li>
    <li><a href="#retrieve-keys">Retrieve keys</a></li>
    <li><a href="#retrieve-values">Retrieve values</a></li>
    <li><a href="#retrieve-items">Retrieve items</a></li>
    <li><a href="#verify-elt-in-dictionary">Verify if a key is in the dictionary</a></li>
    <li><a href="#remove-key-value-pair">Remove a key-value pair from a dictionary</a></li>
    <li><a href="#pop-key-value-pair">Pop a key-value pair from a dictionary</a></li>
    <li><a href="#clear-dictionary">Clear a dictionary</a></li>
    <li><a href="#shallow-copy">Shallow copy</a></li>
    <li><a href="#deep-copy">Deep copy</a></li>
    <li><a href="#nested-dictionaries">Nested dictionaries</a></li>
    <li><a href="#exercises">Exercises</a></li>
  </ul>
</div>

<hr>

<h2 id="properties">Properties</h2>

Dictionaries work with key-value pairs. 

Instead of being indexed numerically like a list, dictionaries have keys. These keys are the keys that are used to access values within a dictionary.   

- open with `{}` or `dict()`
- Unordered : The order of the elements is not guaranteed
- Mutable : You can change the contents of the dictionary
- Heterogeneous : Dictionaries can contain elements of different data types
- Unhashable : You cannot use a dictionary as a key in a set or as an element of another dictionary
- Unindexed : You cannot access the elements of a dictionary by index

For every key, there can only be one single value, however,  multiple keys can hold the same value. Keys can only be strings, numbers, or tuples, but values can be any data type.

Dictionaries format is very similar to JSON : 
1. opened and closed with curly brackets
2. contains key-value pairs
3. pairs are separated by commas

```python
dict_1 = dict()
dict_2 = {}

print(type(dict_1))
print(type(dict_2))

# Heterogeneous : Dictionaries can contain elements of different data types
dict_3 = {"key1": "value1", 
          "key2": 3, 
          "key3": 3.14,
          "key4": (4, 4, 4), 
          ('key5'): 5, 
          (0, 1): 6,
          "key6": ["list", "of", "strings"], 
          8: 33,
        }
print(dict_3)

# Unordered : The order of the elements is not guaranteed
print(dict_3[0]) # KeyError, 0 is not a key in dict_3
print(dict_3["key1"]) # "value1"

# Mutable : You can change the contents of the dictionary
dict_3["key1"] = "value2"
print(dict_3)
dict_3[("key7")] = True # set is not hashable 
print(dict_3)

# {'key1': 'value1', 
# 'key2': 3, 
# 'key3': 3.14, 
# 'key4': (4, 4, 4), 
# 'key5': 5, 
# (0, 1): 6, 
# 'key6': ['list', 'of', 'strings'], 
# 8: 33,
# 'key7': True}

# Unhashable : You cannot use a dictionary as a key in a set or as an element of another dictionary
set_1 = {dict_3}
print(set_1) # TypeError: unhashable type: 'dict'
dict_3[["key7"]] = True # TypeError: unhashable type: 'list'
dict_4[dict_3] = "value1"
print(dict_4) # TypeError: unhashable type: 'dict'
```

When creating dict_3, we add a comma `,` after the last element to make it a valid dictionary. This is not mandatory, but it is a good practice to make the code more readable.

For example, Git — the version control tool used by almost all developers — tracks changes line by line. If you later add a new item to a list or dictionary, you’ll also need to add a comma to the previous line. Git will then mark that line as changed, too. To avoid this, developers often add the comma in advance. It’s a small optimization that doesn’t change the world, but it helps keep things clean and consistent — and devs love that.

<h2 id="accessing-dictionary-values">Accessing dictionary values</h2>

- declare a variable called key and assign it the value "name"

```python
dict_1 = {
    "name": "Michael",
    "age": 27,
}
key = "name"
print(dict_1[key])
```

### get() method

- a cleaner way to access a dictionary value, returns None if the key does not exist or a default value if the key does not exist while accessing the dictionary value with only dict[key] way will raise a KeyError
 
```python
dict_2 = {
	"name": "Michael",
	"job": "developer",
}

print(dict_2.get("name"))  # returns "Michael"
print(dict_2.get("city"))  # returns None
print(dict_2.get("city", "Not defined"))  # returns Not Define
print(dict_2["city"])  # KeyError, city is not a key in dict_2
```

Use [] when you are 100% sure that the key exists. In doubt, use .get().

<h2 id="add-key-value-pair">Add key-value pair</h2>

- You can add a key-value pair to a dictionary by assigning a value to a new key

```python
dict_3 = { "id": '001',
          "name": "Michael",
          "age": 27,
          }

print(dict_3)

# add a key-value pair to a dictionary
dict_3["job"] = "developer"
print(dict_3)
```

- You can add a key-value pair to a dictionary with the update() method

```python
dict_3 = { "id": '001',
          "name": "Michael",
          "age": 27,
          }

print(dict_3)

# add a key-value pair to a dictionary
dict_3.update({"job": "developer"})
print(dict_3)
```

<h2 id="replace-key-value-pair">Replace key-value pair</h2>

- You can replace a key-value pair in a dictionary by assigning a new value to an existing key

```python
dict_3 = { "id": 001,
          "name": "Michael",
          "age": 27,
          }

print(dict_3)

dict_3["age"] = 35
print(dict_3)
```

- You can replace a key-value pair in a dictionary with the update() method

```python
dict_3 = { "id": 001,
          "name": "Michael",
          "age": 27,
          }

print(dict_3)

dict_3.update({"age": 35})
print(dict_3)
```

<h2 id="retrieve-keys">Retrieve keys</h2>

- You can retrieve the keys of a dictionary by using the keys() method

```python
dict_3 = { "id": 001,
          "name": "Michael",
          "age": 27,
          "job": "developer",
          }

print(dict_3)

# retrieve the keys of a dictionary
print(dict_3.keys()) # dict_keys(['id', 'name', 'age', 'job'])
print(type(dict_3.keys())) # <class 'dict_keys'>
```

<h2 id="retrieve-values">Retrieve values</h2>

- You can retrieve the values of a dictionary by using the values() method

```python
dict_3 = { "id": 001,
          "name": "Michael",
          "age": 27,
          "job": "developer",
          }

print(dict_3)

# retrieve the values of a dictionary
print(dict_3.values()) # dict_values([001, 'Michael', 27, 'developer'])
print(type(dict_3.values())) # <class 'dict_values'>
```

<h2 id="retrieve-items">Retrieve items</h2>

- You can retrieve the items of a dictionary by using the items() method

- items() returns a view object that displays a list of a dictionary's key-value tuple pairs

```python
dict_3 = { "id": "001",
          "name": "Michael",
          "age": 27,
          "job": "developer",
          }

print(dict_3)

# retrieve the items of a dictionary
print(dict_3.items()) # dict_items([('id', 001), ('name', 'Michael'), ('age', 27), ('job', 'developer')]) tuple of key-value pairs
print(type(dict_3.items())) # <class 'dict_items'>
```

<h2 id="verify-elt-in-dictionary">Verify if a key is in the dictionary</h2>

- You can verify if a key is in a dictionary by using the in keyword

```python
dict_3 = { "id": "001",
          "name": "Michael",
          "age": 27,
          "job": "developer",
          }

print(dict_3)

# verify if a key is in a dictionary
print("id" in dict_3) # True
print("city" in dict_3) # False
```

<h2 id="remove-key-value-pair">Remove a key-value pair from a dictionary</h2>

- You can remove a key-value pair from a dictionary by using the del keyword

```python
dict_3 = { "id": "001",
          "name": "Michael",
          "age": 27,
          "job": "developer",
          }

print(dict_3)

# remove a key-value pair from a dictionary
del dict_3["age"]
print(dict_3)
```

<h2 id="pop-key-value-pair">Pop a key-value pair from a dictionary</h2>

- You can pop a key-value pair from a dictionary by using the pop() method

```python
dict_3 = { "id": "001",
          "name": "Michael",
          "age": 27,
          "job": "developer",
          }

print(dict_3)

# pop a key-value pair from a dictionary
pop_age = dict_3.pop("age")
print(dict_3) # {'id': '001', 'name': 'Michael', 'job': 'developer'}
print(pop_age) # 27
```

When choosing between del and pop ?

- del is used when you want to remove a key-value pair from a dictionary and you don't need the value

- pop is used when you want to remove a key-value pair from a dictionary and you need the value

<h2 id="clear-dictionary">Clear a dictionary</h2>

- You can clear a dictionary by using the clear() method

```python
dict_3 = { "id": "001",
          "name": "Michael",
          "age": 27,
          "job": "developer",
          }

print(dict_3)

dict_3.clear()
print(dict_3)
```

<h2 id="shallow-copy">Shallow copy</h2>

- You can create a shallow copy of a dictionary by using the copy() method

```python
dict_3 = { "id": "001",
          "name": "Michael",
          "age": 27,
          "job": "developer",
          }

print(dict_3)

# create a shallow copy of a dictionary
dict_4 = dict_3.copy()
print(dict_4)
```

<h2 id="deep-copy">Deep copy</h2>

- You can create a deep copy of a dictionary by using the deepcopy() method from the copy module

```python
from copy import deepcopy
dict_3 = { "id": "001",
          "name": "Michael",
          "age": 27,
          "job": "developer",
          }

print(dict_3)

# create a deep copy of a dictionary
dict_4 = deepcopy(dict_3)
print(dict_4)
```

<h2 id="nested-dictionaries">Nested dictionaries</h2>

- You can create a nested dictionary by using a dictionary as a value for a key

```python
dict_3 = { "id": "001",
          "name": "Michael",
          "age": 27,
          "job": "developer",
          "address": {"street": "123 Main St", 
                      "city": "New York", 
                      "zip": "10001"},
          } 

print(dict_3)
```

<h2 id="exercises">Exercises</h2>


1. Create two empty dictionaries
- Create two empty dictionaries called `data_config` and `data_config_2` using two different methods.
- Confirm their types.


2. Add Key-Value Pairs
- You will use two different methods to add key-value pairs to the dictionaries.
- Add the following key-value pairs to `data_config`:
    - `"project"`: "Data Pipeline"
    - `"status"`: "running"
    - `"retry_count"`: 3
- Add the following key-value pairs to `data_config_2`:
    - `"project"`: "Data"
    - `"status"`: "stopped"
    - `"retry_count"`: 5

3. Access Values
- Use different methods to access the value of `"project"` in `data_config` and `data_config_2`.
- Try accessing the key `"owner"` with different methods and handle the error or default.


4. Replace Values
- Change `"status"` to "success" using different methods.


5. Retrieve Keys, Values, and Items
- Retrieve all keys using `.keys()` and add them to a set for data_config and data_config_2.
- Retrieve all values using `.values()` and add them to a list for data_config and data_config_2.
- Retrieve all key-value pairs using `.items()` and add them to a list for data_config and data_config_2.
- Print the type of each returned object.


6. Membership Check
- Verify if the key `"retry_count"` exists in the dictionary.
- Check for a non-existent key.



7. Remove Key-Value Pairs
- Use `del` to remove `"retry_count"` from `data_config`. 
- Use `.pop()` to remove `"status"` from `data_config_2` and store its value in a variable called `status_removed`


8. Clear the Dictionary
- Clear the dictionary `data_config` completely using `.clear()`.

```python
data_config.clear()
```

9. Copying Dictionaries
- Rebuild `data_config` with original values.
- Create  shallow copies of `data_config` and `data_config_2` called `data_config_copy` and `data_config_2_copy`.
- Create a deep copy of `data_config` and `data_config_2` called `data_config_deepcopy` and `data_config_2_deepcopy`.


10. Nested Dictionaries
- Add a nested dictionary under the key `"execution"` with:
    - `"start_time"`: "08:00"
    - `"end_time"`: "08:45"
    - `"logs"`: {"level": "INFO", "entries": 215}
- Access the value `"entries"` inside `"logs"`.


11. Course questions
    1. give the five main properties of a dictionary
    2. illustrate each property with an example
    3. Why should we write a comma after the last element of a dictionary?
    4. What is the difference between a shallow copy and a deep copy?
    5. What is the difference between del and pop?
    6. Which file format are dictionaries similar to?


---

### ✅ Solutions

1. 

```python
data_config = {}
data_config_2 = dict()
print(type(data_config))
print(type(data_config_2))
```

2. 

```python
data_config["project"], data_config["status"], data_config["retry_count"] = "Data Pipeline", "running", 3
data_config_2.update({"project": "Data", "status": "stopped", "retry_count": 5})
```

3. 

```python
print(data_config["project"])
print(data_config_2.get("project"))
print(data_config.get("owner", "Not defined"))
```

4. 

```python
data_config["status"] = "success"
data_config_2.update({"status": "success"})
```

5. 

```python
key_set = set(data_config.keys())
value_list = list(data_config.values())
item_list = list(data_config.items())

key_set_2 = set(data_config_2.keys())
value_list_2 = list(data_config_2.values())
item_list_2 = list(data_config_2.items())
```

6. 

```python
print("retry_count" in data_config)
print("nonexistent" in data_config)
```

7. 

```python
del data_config["retry_count"]
status_removed = data_config_2.pop("status")
```

8. 

```python
data_config.clear()
print(data_config)
```

9. 

```python
from copy import deepcopy

data_config = {
    "project": "Data Pipeline",
    "status": "running",
    "retry_count": 3,
}
data_config_copy = data_config.copy()
data_config_deepcopy = deepcopy(data_config)
data_config_2_copy = data_config_2.copy()
data_config_2_deepcopy = deepcopy(data_config_2)
```

10. 

```python
data_config["execution"] = {
    "start_time": "08:00",
    "end_time": "08:45",
    "logs": {
        "level": "INFO",
        "entries": 215,
    },
}
print(data_config["execution"]["logs"]["entries"])  # 215
```

11. Course questions

    1. Unordered, mutable, heterogeneous, unhashable, unindexed
    2. 

    ```python
    dict_1 = { "id": "001",
            "name": "Michael",
            "age": 27,
            "job": "developer",
            }

    # Unordered and Unindexed
    print(dict_1[0]) # KeyError

    # Mutable
    dict_1["age"] = 28

    # Heterogeneous
    dict_2 = {"id": "001", 
            "name": "Michael", 
            "age": 27, 
            "job": "developer", 
            (0,1): True, 
            "skills": ["python", "sql", "excel"]}

    # Unhashable
    set_1 = {dict_2}
    print(set_1) # TypeError: unhashable type: 'dict'
    dict_2[[0,1]] = True # TypeError: unhashable type: 'list'

    dict_3 = {"id": "001"}
    dict_3[dict_2] = True # TypeError: unhashable type: 'dict'
    ```

    3. We write a comma after the last element of a dictionary to make it a valid dictionary. This is not mandatory, but it is a good practice to make the code more readable. For example, Git tracks changes line by line. If you later add a new item to a list or dictionary, you’ll also need to add a comma to the previous line. Git will then mark that line as changed, too. To avoid this, developers often add the comma in advance. It’s a small optimization that doesn’t change the world, but it helps keep things clean and consistent — and devs love that.

    4. A shallow copy of a dictionary is a new dictionary that contains references to the same objects as the original dictionary. A deep copy of a dictionary is a new dictionary that contains copies of the objects in the original dictionary. 

    5. del is used when you want to remove a key-value pair from a dictionary and you don't need the value. pop is used when you want to remove a key-value pair from a dictionary and you need the value.

    6. Dictionaries are similar to JSON files in that they are key-value pairs. 
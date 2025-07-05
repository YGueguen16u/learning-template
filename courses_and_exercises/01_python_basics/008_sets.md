<h1>Sets</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#properties">Properties</a></li>
    <li><a href="#set-operations">Set Operations</a></li>
    <ul>
      <li><a href="#add">Add</a></li>
      <li><a href="#remove">Remove</a></li>
      <li><a href="#pop">Pop</a></li>
      <li><a href="#verify-elt-in-set">Verify if an element is in the set</a></li>
      <li><a href="#union">Union</a></li>
      <li><a href="#intersection">Intersection</a></li>
      <li><a href="#difference">Difference</a></li>
      <li><a href="#symmetric-difference">Symmetric Difference</a></li>
      <li><a href="#subsets-and-supersets">Subsets and Supersets</a></li>
    </ul>
    <li><a href="#exercises">Exercises</a></li>
  </ul>
</div>

<h2 id="properties">Properties</h2>

You can create a set with `{}` or the `set()` constructor.

- **Unordered**: Sets are unordered, meaning the order of elements is not guaranteed (indexing).
- **Mutable**: Sets are mutable, meaning you can modify their contents.
- **Unique**: Sets contain unique elements, meaning duplicates are automatically removed.
- **Heterogeneous**: Sets can contain elements of different data types.
- **Unhashable**: Sets cannot be hashed, meaning they cannot be used as dictionary keys or elements of other sets.

```python
set_1 = {1, "apple", 3.14, True}
set_2 = set((1, "apple", 3.14, True))
print(set_1)
print(set_2)
print(type(set_1))
print(type(set_2))

# Unique
set_3 = {1, 2, 2, 3, 3, 3}
print(set_3)  # {1, 2, 3}
```

**Unhashable**

```python
set_4 = {1, 2, 3, [4, 5, 6]}
print(set_4)
```

```
Traceback (most recent call last):
  File "/Users/GUEGUEN/CascadeProjects/tech-learning-template/python/basics/try.py", line 21, in <module>
    set_4 = {1, 2, 3, [4, 5, 6]}
TypeError: unhashable type: 'list'
```

**Unordered**

```python
set_5 = {1, 2, 3, 4, 5}
print(set_5)
print(set_5[0])
```

```
{1, 2, 3, 4, 5}
Traceback (most recent call last):
  File "/Users/GUEGUEN/CascadeProjects/tech-learning-template/python/basics/try.py", line 3, in <module>
    print(set_5[0])
TypeError: 'set' object is not subscriptable
```

<h2 id="set-operations">Set Operations</h2>

<h3 id="add">Add</h3>

- Add an element to the set.

```python
set_6 = {1, 2, 3, 4, 5}
set_6.add(6)
set_6.add("hello")
print(set_6)
```

<h3 id="remove">Remove</h3>

- Remove an element from the set.

```python
set_6 = {1, 2, 3, 4, 5, "hello"}
set_6.remove("hello")
print(set_6)
```

<h3 id="pop">Pop</h3>

- Remove and return an arbitrary element from the set. Raises a KeyError if the set is empty.

```python
set_6 = {1, 2, 3, 4, 5, "hello"}
popped_value = set_6.pop()
print(set_6)
print(popped_value)
```

<h3 id="discard">Discard</h3>

- Remove a specified element from the set if it is present. Ignores the element if it is not present.

```python
set_6 = {1, 2, 3, 4, 5, "hello"}
set_6.discard("hello")
print(set_6)
```

<h3 id="verify-elt-in-set">Verify if an element is in the set</h3>

- Verify if an element is in the set.

```python
set_6 = {1, 2, 3, 4, 5, "hello"}
print("hello" in set_6)
print("world" in set_6)
```

<h3 id="update">Update</h3>

- Update the set with the union of itself and an iterable or another set.

```python
set_6 = {1, 2, 3, 4, 5}
list_7 = [4, 5, 6, 7, 8]
set_6.update(list_7)
print(set_6) # {1, 2, 3, 4, 5, 6, 7, 8}
```

<h3 id="union">Union</h3>

- Union of two sets.

**union() method**
```python
set_6 = {1, 2, 3, 4, 5}
set_7 = {4, 5, 6, 7, 8}
print(set_6.union(set_7)) # {1, 2, 3, 4, 5, 6, 7, 8}
```

**union operator**
```python
set_6 = {1, 2, 3, 4, 5}
set_7 = {4, 5, 6, 7, 8}
print(set_6 | set_7) # {1, 2, 3, 4, 5, 6, 7, 8}
```

<h3 id="intersection">Intersection</h3>

- Intersection of two sets.

**intersection() method**
```python
set_6 = {1, 2, 3, 4, 5}
set_7 = {4, 5, 6, 7, 8}
print(set_6.intersection(set_7)) # {4, 5}
```

**intersection operator**
```python
set_6 = {1, 2, 3, 4, 5}
set_7 = {4, 5, 6, 7, 8}
print(set_6 & set_7) # {4, 5}
```

<h3 id="difference">Difference</h3>

- Difference of two sets.
- Returns a set containing the elements that are in the first set but not in the second set.
- Take care of the order of the sets : set_1 - set_2 != set_2 - set_1

**difference() method**
```python
set_6 = {1, 2, 3, 4, 5}
set_7 = {4, 5, 6, 7, 8}
print(set_6.difference(set_7)) # {1, 2, 3}
print(set_7.difference(set_6)) # {8, 6, 7}
```

**difference operator**
```python
set_6 = {1, 2, 3, 4, 5}
set_7 = {4, 5, 6, 7, 8}
print(set_6 - set_7) # {1, 2, 3}
print(set_7 - set_6) # {8, 6, 7}
print(set_6 - set_7 == set_7 - set_6) # False
```

<h3 id="symmetric-difference">Symmetric Difference</h3>

- Symmetric difference of two sets.
- Returns a set containing the elements that are in either of the sets but not in both.
- Here order doesn't matter : `set_1 ^ set_2 == set_2 ^ set_1`

**symmetric_difference() method**
```python
set_6 = {1, 2, 3, 4, 5}
set_7 = {4, 5, 6, 7, 8}
print(set_6.symmetric_difference(set_7)) # {1, 2, 3, 6, 7, 8}
print(set_7.symmetric_difference(set_6)) # {1, 2, 3, 6, 7, 8}
```

**symmetric_difference operator**
```python
set_6 = {1, 2, 3, 4, 5}
set_7 = {4, 5, 6, 7, 8}
print(set_6 ^ set_7) # {1, 2, 3, 6, 7, 8}
print(set_7 ^ set_6) # {1, 2, 3, 6, 7, 8}
print(set_6 ^ set_7 == set_7 ^ set_6) # True
```

<h3 id="subsets-and-supersets">Subsets and Supersets</h3>

- Subsets and Supersets of two sets.
- Returns a boolean value.

**issubset() method**
```python
sub_set_list_1 = [1, 2, 3, 4, 5]
sup_set_list_2 = [1, 2, 3, 4, 5, 6, 7, 8]
print(set(sub_set_list_1).issubset(set(sup_set_list_2))) # True
print(set(sup_set_list_2).issubset(set(sub_set_list_1))) # False
```

**issuperset() method**
```python
sub_set_list_1 = [1, 2, 3, 4, 5]
sup_set_list_2 = [1, 2, 3, 4, 5, 6, 7, 8]
print(set(sub_set_list_1).issuperset(set(sup_set_list_2))) # False
print(set(sup_set_list_2).issuperset(set(sub_set_list_1))) # True
```

**issubset operator** (<= : less than or equal to)
```python
sub_set_list_1 = [1, 2, 3, 4, 5]
sup_set_list_2 = [1, 2, 3, 4, 5, 6, 7, 8]
print(set(sub_set_list_1) <= set(sup_set_list_2)) # True 
print(set(sup_set_list_2) <= set(sub_set_list_1)) # False
```

**issuperset operator** (>= : greater than or equal to)
```python
sub_set_list_1 = [1, 2, 3, 4, 5]
sup_set_list_2 = [1, 2, 3, 4, 5, 6, 7, 8]
print(set(sub_set_list_1) >= set(sup_set_list_2)) # False
print(set(sup_set_list_2) >= set(sub_set_list_1)) # True
```

<h2 id="exercises">Exercises</h2>

### Set Operations in Practice — Data Engineering Scenario

You work as a junior data engineer for a retail company. Your team is auditing the product data. The product database gives you:

- A list of product IDs already in the database
- A list of product IDs from a recent inventory scan
- A list of products to be removed for being outdated

Use this real-world example to practice all set operations covered so far.

---

### Instructions

1. **Create Initial Sets**
    - Create three sets:
        - `db_products` from `[1001, 1002, 1003, 1004, 1005, 1005]`
        - `scanned_products` from `[1004, 1005, 1006, 1007]`
        - `to_remove` from `[1002, 1003]`
        - `to_discard` from `[1002, 1003]`
    - Confirm their types and print the unique elements for each.

Here is a new question that groups all three properties — uniqueness, unhashable elements, and unordered nature — into a single, realistic and practical task, consistent with the style of your current set exercise:

⸻

2. **Create and Debug a Weird Set**

You are asked to initialize a new set of raw inputs coming from an external data source. These values are meant to be deduplicated and ready for hashing into a caching system.

Try to create the following set and explain all unexpected behaviors you encounter:

```python
raw_inputs = {1, 2, 2, 3, 3, 3, [4, 5, 6]}
```

Correct the set definition to remove the unexpected behaviors.

Then:
- Try to access the first element of the set using indexing.



3. **Check Product Presence**
    - Is product `1006` in the database?
    - Is product `1002` in the scan?

4. **Add a Product to the Database**
    - Add product `1008` to the `db_products`.

5. **Remove a Product from the Database**
    - Remove product `1001` from the database.
    - Remove product `1002` from the database using `discard`.
    - What is the difference between 2 methods?

6. **Pop a Random Product**
    - Pop a random product from `db_products` and store it in `removed_id`.

7. **Update Database with New Scan**
    - Update `db_products` with the union of `scanned_products`.

8. **Find Products Only in Database**
    - What products are in the database but not yet in the scan?

9. **Find Common Products**
    - What products are shared between the scan and database?

10. **Difference in Both Directions**
    - What products are in `db_products` but not in `scanned_products`?
    - What products are in `scanned_products` but not in `db_products`?
    - Are the results the same?

11. **Symmetric Difference**
    - Which products appear in only one of the two sets?
    - Are the results the same?

12. **Subsets and Supersets**
    - Is `to_remove` a subset of `db_products`?
    - Is `db_products` a superset of `to_remove`?

---

### Solutions

```python
# 1. Create Sets
products_db = set([1001, 1002, 1003, 1004, 1005, 1005])
scanned_products = set([1004, 1005, 1006, 1007])
to_remove = {1002, 1003}

print("products_db", products_db)  # {1001, 1002, 1003, 1004, 1005}
print("scanned_products", scanned_products)  # {1004, 1005, 1006, 1007}
print("to_remove", to_remove)  # {1002, 1003}
print("type products_db", type(products_db))
print("type scanned_products", type(scanned_products))

#2. weird set
raw_inputs = {1, 2, 2, 3, 3, 3, [4, 5, 6]}
print("raw_inputs", raw_inputs) 

"""
Traceback (most recent call last):
  File "/Users/GUEGUEN/CascadeProjects/tech-learning-template/python/basics/try.py", line 1, in <module>
    raw_inputs = {1, 2, 2, 3, 3, 3, [4, 5, 6]}
TypeError: unhashable type: 'list'

explantion : set is unhashable

The second observation is the uniqueness of the elements.
"""
corrected_raw_inputs = set([1, 2, 2, 3, 3, 3, 4, 5, 6])
print("corrected_raw_inputs", corrected_raw_inputs) # {1, 2, 3, 4, 5, 6}

print("corrected_raw_inputs[0]", corrected_raw_inputs[0]) # TypeError: 'set' object is not subscriptable


# 3. Check Presence
print("1006 in products_db", 1006 in products_db)  # False
print("1002 in scanned_products", 1002 in scanned_products)  # False

# 4. Add Product
products_db.add(1008)
print("products_db", products_db)

# 5. Remove Product
products_db.remove(1001)
print("products_db", products_db)
products_db.discard(1002)
print("products_db", products_db)

"""
remove : raise an error if the element is not in the set
discard : does not raise an error if the element is not in the set
pop : remove and return an arbitrary element from the set. Raises a KeyError if the set is empty
"""

# 6. Pop Random Product
removed_id = products_db.pop()
print("Removed:", removed_id)
print("products_db", products_db)

# 7. Union
products_db = products_db | scanned_products
print("products_db", products_db)

# 8. Difference (db - scan)
print("products_db - scanned_products", products_db - scanned_products)  # {1001, 1008}

# 9. Intersection
print("products_db & scanned_products", products_db & scanned_products)  # {1004, 1005, 1006, 1007}

# 10. Differences
print("products_db - scanned_products", products_db - scanned_products)  # IDs in db only
print("scanned_products - products_db", scanned_products - products_db)  # IDs in scan only
print("(products_db - scanned_products) == (scanned_products - products_db)", 
  (products_db - scanned_products) == (scanned_products - products_db))  # False

# 11. Symmetric Difference
print("products_db ^ scanned_products", products_db ^ scanned_products)
print("scanned_products ^ products_db", scanned_products ^ products_db)
print("(products_db ^ scanned_products) == (scanned_products ^ products_db)", 
  (products_db ^ scanned_products) == (scanned_products ^ products_db))  # True

# 12. Subset and Superset
print("to_remove.issubset(products_db)", to_remove.issubset(products_db))  # True or False
print("products_db.issuperset(to_remove)", products_db.issuperset(to_remove))  # True or False
print("to_remove <= products_db", to_remove <= products_db)  # Same as issubset
print("products_db >= to_remove", products_db >= to_remove)  # Same as issuperset
```
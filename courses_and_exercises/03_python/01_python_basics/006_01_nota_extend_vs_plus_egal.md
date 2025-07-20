<h1>Understanding List Concatenation and Memory Behavior in Python: a = a + b vs a += b vs a.extend(b)</h1>

Let’s explore what happens in memory when you combine two lists using:
- a = a + b (creates a new object)
- a += b and a.extend(b) (in-place modification)

Initial Setup: Two Separate Lists

```python
a = [1, 2]
b = [3, 4]
```

In memory:
	•	a → points to list [1, 2] (let’s call this id_a1)
	•	b → points to list [3, 4] (id_b)



1. a = a + b (Creates a new object)

```python
a = [1, 2]
b = [3, 4]
print(id(a))       # e.g., 140082302318784
a = a + b
print(id(a))       # e.g., 140082302320896 ← different!
```

What happens:
	•	a + b creates a new list [1, 2, 3, 4]
	•	Python allocates new memory for this list
	•	a now points to the new list
	•	The old [1, 2] object becomes unreachable (garbage collected)

Not in-place. Less efficient, especially inside loops or large operations.


2. a += b (In-place modification)

```python
a = [1, 2]
b = [3, 4]
print(id(a))       # e.g., 140082302318784
a += b
print(id(a))       # e.g., 140082302318784 ← same!
```

What happens:
	•	Python calls a.__iadd__(b)
	•	a is modified in place to become [1, 2, 3, 4]
	•	No new object is created
	•	a keeps the same memory address

Faster and more memory-efficient than a = a + b


3. a.extend(b) (Also in-place)

```python
a = [1, 2]
b = [3, 4]
print(id(a))       
a.extend(b)
print(id(a))       # same as before
```

Same behavior as +=:
	•	a is modified in-place
	•	Same memory address
	•	Result: [1, 2, 3, 4]


4. What if we do c = a?

Explore how variable references behave:

```python
a = [1, 2]
b = [3, 4]
c = a          # c points to the same object
a += b         # in-place modification
print(a)       # [1, 2, 3, 4]
print(c)       # [1, 2, 3, 4] c was affected too
```

```python
a2 = [1, 2]
b2 = [3, 4]
c2 = a2        # c2 points to same list
a2 = a2 + b2   # creates new object
print(a2)      # [1, 2, 3, 4]
print(c2)      # [1, 2] c2 remains unchanged
```

Summary:
- c = a creates an alias: both a and c refer to the same memory
- a += b → modifies in-place → c also reflects the change
- a = a + b → creates a new object → c still points to the old list

Summary Table (Memory Behavior)

|Operation	|id before	|id after	|Behavior
|---|---|---|---
a = a + b	|0x1A3F	|0x1B7E	|New object
a += b	|0x1A3F	|0x1A3F	|In-place
a.extend(b)	|0x1A3F	|0x1A3F	|In-place


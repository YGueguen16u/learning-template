### Exercise 1

- Create a function which return always the same value ("Hello" or 33 or [A, B, C])

```python
def my_function(x):
    return  "Hello" # or 33 or ["A", "B", "C"]
    
result = my_function(56)
print(result)
```

### Exercise 2

- Define a function `add_one_list()` 
- this function takes any list x as an argument
- this function iterates over the list
- adds 1 to each value in the list
- stores the results in a new list
- return the new list

```python
def add_one_list(x : list) -> list:
    new_list = []
    for i in x :
        new_list.append(i + 1)
    return new_list

print(add_one_list([1, 2, 3]))
```

### Exercise 3

- Create a function with a f-string
... other consigfnes

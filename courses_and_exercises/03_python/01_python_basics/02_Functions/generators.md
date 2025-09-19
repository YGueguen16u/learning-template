# Generators

Generators are a special kind of function in Python that allow you to iterate over values one at a time, without storing the entire sequence in memory.

They are:

- A more efficient alternative to lists when you don’t need all items at once.
- Defined using the yield keyword (instead of return).
- Paused and resumed between calls, preserving their internal state.
- Iterable : use the operator `next()` to get the next value
- At the end of the iteration, the generator is empty. 
- Generators can also be called for all values using `list()` instead of `next()`
- Generators can be even more efficient when created from list comprehensions
- The syntax is identical to a list comprehensions, except `()` are used instead of `[]`

A generator yields one value at a time, and remembers where it left off:

```python
def square_list(list_num : list[int]) :
    for num in list_num :
        yield num * num 

list_number = square_list([1, 2, 3, 4, 5])

print(next(list_number))
print(next(list_number))
print(next(list_number))
print(next(list_number))
print(next(list_number))
print(next(list_number)) # Error
```

```
1
4
9
16
25
Traceback (most recent call last):
  File "/Users/GUEGUEN/CascadeProjects/tech-learning-template/try.py", line 12, in <module>
    print(next(list_number))
StopIteration
```

- At the end of the iteration, an error `StopIteration` is raised.

Use `list()`or `tuple()`to get all values at once:

```python
list_number = square_list([1, 2, 3, 4, 5])
print(list(list_number))
print(tuple(list_number))
print(set(list_number))
```

```
[1, 4, 9, 16, 25]
(1, 4, 9, 16, 25)
{1, 4, 9, 16, 25}
```

Use list comprehension to create a generator:

```python
to_generate = (i**2 for i in [4,5,6])
print(next(to_generate))
print(next(to_generate))
print(next(to_generate))
print(list(to_generate))
```

```
16
25
36
[16, 25, 36]
```

Take care, when all values are generated, the generator is empty. 
Even if you call with the `list()` function, it will return an empty list.

```python
to_generate = (i**2 for i in [4,5,6])
print(next(to_generate))
print(next(to_generate))
print(next(to_generate))
print(list(to_generate))
```

```
16
25
36
[]
```

**Why Use Generators?**

- **Memory-efficient**: great for working with large datasets or infinite streams.
- **Lazy evaluation**: values are computed only when needed.
- **Cleaner code**: avoids building unnecessary full lists in memory.
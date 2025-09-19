# Lambda

The lambda keyword allows for a faster, one-line definition of simple functions that:

- Take one or more numeric parameters as arguments
- Return the value of a numeric expression

The syntax:

```python
FunctionName = lambda parameter_1, parameter_2, ... : expression
```

Example:

```python
add = lambda x, y: x + y
print(add(2, 3))
```

```
5
```

```python
norme = lambda x, y : (x**2 + y**2)**0.5
print(norme(3, 4))
```

```
5.0
```

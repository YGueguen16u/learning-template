<h1>Expressions</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#arithmetic-operators">Arithmetic Operators</a></li>
    <li><a href="#order-of-operations">Order of Operations</a></li>
  </ul>
</div>


<h2 id="arithmetic-operators">Arithmetic Operators</h2>

| **Operator** | **Name**            | **Example** | **Result** |
| ------------ | ------------------- | ----------- | ---------- |
| +            | Addition            | 100 + 60    | 160        |
| -            | Subtraction         | 10 - 30     | -20        |
| *            | Multiplication      | 5 * 5       | 25         |
| /            | Division            | 25 / 5      | 5.0        |
| //           | Integer Division    | 25 // 6     | 4          |
| %            | Modulus (remainder) | 25 % 6      | 1          |
| **           | Exponent            | 2 ** 3      | 8          |

```python
print(3 * 3) # output: 9
print(9 / 3) # output: 3.0
print(3 ** 3) # output: 27
print(10 % 3) # output: 1
print(10 // 3) # output: 3

type(6/2) # float
type(6//2) # int
```

```
The `//` symbol performs integer division but does not give you the remainder. 

The `%` symbol, also called “modulo”, retrieves the remainder after an integer division. 
```
  

For example, if you divide 10 by 4, you have 2 x 4 = 8, and it leaves 2.

[https://imgflip.com/gif/9d87fu](https://imgflip.com/gif/9d87fu)

[https://fr.wikipedia.org/wiki/Division_euclidienne](https://fr.wikipedia.org/wiki/Division_euclidienne) :

```ad-note
The "//" sign will almost never be used.

On the other hand, the "%" sign is sometimes practical to know if a number is even or odd. Can you guess how?
```

**Exercise 1:Use the modulo to know if a number is even**

To know if a number X is even using the modulo, you just need to do:

```python
x = 23
print(x % 2) # output: 1

y = 102
print(y % 2) # output: 0
```

For example:

- 23 % 2 gives a remainder of 1. It's an odd number. 

- 102 % 2 gives a remainder of 0. It's an even number.

**Exercise 2: Find the value of x so that 2 ** x = 512**

```python
x = 9
2 ** x = 512
```

**Exercise 3: Transform 57.678 miles into kilometers (1 mile = 1.60934 km)**

```python
print(57.678 * 1.60934) 
```


---
<h2 id="order-of-operations">Order of Operations (PEMDAS)</h2>

Python respects the mathematical order:

- **Parentheses > Exponents > Multiplication/Division > Addition/Subtraction**
    

**Example:**

```python
result = (30 + 2) * 60
print(result)   # 1920
```

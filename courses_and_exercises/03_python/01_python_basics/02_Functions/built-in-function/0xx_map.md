# map()

`map()` applies **the same function** to **each element** of one or more iterables, **lazily** (on demand), returning an **iterator**.

Typical use cases:

* Data cleaning or type conversion (`int`, `float`, `strip`, `lower`)
* Applying operations in parallel to multiple lists
* Chaining transformations without creating intermediate lists


```python
map(function, iterable, *iterables) -> map_object
```

* **`function`** → A callable that accepts as many arguments as there are iterables.
* **`iterable, *iterables`** → One or more iterables (list, tuple, generator, etc.).
* Returns a **map object** (an **iterator** that can be consumed only once).
* Stops at the **shortest iterable** if multiple are provided.

Example:

```python
list(map(int, ["1", "2", "3"]))  
# [1, 2, 3]

list(map(lambda x, y: x + y, [1, 2, 3], [10, 20, 30]))  
# [11, 22, 33]
```

---

#### Laziness

`map()` is **lazy**: nothing happens until you iterate over it.

```python
m = map(int, ["1", "2", "3"])
next(m)   # 1
list(m)   # [2, 3] (the first value is gone)
```

Implications:

* You **can’t reuse** the same `map` object.
* If you need to iterate multiple times, recreate it or cast to `list()` once.

---

#### `map()` vs List Comprehension

| Aspect          | `map()`                                                  | List Comprehension                |
| --------------- | -------------------------------------------------------- | --------------------------------- |
| **Performance** | Faster for built-in functions (`int`, `str.strip`, etc.) | Similar speed otherwise           |
| **Readability** | Less explicit with `lambda`                              | More Pythonic and clear           |
| **Flexibility** | Limited                                                  | Highly flexible for complex logic |

Example:

```python
# Clean and convert (fast and clear with map)
list(map(str.strip, [" Alice ", " Bob ", " Carol "]))

# Same, but more readable when logic is complex
[x.strip().upper() for x in [" Alice ", " Bob ", " Carol "]]
```

---

#### Core examples with a single iterable

**Type conversion**

```python
nums = ["10", "20", "30"]
ints = list(map(int, nums))        # [10, 20, 30]
floats = list(map(float, nums))    # [10.0, 20.0, 30.0]
```

**String cleaning**

```python
raw = ["  Alice  ", "  BOB", "\tcarol \n"]
clean = list(map(str.strip, raw))        # ["Alice", "BOB", "carol"]
lowered = list(map(str.lower, clean))    # ["alice", "bob", "carol"]
```

**Transformation with `lambda`**

```python
squares = list(map(lambda x: x * x, range(6)))  
# [0, 1, 4, 9, 16, 25]
```

**Using `operator` for cleaner code**

```python
import operator

names = ["alice", "BOB", "Carol"]
upper = list(map(str.upper, names))  
# ['ALICE', 'BOB', 'CAROL']

strip_all = list(map(operator.methodcaller("strip"), ["  a  ", "  b  "]))  
# ['a', 'b']
```

---

#### Working with multiple iterables

**Element-wise addition**

```python
list(map(lambda x, y: x + y, [1, 2, 3], [10, 20, 30, 40]))  
# [11, 22, 33] (stops at the shortest)
```

**Parallel formatting**

```python
first = ["Ada", "Alan", "Grace"]
last  = ["Lovelace", "Turing", "Hopper", "Extra"]

full = list(map(lambda f, l: f"{f} {l}", first, last))
# ['Ada Lovelace', 'Alan Turing', 'Grace Hopper']
```

---

#### Useful patterns

**Lazy pipelines**

```python
data = [" 12 ", " -3", " 7 "]
pipeline = map(int, map(str.strip, data))
list(pipeline)  
# [12, -3, 7]
```

**Extracting dict keys**

```python
users = [{"name": "Alice", "age": "30"}, {"name": "Bob", "age": "22"}]
names = list(map(lambda u: u["name"], users))  
# ['Alice', 'Bob']
```

**Safe conversion**

```python
def to_int_safe(x):
    try:
        return int(x)
    except ValueError:
        return None

vals = ["10", "oops", "20"]
list(map(to_int_safe, vals))  
# [10, None, 20]
```

---

#### Pitfalls & Best Practices

| Pitfall             | Explanation                                  | Fix                            |
| ------------------- | -------------------------------------------- | ------------------------------ |
| **Single-use**      | `map` iterators are consumed once            | Wrap with `list()` or recreate |
| **Lazy exceptions** | Errors raised during iteration, not creation | Handle in custom functions     |
| **Mismatched args** | Function arg count ≠ number of iterables     | Adjust the function signature  |
| **Python 2 habit**  | `map(None, ...)` no longer works             | Use `zip` instead              |

---

#### Alternatives to `map()`

| Need                         | Better Tool                               |
| ---------------------------- | ----------------------------------------- |
| Simple transformation        | `map()`                                   |
| Complex transformation       | List comprehension                        |
| Filtering                    | `filter()` or `[x for x in ... if ...]`   |
| Aggregation                  | `sum()`, `max()`, or `functools.reduce()` |
| Iterating multiple sequences | `zip()`                                   |
| Argument unpacking           | `itertools.starmap()`                     |

Example with `starmap`:

```python
from itertools import starmap
pairs = [(2, 3), (4, 5)]
list(starmap(lambda a, b: a * b, pairs))
# [6, 20]
```

---

#### Performance Tips

* `map()` with **built-ins** is slightly faster than comprehensions.
* For `lambda`, readability is usually more important than micro-optimizations.
* Keep `map` **lazy** for very large datasets.

---

#### Advanced Use Cases

**Clean & filter lazily**

```python
import math

data = [" 3.14 ", " NaN ", " 2.71 ", "oops", " 1.41 "]

def parse_float(s):
    try:
        x = float(s.strip())
        return x if math.isfinite(x) else None
    except ValueError:
        return None

clean_iter = map(parse_float, data)
clean_vals = (x for x in clean_iter if x is not None)

for v in clean_vals:
    print(v)
```

**Stream processing**

```python
def lines(path):
    with open(path, "r", encoding="utf-8") as f:
        for line in f:
            yield line

lengths = map(lambda s: len(s.strip()), lines("big.txt"))
total = sum(lengths)
```

**Quick aggregations**

```python
sum(map(int, ["1", "2", "3"]))       # 6
all(map(str.isdigit, ["123", "456"]))  # True
any(map(str.isupper, ["abc", "DeF"]))  # True
```

---

### **Exercise 1 – Safe integer parsing**

Convert `["10", " -3", "x", "  7", "NaN"]` → `[10, -3, 7]`.

```python
import math

def safe_parse(val):
    try:
        f = float(val.strip())
        if f.is_integer() and math.isfinite(f):
            return int(f)
    except ValueError:
        return None

vals = ["10", " -3", "x", "  7", "NaN"]
result = [v for v in map(safe_parse, vals) if v is not None]
print(result)  # [10, -3, 7]
```

---

### **Exercise 2 – Element-wise sum with clamp**

Sum `a=[1,200,3]` and `b=[4,5,6,7]`, but clamp results at `100`.

```python
def clamp100(x): 
    return x if x <= 100 else 100

a, b = [1,200,3], [4,5,6,7]
res = list(map(lambda s: clamp100(s), map(lambda x, y: x+y, a, b)))
print(res)  # [5, 100, 9]
```

---

### **Exercise 3 – Text normalization**

Strip, lowercase, and collapse multiple spaces to one.

```python
import re

text = ["  Hello   World ", "\tPYTHON\t ROCKS  "]

def normalize(s):
    return re.sub(r"\s+", " ", s.strip().lower())

norm = map(normalize, text)
print(list(norm))  # ['hello world', 'python rocks']
```

---

### **13) Cheat Sheet**

```python
# Single iterable
list(map(int, ["1","2","3"]))

# Multiple iterables
list(map(lambda x, y: x*y, [1,2,3], [10,20,30]))

# Lazy pipeline
pipeline = map(int, map(str.strip, data))

# Apply a method to all elements
import operator
list(map(operator.methodcaller("strip"), items))

# Extract dict fields
from operator import itemgetter
list(map(itemgetter("name"), users))

# Boolean checks
all(map(str.isdigit, ["123","456"]))
```

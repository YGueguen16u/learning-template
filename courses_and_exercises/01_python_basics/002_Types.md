<h1>Python Data Types</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#common-types">Common Python Data Types</a></li>
    <li><a href="#integers">Integers (int)</a></li>
    <li><a href="#floats">Floats (float)</a></li>
    <li><a href="#strings">Strings (str)</a></li>
    <li><a href="#booleans">Booleans (bool)</a></li>
    <li><a href="#casting">Type Casting</a></li>
    <li><a href="#summary">Summary Table</a></li>
    <li><a href="#complement">Complement</a></li>
  </ul>
</div>

<hr>

<h2 id="common-types">Common Python Data Types</h2>

A **type** in Python determines what kind of data a value holds and what operations can be performed on it.


|**Expression**|**Data Type**|**Example Use**|
|---|---|---|
|11|int|Number of apples|
|21.213|float|Measurement in meters|
|"Hello"|str|Name, message, sentence, etc.|

```python
type(11)         # <class 'int'>
type(21.213)     # <class 'float'>
type("Hello")    # <class 'str'>
```


<h2 id="integers">Integers (int)</h2>

- Whole numbers, positive or negative.
    
- Example: -5, 0, 12, 2048

**Example:**

```python
type(-7)    # <class 'int'>
```

**Exercise 1:** Try `type(50)` in a Python shell

**hint:**
- type python3 in your terminal to open a Python shell
- write `type(50)` in the shell when `>>>` appears
- close the shell with `exit()`

```bash
# Open a Python shell
GUEGUEN@mac tech-learning-template % python3
Python 3.9.6 (default, Apr 30 2025, 02:07:17) 
[Clang 17.0.0 (clang-1700.0.13.5)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> type(50)
<class 'int'>
>>> # Close the shell with `exit()`
>>> exit()
```



<h2 id="floats">Floats (float)</h2>

- Real numbers (with decimals), including in-between values.
    
- Example: 3.14, 0.5, -2.78

**Exercise 2:** Try `type(9.81)` in a Python shell

```bash
# Open a Python shell
GUEGUEN@mac tech-learning-template % python3
Python 3.9.6 (default, Apr 30 2025, 02:07:17) 
[Clang 17.0.0 (clang-1700.0.13.5)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> type(9.81)
<class 'float'>
>>> # Close the shell with `exit()`
>>> exit()
```


<h2 id="strings">Strings (str)</h2>

- A sequence of characters enclosed in quotes.
    
- Example: "Python" or 'Python', "123" or '123'
      
**Example:**

```python
type("123")     # <class 'str'>
```

**Exercise 3:** Try `type("Who are you ?")` in a Python shell

```bash
# Open a Python shell
GUEGUEN@mac tech-learning-template % python3
Python 3.9.6 (default, Apr 30 2025, 02:07:17) 
[Clang 17.0.0 (clang-1700.0.13.5)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> type("Who are you ?")
<class 'str'>
>>> # Close the shell with `exit()`
>>> exit()
```

**Exercise 4:** Try `type("55")` in a Python shell

```bash
# Open a Python shell
GUEGUEN@mac tech-learning-template % python3
Python 3.9.6 (default, Apr 30 2025, 02:07:17) 
[Clang 17.0.0 (clang-1700.0.13.5)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> type("55")
<class 'str'>
>>> # Close the shell with `exit()`
>>> exit()
```

`type("55")` returns <class 'str'>

#### System settings about float type

```python
import sys
sys.float_info
```

```bash
sys.float_info(max=1.7976931348623157e+308, ..., epsilon=2.220446049250313e-16, radix=2)
```


<h2 id="booleans">Booleans (bool)</h2>

- Represents True or False
    
- Note the uppercase first letter. 
    

**Examples:**

```python
type(True)   # <class 'bool'>
type(False)  # <class 'bool'>
```


<h2 id="casting">Type Casting (Changing Type)</h2>

<p>Examples of casting between types:</p>

<ul>
  <li><code>float(2)</code> → 2.0</li>
  <li><code>int(1.9)</code> → 1 <em>(info loss!)</em></li>
  <li><code>int("4")</code> → 4 <em>(works only if string is numeric)</em></li>
  <li><code>str(3)</code> → "3"</li>
  <li><code>int(True)</code> → 1</li>
  <li><code>bool(0)</code> → False</li>
  <li><code>float(False)</code> → 0.0</li>
</ul>

<h4>Invalid Examples</h4>
<pre><code>
int("abc")             # ValueError
int("1 or 2 people")   # ValueError
</code></pre>

<hr>

<h2 id="summary">Summary Table</h2>

<ul>
  <li><strong>42</strong> → int → Whole number</li>
  <li><strong>3.14</strong> → float → Real number</li>
  <li><strong>"hello"</strong> → str → Text</li>
  <li><strong>True</strong> → bool → Logical value</li>
  <li><strong>int("123")</strong> → int → If string is numeric</li>
</ul>

<hr>

<h2 id="complement">Complement</h2>

<h3>1. Should numbers be quoted?</h3>
<p>Yes, it changes everything. <code>"42"</code> is a string, <code>42</code> is an integer.</p>
<p>Also, precision affects memory: float16, float32, float64...</p>

<ul>
  <li><a href="https://pythonspeed.com/articles/float64-float32-precision/">Precision and float sizes</a></li>
  <li><a href="https://www.kaggle.com/code/arjanso/reducing-dataframe-memory-size-by-65">Reduce DataFrame memory usage</a></li>
</ul>

<h3>2. Built-in Types</h3>

<p>Python comes with built-in types such as:</p>

<ul>
  <li><strong>Numbers:</strong> int, float, complex, bool</li>
  <li><strong>Text:</strong> str</li>
  <li><strong>Sequences:</strong> list, tuple, range</li>
  <li><strong>Mapping:</strong> dict</li>
  <li><strong>Sets:</strong> set</li>
</ul>

<h3>3. Dynamic Typing</h3>

<p>Python is dynamically typed: the type of a variable can change at runtime.</p>

<pre><code>
b = "2.5"
print(type(b), b)  # <class 'str'>
b = float(b)
print(type(b), b)  # <class 'float'>
</code></pre>

<pre><code>
tuple([1, 2])  # Convert list to tuple
set([1, 2])    # Convert list to set
</code></pre>

<h3>4. Type Comparisons</h3>

<pre><code>
type("hello" == "world")  # bool
</code></pre>

<pre><code>
print(type(2.5) == type(3.5))      # True
print(type(3) == type(4.5))        # False
print(type(5.5) == type("5.5"))    # False
</code></pre>
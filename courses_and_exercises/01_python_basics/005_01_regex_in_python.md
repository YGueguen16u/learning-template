<h1>Regex in Python</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#metacharacters">Metacharacters</a></li>
    <li><a href="#flags">Flags</a></li>
    <li><a href="#special-sequences">Special Sequences</a></li>
    <li><a href="#sets">Sets</a></li>
    <li><a href="#functions-and-methods-to-know">Functions and Methods to know</a></li>
        <ul>
            <li><a href="#search">1. re.search(pattern, s1)</a></li>
            <li><a href="#findall">2. re.findall(pattern, s1)</a></li>
            <li><a href="#split">4. re.split(pattern, s1)</a></li>
            <li><a href="#sub">5. re.sub(pattern, replacement, s, flags)</a></li>
        </ul>
    <li><a href="#exercises">Exercises</a></li>
  </ul> 
</div>

In Python, RegEx (short for Regular Expression) is a tool for matching and handling strings.

This RegEx module provides several functions for working with regular expressions, including <code>search, split, findall, sub</code>.

Python provides a **built-in module** called **`re`**, which allows you to work with regular expressions.

```python
import re
```

**Pro Tip:** Use raw strings (`r"..."`) when writing regex in Python to avoid escaping backslashes.
```python
pattern = r"he.*o"
```

<h2 id="metacharacters">Metacharacters</h2>


| Character | Description                          | Example     |
|-----------|--------------------------------------|-------------|
| `[]`      | A set of characters                  | `[a-m]`     |
| `\`       | Special sequence or escape character | `\d`        |
| `.`       | Any character (except newline)       | `he..o`     |
| `^`       | Starts with                          | `^hello`    |
| `$`       | Ends with                            | `planet$`   |
| `*`       | 0 or more occurrences                | `he.*o`     |
| `+`       | 1 or more occurrences                | `he.+o`     |
| `?`       | 0 or 1 occurrence                    | `he.?o`     |
| `{}`      | Exactly N occurrences                | `he.{2}o`   |
| `|`       | Either or                            | `falls|stays` |
| `()`      | Capture and group                    |             |


<h2 id="flags">Flags</h2>

| Flag         | Shorthand | Description                                               |
|--------------|-----------|-----------------------------------------------------------|
| `re.ASCII`   | `re.A`    | ASCII-only matching                                       |
| `re.DEBUG`   |           | Print debug information                                  |
| `re.DOTALL`  | `re.S`    | `.` matches newline too                                   |
| `re.IGNORECASE` | `re.I` | Case-insensitive matching                                 |
| `re.MULTILINE` | `re.M`  | `^` and `$` match start/end of each line                 |
| `re.NOFLAG`  |           | No flags                                                  |
| `re.UNICODE` | `re.U`    | Unicode matching (default in Python 3)                    |
| `re.VERBOSE` | `re.X`    | Allow comments and whitespace in regex                    |

<h2 id="special-sequences">Special Sequences</h2>

| Sequence | Description                                                                  | Example        |
|----------|------------------------------------------------------------------------------|----------------|
| `\A`     | Match if at beginning of string                                              | `\AThe`        |
| `\b`     | Match at beginning or end of a word (raw string needed)                      | `r"\bain"`     |
| `\B`     | Match NOT at the start/end of a word                                         | `r"\Bain"`     |
| `\d`     | Match any digit (0–9)                                                        | `\d`           |
| `\D`     | Match any non-digit                                                          | `\D`           |
| `\s`     | Match any whitespace character                                               | `\s`           |
| `\S`     | Match any non-whitespace character                                           | `\S`           |
| `\w`     | Match any word character (a–z, A–Z, 0–9, _)                                  | `\w`           |
| `\W`     | Match any non-word character                                                 | `\W`           |
| `\Z`     | Match if at end of string                                                    | `Spain\Z`      |

<h2 id="sets">Sets</h2>

| Set           | Description                                                      |
|---------------|------------------------------------------------------------------|
| `[arn]`       | Match if one of a, r, or n                                       |
| `[a-n]`       | Match any lowercase letter from a to n                           |
| `[^arn]`      | Match any character except a, r, or n                            |
| `[0123]`      | Match any one of 0, 1, 2, or 3                                   |
| `[0-9]`       | Match any digit                                                  |
| `[0-5][0-9]`  | Match any two-digit number from 00 to 59                         |
| `[a-zA-Z]`    | Match any letter (uppercase or lowercase)                        |
| `[+]`         | In sets, `+` is treated literally (same for `*`, `.`, etc.)      |


<h2 id="functions-and-methods-to-know">Functions and Methods to know</h2>

<h3 id="search">1. re.search(pattern, s1)</h3>

- The search() function searches for specified patterns within a string. 
- Returns the first match it finds.

```python
pattern = r"he.*o"
text = "Hello, world!"
match = re.search(pattern, text)
if match:
	print("Match found!")
else:
	print("Match not found.")

pattern = r"\d\d\d\d\d\d\d\d\d\d" # Matches any ten consecutive digits
text = "My Phone number is 1234567890"
match = re.search(pattern, text)
if match:
	print("Phone number found:", match.group())
else:
	print("No match")
```


<h3 id="findall">2. re.findall(pattern, s1)</h3>

The `findall()` function finds all occurrences of a specified pattern within a string **in a list**.

```python
s2 = "Michael Jackson was a singer and known as the 'King of Pop'"
# Use the findall() function to find all occurrences of the "as" in the string
result = re.findall("as", s2)
# Print out the list of matched words
print(result)

pattern = r"\W" # Matches any non-word character
text = "Hello, world!"
matches = re.findall(pattern, text)
print("Matches:", matches) # Matches: [',', ' ', '!']
```

<h3 id="split">4. re.split(pattern, s1)</h3>

A regular expression's `split()` function splits a string into an array of substrings based on a specified pattern.

```python
pattern = r"\s" # Matches any whitespace character
text = "Hello, world!"
matches = re.split(pattern, text)
print("Matches:", matches) # Matches: ['Hello', 'world!']
```

<h3 id="sub">5. re.sub(pattern, replacement, s, flags)</h3>

The `sub` function of a regular expression in Python is used to replace all occurrences of a pattern in a string with a specified replacement.

```python
pattern = r"he.{2}o"
replacement = "hi"
text = "Hello, world!"
matches = re.sub(pattern, replacement, text, flags=re.IGNORECASE)
print("Matches:", matches) # Matches: 'hi, world!'
```


<h2 id="lookaround">Lookaround (Lookahead & Lookbehind)</h2>

**Lookarounds** allow you to check for patterns that come **before** or **after** a match, **without including** them in the match itself.

They are useful when you want to **match something only if it's surrounded by a certain context**.


#### **Types of Lookaround**

| Syntax        | Type                  | Meaning                                  |
|---------------|-----------------------|------------------------------------------|
| `(?=...)`     | Positive lookahead     | Must be followed by `...`               |
| `(?!...)`     | Negative lookahead     | Must **not** be followed by `...`       |
| `(?<=...)`    | Positive lookbehind    | Must be preceded by `...`               |
| `(?<!...)`    | Negative lookbehind    | Must **not** be preceded by `...`       |

---

#### **Example 1: Words following a `#` symbol**

```python
import re

text = "Today I feel #grateful and #motivated!"
pattern = r"(?<=#)\w+"
print(re.findall(pattern, text))
# Output: ['grateful', 'motivated']
``` 

#### **Example 2: Vowels between consonants**

```python
import re

s = "rabcdeefgyYhFjkIoomnpOeorteeeeet"
pattern = r"(?<=[^aeiouAEIOU])([aeiouAEIOU]{2,})(?=[^aeiouAEIOU])"
print(re.findall(pattern, s))
# Output: ['ee', 'Ioo', 'Oeo', 'eeeee']
```
**Goal of This Code**

We want to **find and extract all substrings** that:

1. Contain **only vowels** (`a, e, i, o, u` in upper or lower case),
2. Are **at least two vowels long**,
3. Are **surrounded by consonants** on both sides (i.e., the character before and after the vowel sequence must not be a vowel).

**How It Works**

Let’s break down the regular expression:

- `(?<=[^aeiouAEIOU])`

  * This is a **positive lookbehind**.
  * It checks that **before the vowel sequence**, there is **a non-vowel character** (i.e., a consonant).
  * It does **not** include that character in the match.

- `([aeiouAEIOU]{2,})`

  * This is the **main pattern we want to extract**.
  * It matches **2 or more consecutive vowels**.

- `(?=[^aeiouAEIOU])`

  * This is a **positive lookahead**.
  * It checks that **after the vowel sequence**, there is **a non-vowel character** (i.e., another consonant).

**Example with This Input**

```python
s = "rabcdeefgyYhFjkIoomnpOeorteeeeet"
```

In this string, the following substrings match the pattern:

* `'ee'` — between `'d'` and `'f'`
* `'Ioo'` — between `'k'` and `'m'`
* `'Oeo'` — between `'p'` and `'r'`
* `'eeeee'` — between `'t'` and `'t'`

**Output**

```python
['ee', 'Ioo', 'Oeo', 'eeeee']
```


> 💡 **Tip:** Lookarounds act like invisible guards — they check the surrounding pattern but don’t include it in the result.


<h2 id="exercises">Exercises</h2>

<h3>Exercise 1</h3>

- Find all characters from 'a' to 'm' in the string "HËllo, wÔrld!"

```python
pattern = r"[a-m]"
text = "HËllo, wÔrld!"
matches = re.findall(pattern, text, re.ASCII)
print(matches) # ['l', 'l', 'o', 'l', 'l', 'o']
```

<h3>Exercise 2</h3>

- Find all digits in the string "Hello, 123, world!"

```python
pattern_2 = r"\d" # Matches any digit
text_2 = "Hello, 123, world!"
matches_2 = re.findall(pattern_2, text_2)
print(matches_2) # ['1', '2', '3']
```

<h3>Exercise 3</h3>

- Find all characters in the string "Hello, world!"

```python
pattern_3 = r"." # Matches any character (except newline)
text_3 = "Hello, world!"
matches_3 = re.findall(pattern_3, text_3)
print(matches_3) # ['H', 'e', 'l', 'l', 'o', ',', ' ', 'w', 'o', 'r', 'l', 'd', '!']    
```

<h3>Exercise 4</h3>

- Find all characters in the string "Hello, world!" that start with 'hello'

```python
pattern_4 = r"^hello" # Starts with 'hello'
text_4 = "Hello, world!".lower()
matches_4 = re.findall(pattern_4, text_4)
print(matches_4) # ['hello']
```

<h3>Exercise 5</h3>

- Find all characters in the string "Hello, world!" that end with 'hello'

```python
pattern_5 = r"hello$" # Ends with 'hello'
text_5 = "Hello, world!".lower()
matches_5 = re.findall(pattern_5, text_5)
print(matches_5) # ['hello']
```

<h3>Exercise 6</h3>

- Find all characters in the string "Hello, world!" with 0 or more occurrences between 'he' and 'o'

```python
pattern_6 = r"he.*o" # 0 or more occurrences
text_6 = "Hello, world!".lower()
matches_6 = re.findall(pattern_6, text_6)
print(matches_6) # ['hello, wo']
```

<h3>Exercise 7</h3>

- Find all characters in the string "Hello, world!" with 0 or 1 occurrence between 'he' and 'o'

```python
pattern_7 = r"he.?o" # 0 or 1 occurrence
text_7 = "Helo, world!".lower()
matches_7 = re.findall(pattern_7, text_7)
print(matches_7) # ['helo']
```

<h3>Exercise 8</h3>

- Find all characters in the string "Hello, world!" with exactly 3 occurrences between 'he' and 'o' 

```python
pattern_8 = r"he.{3}o" # Exactly N occurrences
text_8 = "Helllo, world!".lower()
matches_8 = re.findall(pattern_8, text_8)
print(matches_8) # ['helllo']
```

<h3>Exercise 9</h3>

- Check if the string has other characters than a, r, or n in "Is there rain today?":

```python
pattern_9 = r"[^arn]" # Matches any character except a, r, or n
text_9 = "Is there rain today?"
matches_9 = re.search(pattern_9, text_9)
matches_9_bis = re.findall(pattern_9, text_9)
if matches_9:  
    print("Match found!")
else:
    print("Match not found.")
print(matches_9_bis) # ['I', 's', ' ', 't', 'h', 'e', 'e', ' ', 'i', ' ', 't', 'o', 'd', 'y', '?']
```



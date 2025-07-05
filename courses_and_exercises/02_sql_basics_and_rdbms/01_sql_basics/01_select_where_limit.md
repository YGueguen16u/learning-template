<h1>SELECT, WHERE, LIMIT</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#select">SELECT</a></li>
    <li><a href="#where">WHERE</a></li>
    <li><a href="#limit">LIMIT</a></li>
    <li><a href="#exercises">Exercises</a></li>
  </ul>
</div>

<hr>

<h2 id="preamble">Preamble</h2>

Table example for this course:

https://selectstarsql.com/frontmatter.html

<h2 id="select">SELECT</h2>

**General syntax**

```sql
SELECT <column1>, <column2>, ... FROM <table_name>

SELECT * FROM <table_name>
```

**Example**
```sql
SELECT *
FROM executions
LIMIT 3
```

| First Name         | Last Name   | Execution # | Age | Execution Date | County | Last Statement                                                                                                                                                     |
|--------------------|-------------|-------------|-----|----------------|--------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Christopher Anthony| Young       | 553         | 34  | 2018-07-17     | Bexar  | I want to make sure the Patel family knows I love them like they love me. Make sure the kids in the world know I'm being executed and those kids I've been mentoring keep this fight going. I'm good Warden. |
| Danny Paul         | Bible       | 552         | 66  | 2018-06-27     | Harris | *null*                                                                                                                                                              |
| Juan Edward        | Castillo    | 551         | 37  | 2018-05-16     | Bexar  | To everyone that has been there for me you know who you are. Love y'all. See y'all on the other side. That's it.                                                   |

```sql
SELECT first_name, last_name
FROM executions
LIMIT 3
```

|first_name|last_name|
|---|---|
|Christopher Anthony|Young|
|Danny Paul|Bible|
|Juan Edward|Castillo|

```sql
SELECT 50 + 2, 51 * 2, 51 / 2
```

|50 + 2|51 * 2|51 / 2|
|---|---|---|
|52|102|25|

Isn’t it strange that `51 / 2` gives `25` rather than `25.5`? This is because SQL is doing integer division. To do decimal division, at least one of the operands must be a decimal, for instance `51.0 / 2`. A common trick is to multiply one number by `1.0` to convert it into a decimal.

## The WHERE Block

The `WHERE` block allows us to filter the table for rows that meet certain conditions. 

Its format is `WHERE <clause>` and it always goes after the `FROM` block. 

Refering to a Boolean statement that the computer can evaluate to be true or false like `ex_number = 145`.

**General syntax**

```sql
SELECT <column1>, <column2>, ... FROM <table_name> WHERE <clause>
```

**Example**

```sql
SELECT first_name, last_name, ex_age
FROM executions
WHERE ex_age <= 25
```

|first_name|last_name|ex_age|
|---|---|---|
|Toronto|Patterson|24|
|T.J.|Jones|25|
|Napoleon|Beazley|25|
|Richard|Andrade|25|
|Jay|Pinkerton|24|
|Jesse|De La Rosa|24|


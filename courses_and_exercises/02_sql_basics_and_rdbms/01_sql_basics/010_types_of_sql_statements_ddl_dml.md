<h1>Types of SQL statements: DDL vs. DML</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#introduction_to_sql_statement_categories">Introduction to SQL Statement Categories</a></li>
    <li><a href="#data_definition_language_ddl">Data Definition Language (DDL)</a></li>
    <li><a href="#data_manipulation_language_dml">Data Manipulation Language (DML)</a></li>
  </ul>
</div>

<h2 id="introduction_to_sql_statement_categories">Introduction to SQL Statement Categories</h2>

Structured Query Language (SQL) is the standard language used for interacting with relational databases. It enables users to define, access, and manipulate data stored in entities (tables), their attributes (columns), and the tuples (rows) that hold actual data values.

SQL statements are broadly categorized into two main groups:
1. Data Definition Language (DDL)
2. Data Manipulation Language (DML)


<h2 id="data_definition_language_ddl">Data Definition Language (DDL)</h2>

DDL statements are responsible for defining, modifying, and removing database schema objects, such as tables, views, and indexes. These operations typically affect the structure of the database rather than the data it contains.

Common DDL Statements:
1. CREATE 

Used to create new database objects such as tables, and to define the attributes (columns) within them.
Example:

```sql
CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    PublishedYear INT
);
```

2. ALTER

Modifies the structure of an existing table, such as adding or removing columns, or changing data types.
Example:

```sql
ALTER TABLE Book ADD Author VARCHAR(100);
```

3. TRUNCATE

Deletes all rows in a table, but retains the table structure for future use.
Note: This operation is more efficient than DELETE for large datasets, but cannot be rolled back in most systems.

4. DROP

Completely removes a table and its structure from the database.
Example:

```sql
DROP TABLE Book;
```


<h2 id="data_manipulation_language_dml">Data Manipulation Language (DML)</h2>

DML statements are used to retrieve, insert, update, and delete data within existing tables. These operations directly affect the contents of the database without altering its structural definitions.

DML operations are often referred to by the acronym CRUD, which stands for Create, Read, Update, and Delete.

Common DML Statements:

1. INSERT

Adds new rows of data into a table.
Example:

```sql
INSERT INTO Book (BookID, Title, PublishedYear)
VALUES (1, 'Database Systems', 2020);
```

2. SELECT

Retrieves data from one or more tables. It can be used with filtering and sorting clauses.
Example:

```sql
SELECT Title, PublishedYear FROM Book;
```

3. UPDATE

Modifies existing data within one or more rows.
Example:

```sql
UPDATE Book SET PublishedYear = 2021 WHERE BookID = 1;
```


4. DELETE

Removes specific rows of data from a table.
Example:

```sql
DELETE FROM Book WHERE BookID = 1;
```



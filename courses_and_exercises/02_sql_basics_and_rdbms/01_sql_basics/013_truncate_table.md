<h1>Truncate Table</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#truncate_table">TRUNCATE TABLE</a></li>
  </ul>
</div>


<h2 id="preamble">Preamble</h2>

To run the file, write in the terminal:

```bash
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/009_alter_table.sql
```

Always take care of the path of the file, where directory you are.

<h2 id="truncate_table">TRUNCATE TABLE</h2>

`TRUNCATE TABLE` statement is used to remove all rows from a table.

General syntax:

```sql
TRUNCATE TABLE <table_name>;
```

- `<table_name>` : Name of the table to be truncated

Examples:

```sql
TRUNCATE TABLE EquipmentEvents;
```



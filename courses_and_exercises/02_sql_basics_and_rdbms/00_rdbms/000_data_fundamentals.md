# Introduction to Data Fundamentals

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
    <ul>
        <li><a href="#types-of-data-structures">Types of Data Structures</a>
        </li>
        <li><a href="#data-formats-for-exchange">Data Formats for Exchange</a>
        </li>
        <li><a href="#data-repositories-and-storage-systems">Data Repositories and Storage Systems</a>
        </li>
    </ul>
</div>

<hr>

The term data refers to raw, unprocessed facts or observations that acquire significance through contextualization and analysis. These may include numbers, characters, symbols, text, images, or combinations thereof. The way data is structured plays a critical role in its storage, processing, and analysis. Accordingly, data is commonly classified into three main categories: structured, unstructured, and semi-structured.


<h2 id="types-of-data-structures">Types of Data Structures</h2>

### 1. Structured Data

Structured data is highly organized and adheres to a predefined schema, typically stored in tabular formats consisting of rows and columns. This format facilitates efficient querying, storage, and data integrity.

Examples include:
- Excel spreadsheets, where data is arranged in cells, each uniquely identifiable by a row and column index.
- SQL databases (e.g., MySQL, PostgreSQL), where data resides in predefined tables with strict column types.
- Online forms, which capture user information in designated fields (e.g., name, email, credit card number).

### 2. Unstructured Data

Unstructured data lacks a fixed schema or recognizable format, making it difficult to store and analyze using traditional relational tools.

Examples include:
- Plain text files, which may contain narratives, logs, or notes without a predefined structure.
- Multimedia files such as images, videos, and audio recordings.
- Web content, including social media posts and web pages that mix textual, visual, and embedded media.
- Social media data, comprising heterogeneous formats such as posts, comments, and hyperlinks.

### 3. Semi-Structured Data

Semi-structured data contains tags or markers to separate data elements, offering some organizational hierarchy without enforcing a strict tabular schema.

Examples include:
- JSON (JavaScript Object Notation) files, using key-value pairs and nested structures.
- XML (eXtensible Markup Language) documents, which use user-defined tags and attributes.
- Email messages, which have structured metadata (e.g., sender, subject) and unstructured message content.



<h2 id="data-formats-for-exchange">Data Formats for Exchange</h2>

In practice, data is often exchanged between systems via standardized formats. Common formats include:
- Delimited Text Files: Data values are separated by specific delimiters (e.g., commas or tabs). Examples: CSV (Comma-Separated Values) and TSV (Tab-Separated Values).
- Spreadsheets: Used for storing and visualizing data in a matrix format, often created in tools like Microsoft Excel or Google Sheets.
- Markup and Serialization Formats: Formats such as XML and JSON, which enable the hierarchical organization and web-friendly transfer of data structures.


<h2 id="data-repositories-and-storage-systems">Data Repositories and Storage Systems</h2>

Effective data management requires the use of appropriate storage systems, collectively referred to as data repositories. These systems allow centralized storage, indexing, and retrieval of data for operational or analytical purposes. Data repositories can broadly be divided into relational and non-relational database systems.

### 1. Relational Databases

Relational databases store structured data in interrelated tables. These systems enforce consistency and integrity through normalization and are managed by Relational Database Management Systems (RDBMS).

Examples include:
- Microsoft SQL Server
- Oracle Database
- MySQL / MariaDb
- PostgreSQL
- SQLite

Relational databases are commonly employed in Online Transaction Processing (OLTP) systems, supporting day-to-day business operations such as:
- Customer transactions
- Inventory tracking
- Human resources management

Their primary strengths lie in supporting concurrent access, enforcing ACID properties, and providing efficient transaction management.

### 2. Analytical Systems and OLAP

For analytical purposes, Online Analytical Processing (OLAP) systems are employed. These systems can utilize both relational and non-relational architectures, including:
- Data warehouses
- Data lakes
- Big data platforms

OLAP systems enable businesses to perform complex queries over large datasets, generating strategic insights such as sales forecasts or customer segmentation analyses.

### 3. Non-Relational Databases

Also known as NoSQL databases, these systems are optimized for flexible data modeling and scale-out architectures. They are particularly useful for storing semi-structured and unstructured data.

Examples include:
- MongoDB: A document-oriented database suitable for hierarchical data (e.g., JSON documents).
- Cassandra: A wide-column store optimized for high availability and scalability.
- Redis: An in-memory key-value store useful for caching and real-time analytics.

Non-relational databases are preferred in contexts where the data structure is dynamic or heterogeneous, such as IoT platforms, content management systems, and large-scale user applications.

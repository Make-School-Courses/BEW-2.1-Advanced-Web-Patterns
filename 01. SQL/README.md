# SQL

## Objectives

  * List the various features of a SQL database: e.g. Tables, Indexes, Migrations, and Joins
  * 

## Background

Pronouncd: "ess-que-el" or "sequel" - SQL is the language used with table-based, relational databases such as MySQL, SQLite, and PostgreSQL.

SQL was initially developed at IBM by Donald D. Chamberlin and Raymond F. Boyce in the early 1970s. This version, initially called SEQUEL (Structured English Query Language).

"SQL is a domain-specific language used in programming and designed for managing data held in a relational database management system. [SQL -Wikipedia](https://en.wikipedia.org/wiki/SQL)

SQL is incredibly powerful. It can be used to write virtually any query you can think of, as long as you have the data. 

## Why Learn SQL?

SQL/Relational databases are enormously prevalent, more common in fact than Schemaless/NoSQL/Document-based databases, and SQL is the language you use to communicate with virtually any relational database. 

Even stacks that use noSQL databases operationally, will often still maintain a SQL database for reporting purposes bc it is so fast and reliable.

Let's look at some of the simplest SQL commands.

### The Schema

A SQL database is different from a NoSQL database primarily in that it has a schema that we have to build before we can save data to it.

![schema](assets/schema.png)

### Indexes

Another feature of SQL databases is the definition of **indexes** to speed up queries.

Read this [StackOverflow question](https://stackoverflow.com/questions/2955459/what-is-an-index-in-sql) to get a better idea of what a SQL index is.

### Basic SQL Commands

1. Read the data  --  **SELECT**
1. Insert new data  --  **INSERT**
1. Update existing data  --  **UPDATE**
1. Remove data  --  **DELETE**

What does this remind you of...? (CRUD!)

### SELECT

```sql
SELECT column-names
FROM table-name
WHERE condition
ORDER BY sort-order
```

```sql
SELECT FirstName, LastName, City, Country 
FROM Customer
WHERE City = 'Paris'
ORDER BY LastName
```

### INSERT

```sql
INSERT table-name (column-names)
VALUES (column-values)
```

```sql
INSERT Supplier (Name, ContactName, City, Country)
VALUES ('Oxford Trading', 'Ian Smith', 'Oxford', 'UK')
```

### UPDATE

```sql
UPDATE table-name
SET column-name = column-value
WHERE condition
```

```sql
UPDATE OrderItem
SET Quantity = 2
WHERE Id = 388
```

### DELETE

```sql
DELETE table-name
WHERE condition
```

```sql
DELETE Customer
WHERE Email = 'alex@gmail.com'
```

### Advanced Queries - JOIN (FYI)

SQL has many advanced query commands, but for our purposes we are just going to focus on one: the JOIN and its variants.

**Types of Joins**

1. (INNER) JOIN: Select records that have matching values in both tables.
1. LEFT (OUTER) JOIN: Select records from the first (left-most) table with matching right table records.
1. RIGHT (OUTER) JOIN: Select records from the second (right-most) table with matching left table records.
1. FULL (OUTER) JOIN: Selects all records that match either left or right table records.

![sql-joins](assets/sql-joins.png)

**JOIN Examples**

```sql
-- List all orders with customer information 

SELECT OrderNumber, TotalAmount, FirstName, LastName, City, Country
  FROM [Order] JOIN Customer
    ON [Order].CustomerId = Customer.Id
```

```sql
-- List all orders with product names, quantities, and prices 

SELECT O.OrderNumber, CONVERT(date,O.OrderDate) AS Date, 
       P.ProductName, I.Quantity, I.UnitPrice 
  FROM [Order] O 
  JOIN OrderItem I ON O.Id = I.OrderId 
  JOIN Product P ON P.Id = I.ProductId
ORDER BY O.OrderNumber
```

## SQL Challenges

1. Examine the do-factory sample database and schema code in the `sample db` folder. Can you identify what each part of the files do?
1. Use dofactory's [SQL Sandbox](http://www.dofactory.com/sql/sandbox) to run the example JOIN queries. 
1. With a partner construct your own simple queries and run them in the SQL Sandbox.
1. Write SQL queries for the psuedocode in `bank.sql` file.
1. Now construct your own JOIN query and run it in the sandbox.
1. Review the types of Joins. With a partner come up with one hypothetical query (in English/psuedocode) that exemplifies each one. Share your queries with another two pairs.

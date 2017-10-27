# SQL

## Objectives

  * List the various features of a SQL database: e.g. Tables, Indexes, Migrations, and Joins
  * Compare and Contrast SQL/Relational/Table-based and NoSQL/Schemaless/Document-based databases
  * Write the SQL to create tables, columns, and rows
  * Write basic SQL queries

## Background

Pronouncd: "ess-que-el" or "sequel" - SQL is the language used with table-based, relational databases such as MySQL, SQLite, and PostgreSQL.

SQL was initially developed at IBM by Donald D. Chamberlin and Raymond F. Boyce in the early 1970s. This version, initially called SEQUEL (Structured English Query Language).

"SQL is a domain-specific language used in programming and designed for managing data held in a relational database management system. [SQL -Wikipedia](https://en.wikipedia.org/wiki/SQL)

SQL is incredibly powerful. It can be used to write virtually any query you can think of, as long as you have the data. 

## Tabular

All the data in a relational or SQL database is tabular, like an excel spreadsheet:

| id | name  | email | age |
| -- | ----  | ------| ------ |
| 1  | Bob   | bob@bob.com  | 34  |
| 2  | Sally | sally@sally.com  | 87  |
| 3  | Nick | nick@nick.com  | 20  |

## Why Learn SQL?

SQL/Relational databases are enormously prevalent, more common in fact than Schemaless/NoSQL/Document-based databases, and SQL is the language you use to communicate with virtually any relational database. 

Even stacks that use noSQL databases operationally, will often still maintain a SQL database for reporting purposes bc it is so fast and reliable.

Let's look at some of the simplest SQL commands.

### The Schema

A SQL database is different from a NoSQL database primarily in that it has a schema that we have to build before we can save data to it.

![schema](assets/sql-model.jpg)

## Indexes

Another feature of SQL databases is the definition of **indexes** to speed up queries. Databases uses data structures like B-Trees to make column values fast to look up.

Think of the index of a book, an alphabetical list of names, subjects, etc., with references to the places where they occur, typically found at the end of a book. That is sort of what an index is in a SQL database. 

When you set an index, e.g. on a `email` column on a user table, you tell the database to keep track of the order of every email address so later you can look up records by the email address very quickly.

## Common SQL Commands

1. Read the data  --  **SELECT**
1. Insert new data  --  **INSERT**
1. Update existing data  --  **UPDATE**
1. Remove data  --  **DELETE**

  What do these four remind you of...? (CRUD!)

1. Filter data -- **WHERE**
1. Designate which table you want to use -- **FROM**
1. Sort or order data -- **ORDER BY**
1. Set column values -- **VALUES, SET**

### SELECT, FROM, WHERE, ORDER BY

```sql
SELECT column-names
FROM table-name
WHERE condition
ORDER BY sort-order
```

e.g. 

```sql
SELECT FirstName, LastName, City, Country 
FROM Customer
WHERE City = 'Paris'
ORDER BY LastName
```

### INSERT, VALUES

```sql
INSERT table-name (column-names)
VALUES (column-values)
```

e.g.

```sql
INSERT Supplier (Name, ContactName, City, Country)
VALUES ('Oxford Trading', 'Ian Smith', 'Oxford', 'UK')
```

### UPDATE, SET

```sql
UPDATE table-name
SET column-name = column-value
WHERE condition
```

e.g.

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

e.g.

```sql
DELETE Customer
WHERE Email = 'alex@gmail.com'
```

### Joins - `JOIN`

Generally when people try to explain joins they show you venn diagrams, but this is rather confusing and inaccurate. In fact A JOIN is really a cartesian product (also cross product) with a filter. A [Cartesian product](https://en.wikipedia.org/wiki/Cartesian_product#A_deck_of_cards) is a mathematical operation that returns a set (or product set or simply product) from multiple sets. That is, for sets A and B, the Cartesian product A × B is the set of all ordered pairs (a, b) where a ∈ A and b ∈ B. Products can be specified using set-builder notation, e.g.

Reference: [Say "No" to Venn Diagrams When Explaining Joins](https://blog.jooq.org/2016/07/05/say-no-to-venn-diagrams-when-explaining-joins/)

**Types of Joins**

1. CROSS JOIN: In a cross join is just taking every item on the left side, and combines it with every item on the right side.

  ![CROSS JOIN](https://lukaseder.files.wordpress.com/2016/07/venn-cross-join1.png?w=662&h=497&zoom=2)

1. (INNER) JOIN: In plain text, an INNER JOIN is a CROSS JOIN in which only those combinations are retained which fulfil a given predicate. For instance:

  ```sql
  -- "Classic" ANSI JOIN syntax
  SELECT *
  FROM author a
  JOIN book b ON a.author_id = b.author_id

  -- "Nice" ANSI JOIN syntax
  SELECT *
  FROM author a
  JOIN book b USING (author_id)

  -- "Old" syntax using a "CROSS JOIN"
  SELECT *
  FROM author a, book b
  WHERE a.author_id = b.author_id
  ```

  ![INNER JOIN](https://lukaseder.files.wordpress.com/2016/07/venn-join1.png?w=662&h=496&zoom=2)

1. OUTER JOIN: OUTER JOIN types help where we want to retain those rows from either the LEFT side or the RIGHT or both (FULL) sides, for which there was no matching row where the predicate yielded true. 

  ```sql
  SELECT *
  FROM author a
  LEFT JOIN book b USING (author_id)
  ```
  e.g. This query will produce all the authors and their books, but if an author doesn’t have any book, we still want to get the author with NULL as their only book value

**Creating a JOIN example**

```sql
create index IndexCustomerName on Customer (
LastName ASC,
FirstName ASC
)
go
```

**JOIN Examples**

```sql
-- List all orders with customer information 

SELECT OrderNumber, TotalAmount, FirstName, LastName, City, Country
  FROM [Order] JOIN Customer
    ON [Order].CustomerId = Customer.Id
```

e.g.

```sql
-- List all orders with product names, quantities, and prices 

SELECT O.OrderNumber, CONVERT(date,O.OrderDate) AS Date, 
       P.ProductName, I.Quantity, I.UnitPrice 
  FROM [Order] O 
  JOIN OrderItem I ON O.Id = I.OrderId 
  JOIN Product P ON P.Id = I.ProductId
ORDER BY O.OrderNumber
```

## SQL Challenges - todofactory

1. Examine the database and schema code in the `sample db` folder. Can you identify what each part of the files do?
1. With a partner construct 5 of your own simple queries for the dofactory sandbox and run them. For reference for this schema scroll up to the image above or look at [this page](http://www.dofactory.com/sql/tutorial) of their tutorial e.g:
  
  - Return all customers: `SELECT * from Customer`
  - Return all orders: `SELECT * from Order`

1. Use dofactory's [SQL Sandbox](http://www.dofactory.com/sql/sandbox) to run the example JOIN queries. 

## Strech Challenges

1. Watch this great [TED talk on data visualization](https://www.ted.com/talks/david_mccandless_the_beauty_of_data_visualization)
1. Construct 3 JOIN queries for the dofactory sql sandbox and run it.
1. Review the types of Joins. With a partner come up with one hypothetical query (in English/psuedocode) that exemplifies each one. Share your queries with another two pairs.

## Extra Stretch

1. Write SQL queries for the psuedocode in `bank.sql` file.

# Simple Search & Pagination

## Competencies & Objectives

* Implement Simple Search
* Implement Pagination 

![autocomplete](autocomplete.gif)

In a project you might want to add a **Search Form** or an **Autocomplete** dropdown. In either case, you'll probably want to use the advanced web pattern or recipe called **Simple Search**.

> A Simple Search is a search based on the text of one or a few attributes, e.g. on words in a title or body of articles or comments.

We're going to look at an implementation of Simple Search for Mongoose using Regex's. (The SQL implementation uses the SQL operator `LIKE`.)

Once we can search, we are going to paginate the responses.

## Simple Search

### Sequelize

In order to conduct a simple search, we will use Sequelize's [query operators](http://docs.sequelizejs.com/manual/tutorial/querying.html#operators) `$like` or `$iLike` (PG only). These are basically equivalent except `$iLike` is case insensitive and for Postgres databases only.

### Mongoose

For mongoose, we can search by passing a Regex (regular expression) for the term we want to search for.

```js
User.find({ name: /john/i }, (err, docs) => { });
```

Remember to use the `RegExp` object in JavaScript to turn a string into a Regex pattern.

```js
regex = new RegExp(`/${req.query.term}/i`);
User.find({ name: regex }, (err, docs) => { });
```

## Pagination

### Riddle

Which weighs more, a ton of bricks or a ton of feathers?

![feathers-bricks](feathers-bricks.jpg)

The solutions to problems in engineering are often simpler than we think.

What is the fastest way to speed up a query for 1,000,000,000 (1 Billion) records? Graph databases? Sharded decentralized databases? Quantum computers?

<details>
  <summary>
    The answer (do not click!)
  </summary>
  Use pagination to only return the first 20 records like .... Google does!
  <img src='google.png' />
</details>


If you look around almost every website is paginated. Why? Probably because pagination is **the easiest way to speed up many page loads**. If you are loading 1000 records on your index page, that will take 10 seconds to load. Pagination will speed it up by sending only the first 20 records.

### Activity: Picking a Pagination Module

1. Compare and contrast these modules, list their pros and cons, and decide which one you would use and why. (10 min)
  - [https://www.npmjs.com/package/paginate](paginate)
  - [https://www.npmjs.com/package/mongoose-paginate](mongoose-paginate)
  - [https://www.npmjs.com/package/express-paginate](express-paginate)

2. Now go to the table marked for each one and discuss with the people there why you chose to use this module.

3. Now split your table into thirds, one third stay at the table, the other two thirds go to another table and try to convince them to use your module.

4. Could you convince anyone to change? What arguments are the most compelling for people?  What arguments were most compelling to you?

## Extra Stretch: Find or Create

1. **Find or Create** - There is a common pattern in searching you might someday take advantage of where you allow people to search for something, and if it doesn't exist, create it. What would this look like?

1. **Autocomplete** - now that you know simple search, how would you roll your own autocomplete dropdown menu?

# Simple Search & Pagination

## Introduction

In a project you might want to do a simple search for example on words in a title or body of articles or comments. We're going to look at an implementation for Mongoose - the Mongoose implementation is based on Regex's, a SQL implementation uses the SQL operator `LIKE`.

Once we can search, we are going to paginate the responses. One of the quickest ways to speed up response times on pages that are loading a lot of records is pagination.

A great example of pagination is Google's search results. At the bottom it says "Gooooooooooooooogle" and each "o" is another page of search results.

## Simple Search



In order to conduct a simple search, we will use Sequelize's [query operators](http://docs.sequelizejs.com/manual/tutorial/querying.html#operators) $like or $iLike (PG only). These are basically equivalent except $iLike is case insensitive and for Postgres databases only.

## Pagination

If you look around almost every website is paginated. Why? Probably because pagination is **the easiest way to speed up many page loads**. If you are loading 1000 records on your index page, that will take 10 seconds to load. Pagination will speed it up by sending only the first 20 records.

### Picking a Pagination Module

Compare and contrast these modules, and list their pros and cons. Now pick one that you would use. Join the other people who chose the same as you.

[https://www.npmjs.com/package/paginate](paginate)

[https://www.npmjs.com/package/mongoose-paginate](mongoose-paginate)

[https://www.npmjs.com/package/express-paginate](express-paginate)

## Challenges - Pagination

1. Using one of these modules (or another) add pagination to your Proud Pete's Pet Emporium search results.

## Extra Stretch: Find or Create

1. **Find or Create** - There is a common pattern in searching you might someday take advantage of where you allow people to search for something, and if it doesn't exist, create it. What would this look like?
1. **Autocomplete** - now that you know simple search, how would you roll your own autocomplete dropdown menu?

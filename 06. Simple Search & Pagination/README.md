# Simple Search & Pagination 

## Introduction

In a project you might want to do a simple search for example on words in a title or body of articles or comments. We're going to look at an implementation for Mongoose and Sequelize.js - the Mongoose implementation is based on Regex's, and the Sequelize.js implementation uses the SQL operator `LIKE`. 

Once we can search, we are going to paginate the responses. One of the quickest ways to speed up response times on pages that are loading a lot of records is pagination.

A great example of pagination is Google's search results. At the bottom it says "Gooooooooooooooogle" and each "o" is another 


## Challenges - Simple Search

1. (Sequelize) - 

	```js

	Post.findAll({
	  where: { ["title LIKE ? or name = ?", "new%", "test"] }
	});
	```

1. (Mongoose) - Follow along with this [excellent video by Ian Schoonover](https://www.youtube.com/watch?v=9_lKMTXVk64) to add search to one of your projects.


## Pagination - Picking a Module

Compare and contrast these modules, and list their pros and cons. Now pick one that you would use. Join the other people who chose the same as you. 

[https://www.npmjs.com/package/paginate](paginate)
[https://www.npmjs.com/package/mongoose-paginate](mongoose-paginate)
[https://www.npmjs.com/package/express-paginate](express-paginate)

## Challenges - Pagination

1. Using one of these modules (or another) add pagination to your project.

## Stretch Challenges

1. Roll your own pagination for your project.


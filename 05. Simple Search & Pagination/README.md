# Simple Search & Pagination

## Introduction

In a project you might want to do a simple search for example on words in a title or body of articles or comments. We're going to look at an implementation for Mongoose and Sequelize.js - the Mongoose implementation is based on Regex's, and the Sequelize.js implementation uses the SQL operator `LIKE`.

Once we can search, we are going to paginate the responses. One of the quickest ways to speed up response times on pages that are loading a lot of records is pagination.

A great example of pagination is Google's search results. At the bottom it says "Gooooooooooooooogle" and each "o" is another

## Simple Search

In order to conduct a simple search, we will use Sequelize's [query operators](http://docs.sequelizejs.com/manual/tutorial/querying.html#operators) $like or $iLike (PG only). These are basically equivalent except $iLike is case insensitive and for Postgres databases only.

### Challenges

1. As a class let's generate the step-by-step together for how we would add simple search to a project.
1. Solo, add simple search for the Famous Amos Pet Emporium. The search should be able to search by the pet's name to start, but remember people might search by species and breed too. For reference look at the [express-sequelize-blog](https://github.com/ajbraus/express-sequelize-blog). Here's an example of how you would ask for either the title or the body like the search term. Kinda verbose!

	```js
	// RAW SQL
	models.Post.findAll({
			where: {
					$or: [ {
						title: {
							$iLike: "%" + req.query.term + "%"
						}
					},
					{
						body: {
							$iLike: "%" + req.query.term + "%"
						}
					}
			}
	}).then((posts) => {
			res.render('index', { posts: posts, term: req.query.term })
	})
	```

## Reference

1. (Mongoose) - Follow along with this [excellent video by Ian Schoonover](https://www.youtube.com/watch?v=9_lKMTXVk64) to add search to one of your projects.

## Pagination

If you look around almost every website is paginatined. Why? Probably because pagination is **the easiest way to speed up many page loads**. If you are loading 1000 records on your index page, that will take 10 seconds to load. Pagination will speed it up by sending only the first 20 records. 

### Sequelize findAndCountAll()

In order to paginate in Sequelize we have to do a little bit of work.

```js
router.get('/:page', (req, res) => {
  let limit = 50;   // number of records per page
  let offset = 0;
  db.user.findAndCountAll().then((data) => {
    let page = req.params.page;      // page number
    let pages = Math.ceil(data.count / limit);
		offset = limit * (page - 1);
    db.user.findAll({
      attributes: ['id', 'first_name', 'last_name', 'date_of_birth'],
      limit: limit,
      offset: offset,
      $sort: { id: 1 }
    }).then((users) => {
      res.status(200).json({'result': users, 'count': data.count, 'pages': pages});
    });
  })
  .catch(function (error) {
		res.status(500).send('Internal Server Error');
	});
});
```

### Picking a Pagination Module

Compare and contrast these modules, and list their pros and cons. Now pick one that you would use. Join the other people who chose the same as you.

[https://www.npmjs.com/package/paginate](paginate)

[https://www.npmjs.com/package/mongoose-paginate](mongoose-paginate)

[https://www.npmjs.com/package/express-paginate](express-paginate)

## Challenges - Pagination

1. Using one of these modules (or another) add pagination to your Famos Amos search results.

## Reference - Pagination

1. [How to Paginate Records in MySQL using Sequelize and Node.js](https://hackernoon.com/how-to-paginate-records-in-mysql-using-sequelize-and-nodejs-a3465d12aad5)

## Extra Stretch: Find or Create

1. **Find or Create** - There is a common pattern in searching you might someday take advantage of where you allow people to search for something, and if it doesn't exist, create it. What would this look like?
1. **Autocomplete** - now that you know simple search, how would you roll your own autocomplete dropdown menu?

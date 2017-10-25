# Associations in SQL with Sequelize

Sequelizer also allows you to associate various tables together through associations. Under the hood, these associations are converted into JOIN SQL queries.

## Objectives

	* Identify the types relational associations
	* Add one-to-many and many-to-many associations between resources in a Node.js environment with Sequelize.js

## Types of Assoications

| id | name  | email | age |
| -- | ----  | ------| ------ |
| 1  | Bob   | bob@bob.com  | 34  |
| 2  | Sally | sally@sally.com  | 87  |
| 3  | Nick | nick@nick.com  | 20  |


### One-to-Many Associations 


```js
Project.hasMany(Task)
Task.belongsTo(Project)

let project = Project.create()...
let tast1 = Task.create()...
let tast2 = Task.create()...

project.setTasks([task1, task2]).then(() => {
  // saved!
})

// ok, now they are saved... how do I get them later on?
project.getTasks().then(associatedTasks => {
  // associatedTasks is an array of tasks
})

// what task2's project?
task2.getProject().then(project => {
  // got your project
})

```

Here is another example of a one-to-many association that uses the foreignKey and sourceKey options.

```js
const City = sequelize.define('city', { countryCode: Sequelize.STRING });
const Country = sequelize.define('country', { isoCode: Sequelize.STRING });

// Here we can connect countries and cities base on country code
Country.hasMany(City, {foreignKey: 'countryCode', sourceKey: 'isoCode'});
City.belongsTo(Country, {foreignKey: 'countryCode', targetKey: 'isoCode'});

country.getCities().then(cities => {
    // got your cities ready to go
})

city.setCountry(country).then(() => {
  // set your city's country
})
```

### Many-to-Many Associations

```js
Project.belongsToMany(User, {through: 'UserProject'});
User.belongsToMany(Project, {through: 'UserProject'});
```

## Baseline Challenges
 
Continue using the sql-blog project for these challenges. 

1. Add a second table called Comments with a `body` column and a foriegn key called `postId` to associate comments and posts. (hint - read the [Sequelize Associations Docs](http://docs.sequelizejs.com/manual/tutorial/associations.html))
1. On the posts#show route, add a form to create comments. Create comments and set the userId.
1. On the posts#show route, display all comments.
1. Imagine you wanted to change the column name of `body` to `content`. Create a migration that changes the name of that column. Also add a validator that makes its max 240 characters.
1. Add a Users table to your project with an index on the `email` attribute, so you can look up users by their email. Also include a validator that validates that the email attribute is an email address.
1. Add a foreign key to to the Posts table called `userId` so that users have posts.

## Stretch Challenges

1. [New Insights on Poverty - TED Hans Rosling](https://www.ted.com/talks/hans_rosling_reveals_new_insights_on_poverty)
1. Add authentication with Passport or JWT tokens, but use the `password` column of your Users table. Be sure to encrypt your password using bcrypt!

## Resources

1. [Sequelizer Validation docs](http://docs.sequelizejs.com/manual/tutorial/models-definition.html#validations)
1. [Sequelizer Query docs](http://docs.sequelizejs.com/manual/tutorial/querying.html)


# Associations in SQL with Sequelize

Sequelizer also allows you to associate various tables together through associations. Under the hood, these associations are converted into JOIN SQL queries.

## Objectives

* Identify the types relational associations
* Add one-to-many and many-to-many associations between resources in a Node.js environment with Sequelize.js

## Note on Naming Conventions

There are a lot of different naming conventions out there for SQL tables, but here we will be following the convention set by [SQL Style Guide](http://www.sqlstyle.guide/) by Simon Holywell.

## Types of Assoications

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
project.getTasks().then(projectTasks => {
  // projectTasks is an array of tasks
})

// what task2's project?
task2.getProject().then(project => {
  // got your project
})

```

Here is another example of a one-to-many association that uses the foreignKey and sourceKey options.

```js
const City = sequelize.define('cities', { countryCode: Sequelize.STRING });
const Country = sequelize.define('countries', { isoCode: Sequelize.STRING });

// Here we can connect countries and cities base on country code
Country.hasMany(City, {foreignKey: 'countryCode', sourceKey: 'isoCode'});
City.belongsTo(Country, {foreignKey: 'countryCode', targetKey: 'isoCode'});

// Once you have a country or a city instance...

country.getCities().then(cities => {
    // got your cities ready to go
})

city.setCountry(country).then(() => {
  // set your city's country
})
```

### Many-to-Many Associations

In some cases you need to create a many-to-many association, for example Users, Events and Reservations. Users can attend various events, so users have many events, but the events and users are unique so events also have to have many users. In order to accomplish this, we create a third table, in this case we'll call it Reservations, that is a **join table** because it has three important columns that associates a user and an event together.

**Users Table**

| id | name  | email | age |
| -- | ----  | ------| ------ |
| 12  | Bob   | bob@bob.com  | 16  |
| 14  | Sam   | sam@sam.com  | 34  |
| 24  | Nick | nick@nick.com  | 55  |
| 150  | Sonya | sonya@sonya.com  | 25  |
| 153  | Derek | derek@derek.com  | 87  |

**Events Table**

| id | name  | location |
| -- | ---- | ------ |
| 1  | Dance Dance Baby | Club Lizalia  |
| 23  | Electric DJ Music | Otta-whoa!  |
| 34  | Jazzy-Zazzy | Hip Town Speakeasy  |
| 23  | Old Timey Swing Dance  | Cat  |
| 510  | Square Dance Bonanaza | The Rusty Spur  |

**Reservations Table**

| id | eventId  | userId |
| -- | ----  | ------|
| 1  | 23   | 12  |
| 2  | 23 | 14  |
| 3  | 510 | 153  |
| 4  | 34  | 150  |
| 5  | 510 | 24  |
| 6  | 23 | 24  |
| 7  | 23 | 12  |

Here is some sample code for how to setup a many-to-many association using users joining many project teams.

```js
Team = sequelize.define('teams', {
  role: Sequelize.STRING
});

Project.belongsToMany(User, {through: 'Teams'});
User.belongsToMany(Project, {through: 'Teams'});
// through is required!

user.addProject(project, { through: { role: 'manager' }});
```

## Baseline Challenges

**Goal: Grocking Associations (Partner)**

1. Review the Users, Events, Reservations data above. What observations can you and a partner make about the data? Who is going to the Dance Dance Baby event? How old are the attendees at event The Rusty Spur?
1. With a partner, Come up with 5 examples of one-to-many associations and 5 for many-to-many in the real world.
1. On your own, choose one and write the code that would define the model relationships between two resources using Sequelize.js.
1. Now compare your code with your partner and check each other's work.

**Goal: Explore Sequlize.js (Partner)**

1. What are the Many-to-Many (BelongsToMany) model public functions and what does each do?
1. What is the difference between HasOne and BelongsTo?

**Goal: Adding Associations to a Project**

Continue using Famous Amos for these challenges.

1. Add a second resource that associates with your core resource. (hint - read the [Sequelize Associations Docs](http://docs.sequelizejs.com/manual/tutorial/associations.html))
1. Make a way to create the second resource associated with the primary resource. (e.g. a comment form on an article)
1. Show all the second resource (e.g. comments on an article)
1. Imagine you wanted to change the column name of `body` to `content`. How would you create a migration that changes the name of that column. Also add a validator that makes its max 240 characters.
1. Add a Users table to your project with an index on the `email` attribute, so you can look up users by their email. Also include a validator that validates that the email attribute is an email address.
1. Associate your primary resource with users so users have many of your primary resource.

## Stretch Challenges

1. [New Insights on Poverty - TED Hans Rosling](https://www.ted.com/talks/hans_rosling_reveals_new_insights_on_poverty)
1. Add authentication with Passport or JWT tokens, but use the `password` column of your Users table. Be sure to encrypt your password using bcrypt!

## Resources

1. [Sequelizer Validation docs](http://docs.sequelizejs.com/manual/tutorial/models-definition.html#validations)
1. [Sequelizer Query docs](http://docs.sequelizejs.com/manual/tutorial/querying.html)

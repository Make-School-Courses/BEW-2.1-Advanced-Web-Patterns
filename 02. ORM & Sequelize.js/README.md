# ORM & Sequelize.js

## Objectives

  * Define an ORM
  * Boostrap Sequelize.js 
  * Use the features of Sequelize such as migration, queries, indexes, and validators.

## Background

An ORM (like an ODM) is code that we use to avoid writing a lot of long SQL queries inside our projects. Instead we can write those same queries using a DSL in another language.

We'll be using the most popular JavaScript ORM - [Sequelize.js](https://www.npmjs.com/package/sequelize).

Here is an example Sequelizer model:

```js

const Sequelize = require('sequelize');
const sequelize = new Sequelize(database, username, password, { 'dialect': 'postgres' });

const User = sequelize.define('user', {
  username: Sequelize.STRING,
  birthday: Sequelize.DATE
});

sequelize.sync()
  .then(() => User.create({
    username: 'janedoe',
    birthday: new Date(1980, 6, 20)
  }))
  .then(jane => {
    console.log(jane.get({
      plain: true
    }));
  });

```

## Data Types

A schema makes things much more complicated. There are many more datatypes to choose from in a SQl database. 

Review [Sequlize.js's list of datatypes](http://docs.sequelizejs.com/manual/tutorial/models-definition.html#data-types). The most common are:

1. `Sequelize.STRING`
1. `Sequelize.INTEGER`
1. `Sequelize.TEXT`
1. `Sequelize.FLOAT`

## Validations

Because you have a schema in the relational database, you can set much stricter validations on what sorts of data enter your database. Sequelize.js uses [validator.js](https://github.com/chriso/validator.js) to add **Validators** to your models. e.g.

```js
const Pub = Sequelize.define('pub', {
  name: { type: Sequelize.STRING },
  address: { type: Sequelize.STRING },
  latitude: {
    type: Sequelize.INTEGER,
    allowNull: true,
    defaultValue: null,
    validate: { min: -90, max: 90 }
  },
  longitude: {
    type: Sequelize.INTEGER,
    allowNull: true,
    defaultValue: null,
    validate: { min: -180, max: 180 }
  },
}, {
  validate: {
    bothCoordsOrNone() {
      if ((this.latitude === null) !== (this.longitude === null)) {
        throw new Error('Require either both latitude and longitude or neither')
      }
    }
  }
})
```


## ORM/Sequelizer Challenges - Making Your sql-blog

**GOAL: Install PostgreSQL, `sequlize-cli`**

1. Because PostgreSQL is a very popular SQL database and used by default in Heroku, we'll be using this database locally and remotely. So install that:

  ```bash
  $ brew install postgres
  ```

1. We'll also add the sequelize-cli tool to create and manage our migrations.

  ```bash
  $ npm install -g sequelize-cli
  ```

**GOAL: Add Sequelize.js to a project**

1. If you'd like, you can use this time to start your contracting project. Otherwise you can make a blog. Use the express-generator to generate an express app called "sql-blog".
1. Now add Sequelize and pg to your npm project:

  ```bash
  $ npm install --save sequelize pg pg-hstore
  ```

1. Add a `.sequelizerc` file to the root of your project to define the paths of the folders sequelize-cli will create.

  ```js 
  const path = require('path');
  module.exports = {
    "config": path.resolve('./db/config', 'config.json'),
    "models-path": path.resolve('./db/models'),
    "seeders-path": path.resolve('./db/seeders'),
    "migrations-path": path.resolve('./db/migrations')
  };
  ```

1. Initialize sequelize with the sequelize-cli tool - 

  ```bash
    $ sequelize init
  ```

1. Create a model called Post with a `title` and `body` attribute. Use the following code as a sample to make your own new model and migration.

  ```bash
    $ sequelize model:create --name User --attributes first_name:string,last_name:string,bio:text
  ```

1. Create a database using PostgreSQL. 

  ```bash
    $ createdb blog-dev
  ```

1. Next, update your `config/config.json` file to reflect the new development database context. In the "development" context, update the database's name, the "dialect" to `postgres`, and change the username to the username of your computer.
1. Now migrate your db with `$ sequelize db:migrate`
1. Use the [Postgres.app](https://postgresapp.com/documentation/gui-tools.html) to access your new database in the CLI. Use the command `\dt` to see the `Posts` table you created.
1. Now, run the following code to test if your database has connected. (it probably won't - try to troubleshoot :D )

  ```js
  sequelize
    .authenticate()
    .then(() => {
      console.log('Connection has been established successfully.');
    })
    .catch(err => {
      console.error('Unable to connect to the database:', err);
    });
  ```

1. Finally, can you complete these following routes?
  1. posts#new
  1. posts#create
  1. posts#show
  1. posts#index

## Stretch Challenges

1. [The Best Stats You've Ever Seen - TED Hans Rosling](https://www.ted.com/talks/hans_rosling_shows_the_best_stats_you_ve_ever_seen)
1. Create a new model called `User` with an `email` and `password` attributes. Be sure that email has an index on it.
1. (Looking ahead to next class) can you associate so that users have many posts?

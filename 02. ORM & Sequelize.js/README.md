# ORM & Sequelize.js

## Objectives

  * Define an ORM
  * Boostrap Sequelize.js 
  * Use the features of Sequelize such as migration, queries, indexes, and validators.

## Background

An ORM (like an ODM) is code that we use to avoid writing a lot of long SQL queries inside our projects. Instead we can write those same queries using a DSL in another language.

We'll be using the most popular JavaScript ORM - [Sequelize.js](https://www.npmjs.com/package/sequelize).

Here is an example Sequelize.js model and how to use that model to create an row in the database:

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

## Models 

In Sequelize.js we create models (and their corresponding migrations) using a command line generator. For example:

```bash
    $ sequelize model:create --name User --attributes first_name:string,last_name:string,bio:text
```

outputs a model and a migration. here is the model:

```js
// MODEL

'use strict';
module.exports = (sequelize, DataTypes) => {
  var User = sequelize.define('User', {
    first_name: DataTypes.STRING,
    last_name: DataTypes.STRING,
    bio: DataTypes.TEXT
  });
  
  return User;
};
```

And a migration: 

```js
// MIGRATION

'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Users', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      first_name: {
        type: Sequelize.STRING
      },
      last_name: {
        type: Sequelize.STRING
      },
      bio: {
        type: Sequelize.TEXT
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('Users');
  }
};
```

## Migrations

In Sequelize.js if we want to change our database we have to create migrations, whether it is to change a table, add or remove a column, change a column's type, or even make changes to a lot of data. For example, if we wanted to add a `dob` (date of birth) column to 

```bash
    $ sequelize migration:create --name add_dob_to_users
```

And then we add the guts manually to add the column (to the `up` command), and remove the column (from the `down` command)

```js
'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    queryInterface.addColumn(
      'Users',
      'dob',
      Sequelize.DATE
    )
  },

  down: (queryInterface, Sequelize) => {
    queryInterface.removeColumn('Users', 'dob',)
  }
};
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
  name          : { type: Sequelize.STRING },
  address       : { type: Sequelize.STRING },
  latitude      : {
                    type: Sequelize.INTEGER,
                    allowNull: true,
                    defaultValue: null,
                    validate: { min: -90, max: 90 }
                  },
  longitude     : {
                   type: Sequelize.INTEGER,
                   allowNull: true,
                   defaultValue: null,
                   validate: { min: -180, max: 180 }
                 }
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


## ORM/Sequelize Challenges - Famous Amos Pet Emporium (Starter Project)

**GOAL: Install PostgreSQL, `sequelize-cli`**

1. Because PostgreSQL is a very popular SQL database and used by default in Heroku, we'll be using this database locally and remotely. So install that:

   ```bash
   $ brew install postgres
   ```

1. We'll also add the sequelize-cli tool to create and manage our migrations.

   ```bash
   $ npm install -g sequelize-cli
   ```

1. Download and install [Postico](https://eggerapps.at/postico/) to have a GUI browser for your local postgresql databases. 

**GOAL: Add Sequelize.js to a project**

Reference the [Getting Started] Docs of Sequelize to complete these challenges.

1. Go to [Famous Amos Pet Emporium](https://github.com/Product-College-Labs/famous-amos) and fork the project and clone your fork down. Add a link to your fork to the [Web 3 Progress Tracker](https://docs.google.com/spreadsheets/d/1jlDyBlRDjLGrA6VOi3JuV-v07vKoEUn1a96FC2CkwBo/edit#gid=0)
1. Now make a new branch called "sequelize". Now add Sequelize and pg to your npm project:

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
   (Or use the [Postgres.app](https://postgresapp.com/documentation/gui-tools.html) to automatically start your local postgres database when you start you computer)

1. Create a model for `Pet` and look in the `json/pets.json` file for the model's attributes. Use the following code as a sample to make your own new model and migration.

   ```bash
     $ sequelize model:create --name User --attributes first_name:string,last_name:string,bio:text
   ```

1. Create a database using PostgreSQL. 

   ```bash
     $ createdb famous-amos
   ```

1. Next, you'll have to connect your app to your development database in the `server.js` file. Use the Getting Started documentation to find the code to connect to your databse. (Hint - remember ot use the "dialect" `postgres`, and change the username to the username of your computer.)

1. Next, migrate your db with `$ sequelize db:migrate`

1. Now, put the following code in your `server.js` file and run your app to test if your database has connected. (it probably won't - try to troubleshoot connecting your databse :D )

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

1. Finally, begin converting each of the `pets` controller routes to use Sequelize for crudding your core resource.
  1. #new
  1. #create
  1. #show
  1. #index
  1. #edit
  1. #update

## Stretch Challenges

1. Add two `weight`, `color` columns to the pets table and model. (hint generate a new migration and run it to add the columns)
1. Change the attribute `species` to `breed`. (hint generate a new migration to change the column name)

## Extra Stretch :D
1. [The Best Stats You've Ever Seen - TED Hans Rosling](https://www.ted.com/talks/hans_rosling_shows_the_best_stats_you_ve_ever_seen)


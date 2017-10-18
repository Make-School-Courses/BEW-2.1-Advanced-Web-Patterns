
# SQL & Relational Databases with Sequlizer

## Objectives

  * 

## Background

## Intro

```js
const Sequelize = require('sequelize');
const sequelize = new Sequelize('database', 'username', 'password');

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

## Resources

## Challenges

## Stretch Challenge

# Validation and Server-Side Success & Error Handling

## Competencies

* Set some common validations with the ORM, e.g. unique, required
* Handle server-side errors effectively in Express.js
* Display flash messages to keep users informed about errors and successes.
* Put in custom 404 and 500 pages in production

## Background

Apps don't always work! Actually they often break, and when they do we should have built them the degrade elegantly and keep the user (or the developer) informed as to what is happening.

We're going to look at a few common patterns of error handling and how to implement them in Node.js with Express.js.

Servers can not work as expected for all sorts of reasons, but probably the most common reasons are:

1. A user tries to create or update a record in a way that is in invalid (e.g. sign up without a password)
2. A user navigates to a route that no longer exists (a 404 status)
3. A bug makes the server crash (a 500 status)

## Validation

The process of making sure that your data in your database is valid is called **Validation**, and it can be accomplished at the application or at the database level.

> **Analogy - A Doorman Bouncer** - think of validation as the doorman bouncer of your database. Each club has its own set of rules for dress code, and if guests don't fit the bill, they aren't let it.

![Bouncer](assets/bouncer.jpeg)

Whether you are using a SQL or NoSQL database you define validations in the model. However, it is interesting to note that with SQL databases we can set these validations *in the database itself* as well, if we want to.

**Validations Best Practice** - the best practice is to keep validations light as you are beginning a project, as they can slow down the pace of development, and then tighten them up later when you are opening up the project to more and more live users.

Validations Example from Sequelize docs with built in validators and a custom validator:

```js
const Pub = Sequelize.define('pub', {
  name: { type: Sequelize.STRING, notNull: true, notEmpty: true },
  email: { type: Sequelize.STRING, isEmail: true, notNull: true, notEmpty: true },
  url: { type: Sequelize.STRING, isUrl: true },
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

## Success & Error "Flash" Messages

Whenever you succeed or fail at creating, updating, or deleting anything, it is best practice to notify the user. To do this we use an object sent with a response called `flash`.

We're going to use the npm library [express-flash](https://www.npmjs.com/package/express-flash) to handle flashes. Flash messages typically require cookies and sessions in order to keep track of the state of the flash message.

```js
  // server.js
  var flash = require('express-flash'),
      express = require('express'),
      session = require('express-session'),
      app = express();

  app.use(express.cookieParser('keyboard cat'));
  app.use(session({ cookie: { maxAge: 60000 }}));
  app.use(flash());

  // controller.js
  app.get('/', function (req, res) {
    req.flash('info', 'Welcome');
    res.render('index', {
      title: 'Home'
    })
  });

  // main.hanldebars template
  {{#if messages.info}}
  <div class="alert alert-info">
    <span>{{messages.info}}</span>
  </div>
  {{/if}}
```

### Flash Challenges

1. Read [Indicators, Validations, and Notifications: Pick the Correct Communication Option](https://www.nngroup.com/articles/indicators-validations-notifications/) and answer the following questions in groups of 4
  1. Come up with a few examples of Indicators, Validations, and Notifications.
  1. What is the difference between them?
1. Add `express-flash` and display success and error messages in your sql-blog or client project.

## Express Error Handling

When something fails to work, like a validation, then using a flash message to notify the user that something went wrong is a good solution. But what about when your app fully crashes? Express has its own error handling pattern. You can tell Express error handler middleware because it has 4 arguments. e.g.

```js
app.use(function(err, req, res, next) {
  // logging and other
  // error handling code
});
```

As we'll see you use the `next(err)` command to trigger the error middleware within a request.

In those cases you can use express's standard error handling pattern to present a custom 500 or 404 page.

A famous custom 404 page is the github 404 page. e.g. [https://github.com/imabooger](https://github.com/imabooger). Where else have you seen custom 404 or 500 pages? How would you add an easter-egg page like the GitHub one to your own site?

## Challenges - Custom 404 and 500 pages

Because we don't want to assume that the app can even render a template, we can actually keep our custom `500.html` template in our public file and serve it as a static template.

The standard Express.js error handler code is below, but we're going to start off simpler:

1. Add the code below to add a Not Found error that runs only if no other endpoint is triggered.

  ```js
  // server.js

  app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
  });

  app.use(function(err, req, res, next) {
    if(err.status == 404) {
    //do logging and user-friendly error message display
      res.redirect('/404.html');
    } else if (err.status == 500) {
      res.redirect('/500.html');
    }
  });
  ```

1. Now add the `404.html` template to your `public` folder. Remeber this template cannot inherit from your layout template because it is being served statically.

1. Now that that's done let's look at the standard Express.js error middleware code to extend ours more. It has all the same sort of stuff, but it adds a check to see if you are in production or not. If in development, it just displays the error, but in production it hides the stack trace. Let's add this check for development enviornment.

```js
// server.js
// catch 404 and forward to error handler

app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// IF DEVELOPMENT
if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
  });
} else { // IF PRODUCTION
  // production error handler
  // no stacktraces leaked to user
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: {}
    });
  });
}
```

Great work! How cool can you make your 404.html template. Finish it and share it in slack in the `web-3` channel.

### References

1. [Express Docs: Error Handling](http://expressjs.com/en/guide/error-handling.html)
1. [JS Custom 404 and 500 Pages](https://www.hacksparrow.com/express-js-custom-error-pages-404-and-500.html)

## Stretch Challenges

1. Write a test to test that your 404 page works
1. Add a custom 500 page

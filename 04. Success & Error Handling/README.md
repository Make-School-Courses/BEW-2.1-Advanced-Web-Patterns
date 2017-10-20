# Success & Error Handling

## Competencies

## Background

Apps don't always work! Actually they often break, and when they do we should have built them the degrade elegantly and keep the user (or the developer) informed as to what is happening. 

We're going to look at a few common patterns of error handling and how to implement them in Node.js with Express.js.

## Success & Error "Flash" Messages

Whenever you succeed or fail at creating, updating, or deleting anything, it is best practice to notify the user. If you are submitting 


`express-flash`
https://gist.github.com/brianmacarthur/a4e3e0093d368aa8e423
https://www.npmjs.com/package/express-flash


## Express Error Handling

https://derickbailey.com/2014/09/06/proper-error-handling-in-expressjs-route-handlers/
http://expressjs.com/en/guide/error-handling.html

### Custom 404 and 500 Pages

Custom 404 and 500 pages

https://www.hacksparrow.com/express-js-custom-error-pages-404-and-500.html

## Baseline Challenges

1. Add express-flash and display success and error messages in your sql-blog or client project.

1. Add error express middleware 
1. Write a test to prove it works

1. Add custom 404 and 500 pages
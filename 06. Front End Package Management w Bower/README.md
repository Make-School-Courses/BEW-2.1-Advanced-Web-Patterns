# Intro to Build Systems

## Competencies & Objectives

  * Identify and list common front end build system and automation tools
  * Add bower to a project
  * Stretch: Implement a gulp file to concatenate and minify your CSS and JS files

## Intro

The front end has a lot of in's and out's, a lot of files and dependencies, but unlike the server the files don't all just sit there waiting to be used. All front end files have to end up running on the user's browser.

There are a lot of fun things like **TypeScript** and **Jade** templates that make writing front end code leaner and more elegant, but these eventually need to end up as plain-jane JS, CSS, and HTML so browsers can run them.

*Build Systems* are a set of tools that work together to simplify and automate all this front end complexity.

### Build Systems Benefits

You don't need to have a build system, but there are big advantages to having even a simple one:

  * Improve product quality
  * Accelerate the compile and link processing
  * Eliminate redundant tasks
  * Minimize "bad builds"
  * Eliminate dependencies on key personnel
  * Have history of builds and releases in order to investigate issues
  * Save time and money - because of the reasons listed above
  * Setup continuous integration and continuous testing
  * Build isomorphic or "Universal" javascript application

## Demo - Adding Bower

## Bower Challenges

**Goal - Add Bower to your contractor project**

1. Add bower to your contractor project.
1. Use bower to add bootstrap to your project.
1. Use bower to add jquery to your project.

## Various Types of Build System Tools

There are three categories of build automation tools:

1. Package Management
  - [Bower](https://bower.io/)
  - [npm](https://www.npmjs.com/
  - [yarn](https://yarnpkg.com/en/
1. Task Runners
  - [Grunt](https://gruntjs.com/)
  - [Gulp](https://gulpjs.com/)
  - [Brunch](http://brunch.io/)
1. Dependency Management / Module Loaders / Bundlers
  - [Webpack](https://webpack.js.org/)
  - [Browserify](http://browserify.org/)
  - [RequireJS](http://requirejs.org/)
  - [ES6 modules](http://2ality.com/2014/09/es6-modules-final.html)

You can use more and fewer of these in conjunction or use them by themselves. Here are four build system recipes:

1. Bower (just plain old Bower)
1. Bower + Gulp or Grunt
1. npm + Browserify + Gulp
1. npm + Webpack (What no task runner? npm can be a task runner too!)

### A Great Stack Overflow Answer

To make sense of all of this build system craziness - please first read [this Stack Overflow Answer](http://stackoverflow.com/questions/33561272/task-runners-gulp-grunt-etc-and-bundlers-webpack-browserify-why-use-toge). Now answer the following questions with a group of 4:

1. What do they use gulp for in the author's office?
1. What is the difference between task runners and package bundlers?
1. What is trans-pilation?
1. What is an isomorphic app?

### Task Runners: Gulp & Grunt

The first build system tools we'll look at are *Task Runners*. Task runners do you're grunt work, that is probably why the first task runner to explode in popularity was called **Grunt**. More recently **Gulp** has come on the scene and offers a more streamlined way to define, organize, and run your build tasks.

* [Gulp Tutorial](https://www.youtube.com/watch?v=LmdT2zhFmn4)
* [Grunt Tutorial (for reference)](https://www.youtube.com/watch?v=TMKj0BxzVgw)

## Baseline Challenges

**Goal - to concatenate and minify your js into one file with gulp**

1. Follow these [Getting Started docs](https://github.com/gulpjs/gulp/blob/master/docs/getting-started.md)
1. Use [`gulp-concat`](https://github.com/contra/gulp-concat) to concatenate all the javascript files you want to send to the client.
1. Use [`gulp-minify`](https://www.npmjs.com/package/gulp-minify) to minify this concatenated file into a `.min.js` version.
1. Use [`gulp-watch`](https://www.npmjs.com/package/gulp-watch) to watch for changes in your javascript and rerun your concatenate and minify task.

## Stretch Challenges

1. Can you write some sassy stylesheets and gulp them into regular css?
1. Can you concatenate and minify your stylesheets?

## Extra Stretch - Webpack - Module Loaders

Webpack is like browserify but is for more than javascript. Webpack can replace your task runner and preprocessors. It allows you to preprocess all your various front end modules into vanilla HTML, CSS, & JS. It is the module loader of choice for Reactjs.

1. Watch this [Webpack Tutorial](https://www.youtube.com/watch?v=9kJVYpOqcVU)
1. Read [Webpack's Motivation Docs](http://webpack.github.io/docs/motivation.html). 
1. Instead of gulp, add webpack to your project.

## Extra Stretch - Browserify

1. As stated in the [Webpack motivation article](http://webpack.github.io/docs/motivation.html), there needs to be a solution to the problem of sending the relevant front end code to the client. [Browserify](http://browserify.org/) attempts to solve the problem of sending the minimum amount of javascript necessary. The way it works is you can simply use `require()` to add dependencies to your client-side files. **Wait, WHOA?** - that's right, use `require()`. Read [this article](http://www.jeromesteunou.net/browserify-why-and-how.html) to familiarize yourself with Browserify. Then come up with 3 use cases for browserify.
1. Compare Contrast Browserfiy and Webpack - Read [this article by Bitnative.com](https://medium.com/@housecor/browserify-vs-webpack-b3d7ca08a0a9#.rfiu01zif)

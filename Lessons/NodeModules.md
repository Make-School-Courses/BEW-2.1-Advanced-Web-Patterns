# 📦 Building and Deploying a Node Module

<!-- > -->

<!-- omit in toc -->
## ⏱ Agenda {docsify-ignore}

1. [🏆 Learning Outcomes](#%F0%9F%8F%86-learning-outcomes)
1. [☀️ Warmup: Most Interesting Module in the World](#%E2%98%80%EF%B8%8F-warmup%3A-most-interesting-module-in-the-world)
1. [[**20m**] 💬 **TT**: NPM](#%5B%2a%2a20m%2a%2a%5D-%F0%9F%92%AC-%2a%2att%2a%2a%3A-npm)
   1. [What is NPM?](#what-is-npm%3F)
   1. [What is a Package?](#what-is-a-package%3F)
   1. [What Happens When I Install a Package?](#what-happens-when-i-install-a-package%3F)
   1. [`package.json`](#%60package.json%60)
   1. [What was the "^" for the version numbers for?](#what-was-the-%22%5E%22-for-the-version-numbers-for%3F)
1. [How do I Use a Package?](#how-do-i-use-a-package%3F)
1. [Useful Commands](#useful-commands)
1. [Deploying Your Modules](#deploying-your-modules)
   1. [Why should I deploy my module?](#why-should-i-deploy-my-module%3F)
   1. [How Do I Deploy?](#how-do-i-deploy%3F)
1. [[**10m**] 🌴 BREAK {docsify-ignore}](#%5B%2a%2a10m%2a%2a%5D-%F0%9F%8C%B4-break-%7Bdocsify-ignore%7D)
1. [📋 Tocsify](#%F0%9F%93%8B-tocsify)
1. [[**60m**] 💻 **Activity**: Create a Node Module](#%5B%2a%2a60m%2a%2a%5D-%F0%9F%92%BB-%2a%2aactivity%2a%2a%3A-create-a-node-module)
1. [Resources](#resources)

<!-- > -->

## 🏆 Learning Outcomes

By the end of this lesson, you should be able to...

1. Explain how Node Modules work.
1. Make your own Node Module.
1. Deploy your Node Module on NPM

<!-- > -->

## ☀️ Warmup: Most Interesting Module in the World

<img src="Lessons/assets/npm.png" width="300" />

Head to [NPM's website](https://www.npmjs.com/) and search the packages for the most unique/entertaining/creative package you can find!

Report back your findings!

<!-- > -->

## [**20m**] 💬 **TT**: NPM

### What is NPM?

<img src="Lessons/assets/package.png" width="400" />

NPM is a company that promotes open source development for all things JavaScript! What they're most known for though, is the **Node Package Manager** (also NPM) which allows for the easy installation of JavaScript modules.

### What is a Package?

Think of it like a library you're installing to help your project do things! NPM is like Brew but for your JS project!

From [time manipulation](https://www.npmjs.com/package/moment) to [web frameworks](https://www.npmjs.com/package/moment), to [creating user interfaces](https://www.npmjs.com/package/react), NPM allows your project to take advantage of all sorts of libraries to solve your problems!

<!-- > -->

### What Happens When I Install a Package?

<img src="Lessons/assets/install.jpg" width="400" />

You install packages with NPM by running `npm install <package_name>`. If the folder doesn't already exist, a `node_modules` folder will be added to your project, and all modules installed by NPM will live there.

What you may find though is that a package may have dependencies that it needs to run. So sometimes installing one package means installing many more! Don't worry, NPM will install any dependencies needed for you.

<!-- v -->

### `package.json`

What if your buddy wants to clone or fork your project? He'll have to manually install all those modules. That's a drag.

An easy way to fix this is by having a `package.json` file, which lists all modules that a project needs in order to run. Think of it like a dependency list!

A `package.json` file has two required fields:

* `name`: name of your project/app
* `version`: version number

It will then have a list of `dependencies`, or modules that need to be installed so that the project/app can run. Here's an example:

```
{
    "name": "secret-app",
    "version": "1.0.0",
    "dependencies": {
        "lodash": "^4.17.11",
        "moment": "^2.29.1"
    }
}
```

<!-- v -->

### What was the "^" for the version numbers for?

That means we want the stated version _or higher_ for our project!

Now that we have a `package.json`, all anyone has to do is run `npm install`, and all dependencies listed in `package.json` will be installed!


<!-- > -->

## How do I Use a Package?

By using the `require` method!

`var lodash = require('lodash')`

Now you can call anything in the lodash library by using the lodash variable!

<!-- > -->

## Useful Commands

* `which npm` – where npm was installed
* `npm --version` – which version of npm you have
* `npm install <package_name>` – install a package, or run without the package name to install everything in the `package.json` file
* `npm install -g <package_name>` – installs the package as a global package (available from the command line)
* `npm install <package_name> --save-dev` – install a package that is only needed for development. For example, it can be any package for testing the project.
* `npm list` – list of npm packages installed
* `npm init` – creates a `package.json` file for you! Packages installed will be automatically added
* `npm update <package_name>` – updates a package (or all packages if none are specified)
* `npm uninstall <package_name>` – uninstalls a package
* `npm help` – if you need help with npm!

<!-- > -->

## Deploying Your Modules

### Why should I deploy my module?

<img src="Lessons/assets/open_source.png" width="400" />

<!--Talk about how awesome it is to contribute to open source-->

<!-- v -->

### How Do I Deploy?

Follow [this quick guide](https://www.jamesqquick.com/blog/how-to-create-and-publish-npm-packages) to deploy your first module! The hardest part will be coming up with a unique name!

<!-- > -->

## [**10m**] 🌴 BREAK {docsify-ignore}

<!-- > -->

## 📋 Tocsify

Let's go through an example of an NPM module built by Dani!

[Tocsify](https://github.com/droxey/tocsify)

<!-- > -->

## [**60m**] 💻 **Activity**: Create a Node Module

Now it's your turn to create more node modules! Take some time to create modules that do the following:

1. Write a random number generator module
1. Write a module that removes all spaces from a string  and replaces them with dashes (-)
1. Write a module of your choosing!

**Stretch challenges:** Pick an idea from the following lists, and create a module for it!

* [NPM Community Ideas](https://npm.community/c/ideas/8)
* [Project Ideas](https://github.com/sindresorhus/project-ideas/issues)

<!-- > -->

## Resources

1. [What is npm](https://docs.npmjs.com/getting-started/what-is-npm)
1. [Installing NPM packages locally](https://youtu.be/JDSfqFFbNYQ)
1. [Creating Node.js Modules (npm doc) (video & documentation)](https://docs.npmjs.com/getting-started/creating-node-modules)
1. [Publishing npm Packages (npm doc)](https://docs.npmjs.com/getting-started/publishing-npm-packages)
1. [How to Create and Publish your First Node.js Module (a beautiful article!)](https://medium.com/@jdaudier/how-to-create-and-publish-your-first-node-js-module-444e7585b738)
1. [Building Your First Node Module](https://gist.github.com/tmpvar/8746055)

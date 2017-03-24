# Famous Amos' Pets Emporium

## Objectives & Competencies

1. Employ RESTful & Resourceful testing patterns and methods with Mocha and Chai.

## Intro

You just got a contract with Famous Amos' Pets Emporium to build their pet store website!

## First Steps:

Your first step is to fork and clone down [the repo](https://github.com/Product-College-Labs/pets-emporium-js) of where they are today.

Once you have the project running locally on your computer. Pair up and make a plan for what tests you want to write. Now start to implement your tests solo.

## Their Requests

Here's what Amos wants:

1. Be able to upload images of pets.
1. To see what the pet is doing right now without reloading the page.
1. Be able to purchase pets with credit card and paypal.
1. Be able to search for pets by name, species, and description text.

As a good software developer you also want to make sure that their code has a baseline of test coverage.


## Basline Challenges

1. Fork the repo, clone your fork down to your computer, run the project - (30 min)
1. Add a `<select>` tag in `pets-new` to add a dropdown of pet types. (hint: store pet types as a global variable in `app.js` and then pass it into your template in the controller)
1. Review the auth tests that are present, add pets tests and (strecth) add comment tests
1. Use `cheerio` or `sinon` to test that your template does not just render, but that it has the correct data.

## Stretch Challenges

1. Add tests for all RESTful routes for Pets and Comments and their actual routes.

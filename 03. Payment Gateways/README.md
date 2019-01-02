# Paywalls

Eventually you gotta get paid...

And there enters paywalls or "payment services" like [Stripe](stripe.com) and [Braintree](braintreepayments.com).

Why do we use a service? Why not role our own?

The answer to this is we use services to make sure our data is [PCI Compliant](http://www.onlinetech.com/resources/references/what-is-pci-compliance) - the set of standards and regulations for the secure storage and usage of credit card information. In order to be PCI compliant on your own you'd have to do a lot of extra work. So instead of doing this in house, we use payment services or payment processors.

## Competencies & Objectives

1. Describe and design the simplest possible checkout workflow.
1. Describe the complexities of designing a market place like Uber or Airbnb.
1. Implement a simple checkout workflow using Stripe.

## Background

In order to keep a user's credit card data secure, third-party payment services follow a clever pattern. Let's look at the flow of requests and responses required to securely store credit card data and use it.

1. Client sends CC data and public access token to service
2. Service responds with single use token or nonce unique to this transaction, customer, card, and subscriber's public and private access tokens.
3. Client sends nonce to server
4. Server uses nonce and their private token to handshake with service and make transaction, customer, etc.

![token](token-path.png)

## Resources

1. [Stripe](stripe.com)
1. [npm `stripe`](https://www.npmjs.com/package/stripe)
1. [Stripe's API Documentation](https://stripe.com/docs/api)
1. [Braintree](braintreepayments.com)

## Baseline Challenges

1. Write a user narrative and draw a wireframe of how users will purchase pets in Proud Pete's Pet Emporium. (10 min)
1. With your partner, make a step-by-step plan and draw a picture of how the client will communicate with your payment provider service and your server. What information will be stored on your server? In which attribute of which model? The transaction? The customer? (10 min)
1. Implement the client of your checkout process by dropping in the "drop in UI" options that both Stripe and Braintree offer. (10 min)
1. Rip out the drop in UI interface and build the custom interface using HTML and Stripe.js or Stripe Card Elements.
1. Once you get a token back from Stripe, send your token via a POST request to an endpoint at the path `/pets/:id/purchase` on your server. (10 min) Log the token to the console to confirm that it is received by the server.
1. Add stripe to your server (`npm install --save stripe`), and get your Stripe keys and make them available in the context of your app using your `.env` file. Intialize the stripe object.
1. Use the Node.JS SDK documentation of Stripe to process the transaction using the token you are getting from the client. Verify that the payment went through on your Stripe dashboard.
1. Be sure to mark the pet as purchased by adding the column `purchasedAt` and updating it to the current datetime after the purchase succeeds.
1. With your partner come up with a list of things that could go wrong with payments. What is a worst case scenario? What are common hiccups or problems or features of payments? Make a plan for how a user would deal with each of these problems.

## Stretch Challenges

1. Compare and contrast Braintree and Stripe. Outline the pros and cons, limitations and affordances - compare and contrast these two services with a partner. (10 min)

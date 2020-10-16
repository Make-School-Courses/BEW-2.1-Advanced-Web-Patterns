# Paywalls

Eventually you gotta get paid...

![Get paid](tenor.gif)

And there enters paywalls or "payment services" like [Stripe](stripe.com) and [Braintree](braintreepayments.com).

Why do we use a service? Why not role our own?

The answer to this is we use services to make sure our data is [PCI Compliant](http://www.onlinetech.com/resources/references/what-is-pci-compliance) - the set of standards and regulations for the secure storage and usage of credit card information. In order to be PCI compliant on your own you'd have to do a lot of extra work. So instead of doing this in house, we use payment services or payment processors.

![boring](giphy.gif)

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

## Activity: Technical Decision Making - 30 min

1. Form into groups of 6
1. Come up with an imaginary use case for your app. You can either be a:
    - Ecommerce
    - Marketplace
    - Something new and weird that you decide on.
1. Now decide on which payment gateway your app will use. Stripe? Braintree? Another?
1. List their pro's and con's.
1. How can you come to a consensus?

![scrum](scrum.gif)

What process did you and your team follow to come to a conclusion. Did everyone finally agree? What were the requirements and pros and cons of each?

## Resources

1. [Stripe](stripe.com)
1. [npm `stripe`](https://www.npmjs.com/package/stripe)
1. [Stripe's API Documentation](https://stripe.com/docs/api)
1. [Braintree](braintreepayments.com)

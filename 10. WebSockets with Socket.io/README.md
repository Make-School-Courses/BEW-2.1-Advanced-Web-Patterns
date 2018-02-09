# Adding WebSockets with Socket.io

## Competencies & Objectives

1. Identify the use cases for WebSockets
1. Explain the difference between HTTP and WebSocket standards and communication
1. Implement the simplest possible WebSocket event-driven communication in our spec project.

## Intro

So far in our exploration of web patterns we've always used HTTP to make synchronous, call-and-response type requests to servers. But what happens when you want clients and servers to communicate asynchronously as in a chat application or with live updates or streaming information. As of a few years ago, a powerful new standard called *WebSockets*.

In the following tutorial we'll be using [Socket.io](https://socket.io/) one of the most reliable npm modules on the web that enables node servers to respond to event-driven WebSocket behaviors. Socket.io is a broad and powerful library that can manage multiple channels, rooms, and manage https and other forms of security. In our case we will be implementing a simple asynchronous push of data from the server to the client.

Remember that since the client and the server are communicating via WebSockets, Socket.io will have a client- and server-side library you will need to initialize in your project. A simple example is as follows:

```html
<!-- CLIENT -->
<script src="/socket.io/socket.io.js"></script>
<script>
  var socket = io('http://localhost');

  socket.emit('ferret', 'tobi', function (data) {
    console.log(data); // data will be 'woot'
  });
</script>
```

```js
// SERVER
var io = require('socket.io-client')('http://localhost');
io.on('connection', function (socket) {
  socket.on('ferret', function (name, fn) {
    fn('woot');
  });
});
```

## Resources

1. [WebSocket Example](http://codepen.io/voku/pen/GpVoNN?editors=1010)
1. [REST vs. WebSockets (PubNub)](https://www.pubnub.com/blog/2015-01-05-websockets-vs-rest-api-understanding-the-difference/)
1. [Introducing WebSockets: Bringing Sockets to the Web](https://www.html5rocks.com/en/tutorials/websockets/basics/)
1. [What are WebSockets (Pusher)](https://pusher.com/websockets)

## Baseline Challenges

1. Imagine Pete wants you to make it so that viewers of the website can see what each pet is doing as they do it, e.g. Playing, Eating, Bathing, Sleeping.
1. Add socket.io and get a "hello world" working of websocket connections.
1. Make the server update the client on the pets#show page with either: 1) eating, 2) bathing, 3) sleeping, or 4) playing. Implement WebSockets so that a pet's status is updated on their show page randomly every 10 seconds.

## Stretch Challenges

1. Make it so that on the pets#index page the pets' statuses are also updated at random.

# Adding WebSockets with Socket.io

## Competencies & Objectives

1. Identify the use cases for WebSockets
1. Explain the difference between HTTP and WebSocket standards and communication
1. Implement the simplest possible WebSocket event-driven communication in our spec project.

# HTML5 Bidirectional Communication => WebSocket

Before we jump into building with websockets, lets take a second to look at where the WebSocket standard came from and how it works. Much of this complexity is buried into the libraries and tools we use, so lets take a minute to look at them.

As HTML5 was being developed, it became clear that the web needed a bidirectional **full-duplex** standard to allow for bidirectional communication. A new standard called WebSocket was recommended in June of 2008 by Michael Carter—an influential HTML5 game developer.

In February 2010, Google (being a champion of HTML5) made Chrome 4 the first browser to ship a full support of the standard and enabled by default with Safari 5.0.0 in a close second. The last was Internet Explorer 10 in December 2011.

The WebSocket standard begins with an HTTP handshake, but then switches to the WebSocket standard that does not conform to the HTTP protocol.

<img src="WebSockets-Diagram.png" width="400" />

Here's an example of how the request for the handshake and the server's response looks:

```
GET /chat HTTP/1.1
Host: server.example.com
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Key: x3JJHMbDL1EzLkh9GBhXDw==
Sec-WebSocket-Protocol: chat, superchat
Sec-WebSocket-Version: 13
Origin: http://example.com
```

Server response:

```
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: HSmrc0sMlYUkAGmm5OPpG2HaGWk=
Sec-WebSocket-Protocol: chat
```

The request sends a `Sec-WebSocket-Key` which contains base64-encoded random bytes, and response responds with with a hash of the key in the `Sec-WebSocket-Accept` attribute which prevents resending old messages. This key/hash pattern does not provide any authentication, privacy, or integrity. WebSocket has unique security and privacy concerns.

For more information read this [WebSocket documentation](https://hpbn.co/websocket/).

## The Code

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

Hint: If you are starting your server you need to include io in that server.

> **NOTE** - `broadcast.emit()` and `emit()` are different. `emit()` sends to all attached sockets, `broadcast.emit()` sends to all except the one that is sending the message.

```js
// SERVER
var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

app.get('/', function(req, res){
  res.sendFile(__dirname + '/index.html');
});

io.on('connection', function(socket){
  console.log('a user connected');
});

http.listen(3000, function(){
  console.log('listening on *:3000');
});
```

## Resources

1. [WebSocket Example](http://codepen.io/voku/pen/GpVoNN?editors=1010)
1. [REST vs. WebSockets (PubNub)](https://www.pubnub.com/blog/2015-01-05-websockets-vs-rest-api-understanding-the-difference/)
1. [Introducing WebSockets: Bringing Sockets to the Web](https://www.html5rocks.com/en/tutorials/websockets/basics/)
1. [What are WebSockets (Pusher)](https://pusher.com/websockets)

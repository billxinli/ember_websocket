#Ember with Websocket

Demo application that uses Ember for frontend framework, and listens for messages from Websocket.

**Requirement:**

* Modern browser that supports Websocket
* Redis

**Demo:**

* Create and migrate database.
* Terminal 1: Start Websocket server with `rake websocket_rails:start_server`
* Terminal 2: Start Rails server with `rails s`
* Open Firefox and go to `http://localhost:nnnn/chats` which acts as the message sender
* Open Chrome and go to http://localhost:nnnn/#chats` which acts as the message receiver, which is implemented by Ember.

In Firefox create a new messages, and the messages should be pushed to Chrome. Similarly, with update and destroying records.

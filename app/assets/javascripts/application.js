//= require jquery
//= require jquery_ujs
//= require handlebars
//= require ember
//= require ember-data
//= require websocket_rails/main
//= require_self
//= require ember_websocket

var emberWSDispatcher = new WebSocketRails('localhost:3001/websocket');


// for more details see: http://emberjs.com/guides/application/
var EmberWebsocket = Ember.Application.create({
  LOG_TRANSITIONS: true, // basic logging of successful transitions
  LOG_TRANSITIONS_INTERNAL: true, // detailed logging of all routing steps
  LOG_VIEW_LOOKUPS: true, // logging view lookups
  LOG_ACTIVE_GENERATION: true, // logging generated objects
  LOG_STACKTRACE_ON_DEPRECATION: true,
  LOG_BINDINGS: true
});

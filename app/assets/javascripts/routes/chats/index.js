EmberWebsocket.ChatsIndexRoute = Ember.Route.extend({
  model: function (params, transition) {
    return this.store.findQuery('chat');
  },
  setupController: function (controller, model, transition) {
    controller.set('chats', model);
  },
  activate: function () {
    console.log('Enter chats');
    console.log('Subscribe to object specific channels');

  },
  deactivate: function () {
    console.log('Leaving chats');
    console.log('Unsubscribe to object specific channels');
  }
});
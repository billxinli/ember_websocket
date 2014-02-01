EmberWebsocket.ChatsIndexRoute = Ember.Route.extend({
  model: function (params, transition) {
    return this.store.findQuery('chat');
  },
  setupController: function (controller, model, transition) {
    controller.set('chats', model);
  }
});
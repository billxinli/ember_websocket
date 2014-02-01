EmberWebsocket.ChatsIndexController = Ember.Controller.extend({
  chatsFilter: function () {
    return this.store.find('chat')
  }.property()
});

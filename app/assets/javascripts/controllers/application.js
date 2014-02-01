EmberWebsocket.ApplicationController = Ember.Controller.extend({
  init: function () {
    var _this = this;
    var chatsChannel = emberWSDispatcher.subscribe('chats');
    chatsChannel.bind('upsert', function (data) {
      _this.store.push('chat', JSON.parse(data));
    });

    chatsChannel.bind('destroy', function (data) {
      var payload = JSON.parse(data);
      var object = _this.store.find('chat', payload.id);
      object.then(function (object) {
        object.unloadRecord();
      });
    });
  }
});

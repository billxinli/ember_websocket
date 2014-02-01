// For more information see: http://emberjs.com/guides/routing/

EmberWebsocket.Router.map(function () {
  this.resource('chats', function () {
    this.route('index', { path: '/' });
  });

});

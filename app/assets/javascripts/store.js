// http://emberjs.com/guides/models/using-the-store/

EmberWebsocket.ActiveModelAdapter = DS.ActiveModelAdapter.extend({
  namespace: 'api/v1'
});

EmberWebsocket.Store = DS.Store.extend({
  adapter: EmberWebsocket.ActiveModelAdapter
});



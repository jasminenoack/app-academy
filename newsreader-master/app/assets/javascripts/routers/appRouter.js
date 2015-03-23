NewsReader.Routers.AppRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.collection = new NewsReader.Collections.Feeds();
    this.collection.fetch();
  },
  routes: {
    "": 'index',
    "feeds/:id": "showFeed"
  },

  index: function () {
    var indexView = new NewsReader.Views.Index({
      collection: this.collection
    })

    this.swapView(indexView)
  },

  showFeed: function (id) {
    var showView = new NewsReader.Views.ShowView({
      model: this.collection.getOrFetch(id)
    })

    this.swapView(showView);
  },

  swapView: function (view) {
    this._view && this._view.remove();
    this._view = view;
    this.$rootEl.html(view.render().$el);
  }

})

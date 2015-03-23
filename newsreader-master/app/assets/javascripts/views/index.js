NewsReader.Views.Index = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.collection, "sync remove add", this.render)
  },

  events: {
    "click .delete": "destroyFeed",
    "submit .new-feed": "createFeed"
  },

  template: JST['index'],

  render: function () {
    this.$el.html(this.template({
      feeds: this.collection
    }));

    return this;
  },

  destroyFeed: function (event) {
    var feedId = $(event.currentTarget).data("feed-id");
    this.collection.get(feedId).destroy();
  },

  createFeed: function (event) {
    var $form = $(event.currentTarget);
    var attrs = {};
    attrs.url = $form.find("#url").val();

    this.collection.create(attrs);
  },

  refresh: function () {

  }

})

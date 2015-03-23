NewsReader.Views.ShowView = Backbone.View.extend({
  initialize: function () {
    this.subviews = [];
    this.listenTo(this.model.entries(), "add", this.render);
  },

  events: {
    "click button": "refresh"
  },

  template: JST['show'],

  render: function () {
    console.log("render")
    this.removeSubviews()

    this.$el.html(this.template({
      feed: this.model
    }))

    this.model.entries().each(function (entry) {
      var entryView = new NewsReader.Views.ShowEntry({model: entry})
      this.$el.find(".entries").append(entryView.render().$el)
      this.subviews.push(entryView)
    }.bind(this))

    return this;
  },

  refresh: function () {
    this.model.fetch({
    });
  },

  removeSubviews: function () {
    _.each(this.subviews, function (subview) {
      subview.remove()
    })
    this.subviews = []
  },

  remove: function () {
    Backbone.View.prototype.remove.call(this)
    this.removeSubviews()
  }

})

NewsReader.Views.ShowEntry = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  template: JST['showEntry'],

  tagname: 'li',

  render: function () {
    this.$el.html(this.template({
      entry: this.model
    }))
    return this;
  },

  refresh: function () {
    this.model.fetch();
  }

})

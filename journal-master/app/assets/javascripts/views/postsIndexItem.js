Journal.Views.PostsIndexItem = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.model, "change", this.render)
    if (this.model.id === 6) {
    }
  },

  events: {
    'click button': 'deletePost',
    'click' : 'showPost'
  },

  tagname: 'li',
  template: JST['posts/postIndexItem'],

  render: function () {
    this.$el.html(this.template({post: this.model}))
    return this;
  },

  deletePost: function (event) {
    event.preventDefault()
    this.model.destroy();
    this.remove()
  },

  showPost: function () {
    Backbone.history.navigate("/posts/" + this.model.id, {trigger: true})
  }

})

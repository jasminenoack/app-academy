Journal.Views.PostForm = Backbone.View.extend({

  initialize: function (options) {
    this.errors = [];
  },

  tagname: 'article',

  events: {
    "submit form":"editPost"
  },

  render: function () {
    if (this.parameters) {
      this.model.set(this.parameters)
    }
    var content = JST['posts/postForm']({post: this.model, errors: this.errors})
    this.$el.html(content)
    return this
  },

  back: function () {
    this.remove();
    Backbone.history.navigate("", {trigger: true})
  },

  editPost: function (event) {
    event.preventDefault()
    this.parameters = $(event.currentTarget).serializeJSON()
    this.model.set(this.parameters)
    this.model.save({}, {
      merge: true,
      success: function () {
        this.remove()
        this.collection.add(this.model, {merge: true})
        // this.collection.fetch();
        Backbone.history.navigate("posts/" + this.model.id, {trigger: true} )
      }.bind(this),
      error: function (post, jqXHR) {
        this.errors = jqXHR.responseJSON;
        this.render();
      }.bind(this)
    })

  }
})

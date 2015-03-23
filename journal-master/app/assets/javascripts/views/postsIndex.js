Journal.Views.PostsIndex = Backbone.View.extend({

  initialize: function (options) {
    this.posts = new Journal.Collections.Posts;
    this.listenTo (this.posts, 'add remove sync', this.render);
    this.refresh(options.callback);
  },

  template: JST['posts/postsIndex'],

  // event: {
  //   "click .new": 'newPost'
  // },

  render: function () {
    this.$el.empty();
    this.$el.append(this.template);
    this.posts.each( function (post) {
      var item = new Journal.Views.PostsIndexItem({model: post})
      this.$el.find('ul').append(item.render().$el)
    }.bind(this));
    return this;
  },

  refresh: function (callback) {
    this.posts.fetch({
      success: function () {
        callback && callback()
      }
    });
  },

  newPost: function (event) {
    event.preventDefault();
    Backbone.history.navigate('posts/new', {trigger: true});
  }

})

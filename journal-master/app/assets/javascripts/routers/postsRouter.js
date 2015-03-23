Journal.Routers.Posts = Backbone.Router.extend({
  initialize: function (options) {
    this.$el = options.$el
  },

  routes: {
    "": 'PostsIndex',
    'posts/new': 'PostNew',
    "posts/:id": "PostShow",
    'posts/:id/edit': 'PostEdit'

  },

  PostsIndex: function (callback) {
    var index = new Journal.Views.PostsIndex({callback: callback});
    this.$el.find(".index").html(index.render().$el);
    this.posts = index.posts
  },

  PostShow: function (id) {
    if (!this.posts) {
      this.PostsIndex(this.PostShow.bind(this, id));
      return
    }

    var post = this.posts.get(id)
    var show = new Journal.Views.PostShow({model: post});
    this.$el.find('.post').html(show.render().$el);
  },

  PostEdit: function (id) {
    var post = this.posts.get(id);
    var editView = new Journal.Views.PostForm({model: post, collection: this.posts})
    this.$el.find('.post').html(editView.render().$el);
  },

  PostNew: function () {
    var post = new Journal.Models.Post()
    var newView = new  Journal.Views.PostForm({model: post, collection: this.posts})
    this.$el.find('.post').html(newView.render().$el);
  }

})

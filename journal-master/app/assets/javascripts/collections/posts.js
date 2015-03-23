Journal.Collections.Posts = Backbone.Collection.extend({
  url: 'api/posts',
  model: Journal.Models.Post,

  getOrFetch: function (id) {
    var model = this.get(id)
    if (!model) {
      model = new Journal.Models.Post({id: id})
    }
    model.fetch({
      success: function () {
        return model
      }
    })
  }

})

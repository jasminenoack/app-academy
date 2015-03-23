Journal.Views.PostShow = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.model, "sync", this.render)
  },

  tagname: 'article',

  events: {
    "dblclick h1": 'titleInput',
    "blur h1": 'changeTitle',
    "dblclick p": 'bodyInput',
    "blur p": "changeBody"
  },

  bodyInput: function (event) {
    $(event.target).html(JST['posts/body']({post: this.model}))
  },

  changeBody: function (event) {
    var body = ($(event.target).val())
    this.model.set({body: body})
    this.model.save()
  },

  changeTitle: function (event) {
    var title = ($(event.target).val())
    this.model.set({title: title})
    this.model.save()
  },

  titleInput: function (event) {
    $(event.target).html(JST['posts/title']({post: this.model}))
  },

  render: function () {
    var content = JST['posts/postShow']({post: this.model})
    this.$el.html(content)
    return this
  },

  refresh: function () {
    this.model.fetch()
  },

  initialize: function () {
    this.listenTo(this.model, "sync", this.render)
    this.refresh()
  },

})

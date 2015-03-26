TrelloClone.Views.BoardsIndexButton = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.model, "sync change", this.render)
  },

  tagName: 'li',

  template: JST['boards/boardIndexButton'],

  render: function () {
    var content = this.template({board: this.model})
    this.$el.html(content) //

    return this
  },
})

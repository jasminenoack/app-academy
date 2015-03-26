TrelloClone.Views.BoardsIndex = Backbone.CompositeView.extend({
  initialize: function () {
    this.listenTo(this.collection, "sync add remove", this.render)
  },

  template: JST['boards/boardsIndex'],

  render: function () {
    this.$el.html(this.template({boards: this.collection}))

    this.collection.each(function (board) {
      var boardButton =
        new TrelloClone.Views.BoardsIndexButton({model: board})

      this.addSubview(".board-index", boardButton)
    }.bind(this))

    var newButton = new TrelloClone.Views.NewBoardIndex({
      collection: this.collection
    })
    this.addSubview(".board-index", newButton)

    return this
  },

  refresh: function () {
    this.collection.fetch()
  }
})

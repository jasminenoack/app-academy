TrelloClone.Views.NewBoardIndex = Backbone.View.extend({
  initialize: function () {
  },

  tagName: 'li',

  template: JST['boards/newBoardIndex'],

  events: {
    "click .new": "newForm"
  },

  newForm: function (event) {
    event.preventDefault()
    var formView = new TrelloClone.Views.newBoardView({
      collection: this.collection,
      model: new TrelloClone.Models.Board
    })
    this.$el.find(".modalDialog").html(formView.render().$el).addClass("active")
  },

  render: function () {
    var content = this.template()
    this.$el.html(content) //

    return this
  },
})

TrelloClone.Views.newBoardView = Backbone.CompositeView.extend({
  initialize: function () {
    this.listenTo(this.model, "sync change", this.render)
  },

  tagName: 'div',

  events: {
    'submit form' : 'createBoard',
    'click .back' : 'removeModal'
  },

  template: JST['boards/boardForm'],

  render: function () {
    this.$el.html(this.template({board: this.model}))
    return this
  },

  removeModal: function () {
    this.$el.parent().removeClass("active")
    this.remove()
    Backbone.history.navigate("", {trigger: true})
  },

  createBoard: function (event) {
    event.preventDefault()
    this.model.save(this.$el.find("form").serializeJSON(), {

      success: function () {
        this.collection.add(this.model, {merge: true})
        Backbone.history.navigate("/boards/" + this.model.id, {trigger: true})
        this.$el.parent().removeClass("active")
        this.remove()
      }.bind(this),

      error: function () {
        console.log (this.model)
        this.render()
      }.bind(this)
    })
  }
})

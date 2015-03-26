TrelloClone.Views.ItemForm = Backbone.CompositeView.extend({
  initialize: function () {
    // this.listenTo(this.model, "sync change", this.render)
  },

  events: {
    'submit form.item': 'createItem'
  },

  template: JST['items/itemForm'],

  render: function () {
    var content = this.template()
    this.$el.html(content)

    return this
  },

  createItem: function (event) {
    event.preventDefault()
    this.model.set($(event.currentTarget).serializeJSON())

    this.model.save({}, {
      success: function () {
        this.collection.add(this.model, {merge: true});
        this.remove()
      }.bind(this)
    })
  },


})

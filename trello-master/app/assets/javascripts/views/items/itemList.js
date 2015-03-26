TrelloClone.Views.ItemList = Backbone.CompositeView.extend({
  initialize: function () {
    this.listenTo(this.collection, "add remove", this.render)
  },

  events: {
    // 'submit form': 'createItem'
  },

  template: JST['items/itemList'],

  render: function () {
    var content = this.template({items: this.collection})
    this.$el.html(content)

    return this
  },
})

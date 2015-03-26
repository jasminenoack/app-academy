TrelloClone.Views.NewCardView = Backbone.CompositeView.extend({
  initialize: function () {
    this.listenTo(this.model, "sync change", this.render)
  },

  events: {
    'submit form': 'createCard',
  },

  tagName: 'li class="new-card"',

  template: JST['cards/cardFormTitle'],

  render: function () {
    var content = this.template({card: this.model})
    this.$el.html(content)
    return this
  },

  createCard: function (event) {
    event.preventDefault()
    this.model.set($(event.currentTarget).serializeJSON())

    this.model.save({}, {
      success: function () {
        this.collection.add(this.model, {merge: true})
      }.bind(this)
    })
  },

})

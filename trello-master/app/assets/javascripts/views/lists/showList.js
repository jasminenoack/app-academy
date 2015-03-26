TrelloClone.Views.ShowListView = Backbone.CompositeView.extend({
  initialize: function (options) {
    this.listenTo(this.model, "sync change", this.render)
    this.listenTo(this.model.cards(), "add remove sync", this.render)
    this.parent = options.parent
  },

  events: {
    "click .delete": "deleteList",
    "dblclick h4": "editList",
    'submit form.list': 'submitList',
    'place': "place",
  },

  place: function (event, ui) {
    var newListId = ui.item.parent().parent().attr("id")
    var removeList = this.model
    var newList = this.collection.get(newListId)
    var card = this.model.cards().get(ui.item.data("id"))
    var cards = ui.item.parent().children()


    cardId = card.id

    _(cards).each(function (cardLi, index) {
      otherCard = newList.cards().get($(cardLi).data("id"))

      if (card.id === $(cardLi).data("id")) {
        card.set({list_id: newListId})
        card.set({ord: index})
        card.save()
        removeList.cards().remove(card)
        newList.cards().add(card)
      } else if (otherCard) {
        otherCard.set({ord: index})
        otherCard.save()
      }


    }.bind(this))
  },

  tagName: function () {
    return 'li class="list" id=' + this.model.id
  },

  template: JST['lists/showList'],

  formTemplate: JST['lists/listForm'],

  render: function () {
    this.removeSubviews()

    this.$el.html(this.template({list: this.model}))

    this.model.cards().sort().each(function (card) {
      var cardView =
        new TrelloClone.Views.ShowCardView({model: card})

      this.addSubview(".cards", cardView)
    }.bind(this))

    var newCard =
      new TrelloClone.Views.NewCardView({
        model: new TrelloClone.Models.Card({
          list_id: this.model.id,
          ord: this.model.cards().length
        }),
        collection: this.model.cards()
        })

    this.addSubview(".cards", newCard)

    return this

  },

  deleteList: function () {
    event.preventDefault();
    this.model.destroy({
      success: function () {
      }
    });
  },

  editList: function () {
    this.$el.find('h4').html(this.formTemplate({list: this.model}))
    this.$el.find("#title").focus()
  },

  submitList: function (event) {
    event.preventDefault()
    this.model.set($(event.currentTarget).serializeJSON())

    this.model.save({}, {
      success: function () {
      }.bind(this)
    })
  },


})

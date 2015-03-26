TrelloClone.Views.ShowCardView = Backbone.CompositeView.extend({
  initialize: function () {
    this.listenTo(this.model, "sync change", this.render)
    this.items = this.model.items()
    this.listenTo(this.items, "add", this.renderItemForm)
  },

  events: {
    'click .edit-card':'showDetail',
    "dblclick h6": "editCard",
    'submit form.card': 'submitCard',
    "click .delete-card": "deleteCard",
    "click #close": "removeDetail",
    "change .item-done": "toggleDone"
  },

  showDetail: function () {
    event.preventDefault()
    $('#cardDetail' + this.model.id).addClass("active")
  },

  toggleDone: function (event) {
    var done = $(event.currentTarget).prop("checked")
    var itemId = $(event.currentTarget).data("item-id")
    var item = this.items.get(itemId)

    item.save({done: done}, {
      success: function () {
        console.log(item)
      }
    })
  },

  removeDetail: function () {
    $('#cardDetail' + this.model.id).removeClass("active")
  },

  tagName: function () {
    return 'li data-id=' +
    this.model.id +
    ' data-list_id=' +
    this.model.escape("list_id")
  },

  template: JST['cards/showCard'],

  formTemplate: JST['cards/cardFormTitle'],



  render: function () {
    this.$el.html(this.template({
      card: this.model,
      items: this.items
    }))

    var items = new TrelloClone.Views.ItemList({collection: this.items})

    this.addSubview(".items", items)

    var itemForm = new TrelloClone.Views.ItemForm({
      model: new TrelloClone.Models.Item({
        card_id: this.model.id,
        ord: this.items.length
      }),
      collection: this.items,
    })

    this.addSubview(".item-form", itemForm)

    return this
  },

  renderItemForm: function () {
    var itemForm = new TrelloClone.Views.ItemForm({
      model: new TrelloClone.Models.Item({
        card_id: this.model.id,
        ord: this.items.length
      }),
      collection: this.items,
    })

    this.addSubview(".item-form", itemForm)
  },


  deleteCard: function () {
    event.preventDefault();
    this.model.destroy();
  },

  editCard: function () {
    this.$el.html(this.formTemplate({card: this.model}))
    this.$el.find("#title").focus()
  },

  submitCard: function (event) {
    event.preventDefault()
    this.model.set($(event.currentTarget).serializeJSON())

    this.model.save({}, {
      success: function () {
      }.bind(this)
    })
  },


})

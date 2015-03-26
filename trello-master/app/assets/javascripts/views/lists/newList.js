TrelloClone.Views.NewListView = Backbone.CompositeView.extend({
  initialize: function () {
    // this.listenTo(this.model, "sync change", this.render)
  },

  events: {
    'click .new-list': 'newListForm',
    'submit form': 'createList'
  },

  tagName: 'li class="new-list list"',

  template: JST['lists/newListButton'],

  formTemplate: JST['lists/listForm'],

  render: function () {
    var content = this.template()
    this.$el.html(content)

    return this
  },

  newListForm: function (event) {
    event.preventDefault()
    this.$el.html(this.formTemplate({list: this.model}))
    this.$el.find("input").focus()
  },

  createList: function (event) {
    event.preventDefault()
    this.model.set($(event.currentTarget).serializeJSON())

    this.model.save({}, {
      success: function () {
        this.collection.add(this.model, {merge: true})
      }.bind(this)
    })
  },


})

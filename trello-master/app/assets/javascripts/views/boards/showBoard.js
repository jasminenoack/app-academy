TrelloClone.Views.ShowView = Backbone.CompositeView.extend({
  initialize: function () {
    this.listenTo(this.model, "sync", this.render)
    this.collection = this.model.lists()
    // causes a lot of extra renders take care of at some point
    this.listenTo(this.collection, "add remove", this.render)
  },

  events: {
    "click .delete": 'delete',
    "drop .lists": 'sortOrd',
  },

  template: JST['boards/boardShow'],

  sortOrd: function (event) {
    var list

    lis = [].slice.call(arguments, 1)
    _(lis).each(function (li, index) {
      list = this.collection.get($(li).attr("id"))
      if (list) {
        list.save({ord: index})
      }
    }.bind(this))
    this.render()
  },

  render: function () {
    this.removeSubviews()
    this.$el.html(this.template({
      board: this.model,
    }))
    // I'm not sure if this is necessary, but without sort sometimes it would render in the wrong order.
    this.model.lists().sort().each(function (list) {
      var listView =
        new TrelloClone.Views.ShowListView({
          model: list,
          collection: this.collection
        })

      this.addSubview(".lists", listView)
    }.bind(this))

    var newList =
      new TrelloClone.Views.NewListView({
        model: new TrelloClone.Models.List({
          board_id: this.model.id,
          ord: this.model.lists().length
        }),
        collection: this.model.lists()
        })

    this.addSubview(".lists", newList)

    return this
  },

  delete: function (event) {
    event.preventDefault();
    this.model.destroy();
    Backbone.history.navigate("", {trigger:true})
  },
})

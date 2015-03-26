TrelloClone.Models.Card = Backbone.Model.extend({
  urlRoot: "api/cards",

  items: function () {
    if (!this._items) {
      this._items = new TrelloClone.Collections.Items
    }
    return this._items
  },

  parse: function (payload) {
    if (payload.items) {
      this.items().set(payload.items)

      delete payload.items
    }

    return payload
  }

})

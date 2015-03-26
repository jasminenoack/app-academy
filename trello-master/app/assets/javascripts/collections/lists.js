TrelloClone.Collections.Lists = Backbone.Collection.extend({
  model: TrelloClone.Models.List,
// add a cmparator to sort for newest

  getOrFetch: function (id) {
    var list = this.get(id);

    if (!list) {
      list = new this.model({id: id});
    };

    list.fetch({
      success: function () {
        this.add(list, {merge: true});
      }.bind(this)
    });

    return list;
  },

  comparator: "ord",
})

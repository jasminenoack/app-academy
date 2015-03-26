TrelloClone.Collections.Items = Backbone.Collection.extend({
  model: TrelloClone.Models.Item,
  comparator: "ord",

  url: "api/items",
})

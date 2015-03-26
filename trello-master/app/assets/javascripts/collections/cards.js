TrelloClone.Collections.Cards = Backbone.Collection.extend({
  model: TrelloClone.Models.Card,
  comparator: "ord",

  url: "api/cards",
})

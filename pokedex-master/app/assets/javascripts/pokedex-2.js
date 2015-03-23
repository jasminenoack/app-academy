Pokedex.RootView.prototype.addToyToList = function (toy) {
  var $ul = this.$pokeDetail.find("ul.toys." + toy.escape("pokemon_id"))
  var $li = $("<li>")
  $li.attr("data-toy-id", toy.id)
  $li.data("pokemon-id", toy.escape("pokemon_id"))

  $li.text(
    "name: " +
    toy.escape("name") +
    ", happiness: " +
    toy.escape("happiness") +
    ", price: " +
    toy.escape("price")
  )

  $ul.append($li)
};

Pokedex.RootView.prototype.renderToyDetail = function (toy) {
  var rootView = this,
    templateCode = $("#toy-detail-template").html(),
    templateFn = _.template(templateCode);

  this.$toyDetail.empty();

  toy.fetch({
    success: function () {
      rootView.$toyDetail.append(templateFn({ toy: toy }));
    }
  });

};

Pokedex.RootView.prototype.selectToyFromList = function (event) {
  event.preventDefault();
  var $li = $(event.currentTarget);
  var pokemon = this.pokes.get($li.data("pokemon-id"));
  var toy = pokemon.toys().get($li.data("toy-id"));
  this.renderToyDetail(toy);
};

Pokedex.RootView.prototype.renderToysList = function (toys) {

};

Pokedex.RootView.prototype.reassignToy = function (event) {
  var toyId = $(event.currentTarget).data("toy-id")
  var toy = new Pokedex.Models.Toy({id: toyId})
  toy.fetch()

  var oldPokeId = toy.get("pokemon_id")
  var oldPkmn = this.pokes.get(oldPokeId);

  var newPokeId = $(event.currentTarget).val();

  var rootView = this;

  toy.save(
    { "pokemon_id": newPokeId },
    {
      success: function () {
        console.log("success")
        rootView
          .$toyDetail
          .empty();
        var $toyLi = rootView
          .$pokeDetail
          .find("li[data-toy-id=" + toyId + "]")
          .detach();

        rootView
          .$pokeDetail
          .find(".toys." + newPokeId)
          .append($toyLi)
      }
  });

};

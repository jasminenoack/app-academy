Pokedex.RootView.prototype.addPokemonToList = function (pokemon) {
  var $li = $("<li>");

  this.$pokeList.append($li);
  $li
    .text("name: " + pokemon.escape("name") + ", Type: " + pokemon.escape("poke_type"))
    .addClass("poke-list-item")
    .data("id", pokemon.id);

  return this;
};

Pokedex.RootView.prototype.refreshPokemon = function (callback) {
  var rootView = this;

  this.pokes.fetch({
    success: function (pokemon) {
      pokemon.each(function (pkmn) {
        rootView.addPokemonToList(pkmn);
      })
    }
  });
};

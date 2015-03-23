Pokedex.RootView.prototype.renderPokemonDetail = function (pokemon) {
  var rootView = this,
      $toys = $("<ul>").addClass("toys " + pokemon.id),
      templateCode = $("#pokemon-detail-template").html(),
      templateFn = _.template(templateCode);

  pokemon.fetch({
    success: function () {
      rootView.$pokeDetail.append(templateFn({ pokemon: pokemon }));
      rootView.$pokeDetail
        .find(".detail." + pokemon.id)
        .append($toys);

      pokemon.toys().each(function (toy) {
        rootView.addToyToList(toy);

      });
      
      rootView
        .$pokeList
        .find('li:contains(name: ' + pokemon.get("name") + ", Type: " + pokemon.get("poke_type") + ")")
        .addClass("on");
    }
  });


};

Pokedex.RootView.prototype.selectPokemonFromList = function (id) {
  this.renderPokemonDetail(this.pokes.get(id))
};

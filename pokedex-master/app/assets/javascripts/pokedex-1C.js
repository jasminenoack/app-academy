Pokedex.RootView.prototype.createPokemon = function (attrs, callback) {
  var rootView = this;

  this.pokes.create(attrs.pokemon, {
    success: function (pkmn) {
      rootView.addPokemonToList(pkmn);

      if (callback) { callback(pkmn) };
    }
  })

};

Pokedex.RootView.prototype.submitPokemonForm = function (event) {
  event.preventDefault();
  console.log(this)

  this.createPokemon(
    $(event.currentTarget).serializeJSON(),
    this.renderPokemonDetail.bind(this));
};

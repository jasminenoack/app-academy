Pokedex.Router = Backbone.Router.extend({
  routes: {
    "": 'pokemonIndex',
    "pokemon/:id": 'pokemonDetail',
    "pokemon/:pokemonId/toys/:toyId": 'toyDetail'
  },

  pokemonDetail: function (id, callback) {
    if (!this._pokemonIndex) {
      this.pokemonIndex(this.renderPokemonDetail.bind(this, id, callback));
    } else {
      this._pokemonIndex.fetch({
        success: function () {
          this.renderPokemonDetail(id, callback)
        }.bind(this)
      })

    }

  },

  renderPokemonDetail: function (id, callback) {
    $("#pokedex .toy-detail").empty();
    this._pokemon = this._pokemonIndex.get(id);
    var detailView = new Pokedex.Views.PokemonDetail({model: this._pokemon});
    $("#pokedex .pokemon-detail").html(detailView.$el);
    detailView.refreshPokemon(callback);
  },

  pokemonIndex: function (callback) {
    var pokemonIndex = new Pokedex.Views.PokemonIndex();
    pokemonIndex.refreshPokemon({callback: callback});
    $("#pokedex .pokemon-list").html(pokemonIndex.$el);
    this._pokemonIndex = pokemonIndex.collection;
    this.pokemonForm();
  },

  toyDetail: function (pokemonId, toyId) {
    if (!this._pokemon) {
      this.pokemonDetail(pokemonId, this.toyDetail.bind(this, pokemonId, toyId));
    } else {

      var toy = this._pokemon.toys().get(toyId)
      var toyDetail = new Pokedex.Views.ToyDetail({model: toy, pokes: this._pokemonIndex});
      $("#pokedex .toy-detail").html(toyDetail.render(this._pokemonIndex).$el)
    }
  },

  pokemonForm: function () {
    var pokeForm = new Pokedex.Views.pokeForm(this._pokemonIndex);
    $('#pokedex .pokemon-form').html(pokeForm.render().$el);
  }
});


$(function () {
  new Pokedex.Router();
  Backbone.history.start();
});

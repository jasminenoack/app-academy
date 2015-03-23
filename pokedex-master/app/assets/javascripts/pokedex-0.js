window.Pokedex = (window.Pokedex || {});
window.Pokedex.Models = {};
window.Pokedex.Collections = {};

Pokedex.Models.Pokemon = Backbone.Model.extend({
  urlRoot: "pokemon",

  toys: function () {
    if (!this._toys) {
      this._toys = new Pokedex.Collections.PokemonToys;
    }

    return this._toys
  },

  parse: function (payload) {
    if (payload.toys) {
      this.toys().set(payload.toys)
      delete payload.toys
    }

    return payload
  }
});

Pokedex.Models.Toy = Backbone.Model.extend({
  urlRoot: "toys"
});

Pokedex.Collections.Pokemon = Backbone.Collection.extend({
  url: "pokemon",
  model: Pokedex.Models.Pokemon
});

Pokedex.Collections.PokemonToys = Backbone.Collection.extend({
  model: Pokedex.Models.Toy
});

window.Pokedex.Test = {
  testShow: function (id) {
    var pokemon = new Pokedex.Models.Pokemon({ id: id });
    pokemon.fetch({
      success: function () {
        console.log(pokemon.toJSON());
      }
    });
  },

  testIndex: function () {
    var pokemon = new Pokedex.Collections.Pokemon();
    pokemon.fetch({
      success: function () {
        console.log(pokemon.toJSON());
      }
    });
  }
};

window.Pokedex.RootView = function ($el) {
  this.$el = $el;
  this.pokes = new Pokedex.Collections.Pokemon();
  this.$pokeList = this.$el.find('.pokemon-list');
  this.$pokeDetail = this.$el.find('.pokemon-detail');
  this.$newPoke = this.$el.find('.new-pokemon');
  this.$toyDetail = this.$el.find('.toy-detail');

  // Click handlers go here.
  var rootView = this

  this.$pokeList.on("click", ".poke-list-item", function (event) {
    if ($(this).hasClass("on")) {
      rootView.$pokeDetail.find(".detail." + $(this).data("id")).remove();
      $(this).removeClass("on");
    } else {
      rootView.selectPokemonFromList($(this).data("id"))
    }
  });

  this.$newPoke.on("submit", rootView.submitPokemonForm.bind(rootView));

  this.$pokeDetail.on("click", ".toys li", rootView.selectToyFromList.bind(rootView))

  this.$toyDetail.on("change", "select", rootView.reassignToy.bind(rootView))
};

$(function() {
  var $rootEl = $('#pokedex');
	window.Pokedex.rootView = new Pokedex.RootView($rootEl);
  window.Pokedex.rootView.refreshPokemon();
});

window.Pokedex = (window.Pokedex || {});
window.Pokedex.Models = {};
window.Pokedex.Collections = {};

Pokedex.Models.Pokemon = Backbone.Model.extend({
  urlRoot: '/pokemon',

  // Phase II
  parse: function (payload) {
    if (payload.toys) {
      this.toys().set(payload.toys);
      delete payload.toys;

      // Phase IV
      this.toys().forEach((function (toy) {
        toy._pokemon = this;
      }).bind(this));
    }

    return payload;
  },

  // Phase II
  toys: function () {
    if (!this._toys) {
      this._toys =
        new Pokedex.Collections.PokemonToys([], { pokemon: this });
    }

    return this._toys;
  }
});

Pokedex.Models.Toy = Backbone.Model.extend({
  urlRoot: '/toys',

  // Phase IV
  pokemon: function () {
    if (!this._pokemon) {
      this._pokemon =
        new Pokedex.Models.Pokemon({ id: this.pokemon_id });
    }

    return this._pokemon;
  },

  // Phase IV
  parse: function (payload) {
    if (payload.pokemon) {
      this._pokemon =
        new Pokedex.Models.Pokemon(payload.pokemon, { parse: true });
      delete payload.pokemon;
    }

    return payload;
  }
});

Pokedex.Collections.Pokemon = Backbone.Collection.extend({
  model: Pokedex.Models.Pokemon,
  url: '/pokemon'
});

Pokedex.Collections.PokemonToys = Backbone.Collection.extend({
  model: Pokedex.Models.Toy,

  initialize: function(models, options) {
    this.pokemon = options.pokemon;
  }
});

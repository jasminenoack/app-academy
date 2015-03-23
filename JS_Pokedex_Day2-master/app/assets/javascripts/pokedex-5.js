Pokedex.Views = {}

Pokedex.Views.PokemonIndex = Backbone.View.extend({
  events: {
    "click .poke-list-item": "selectPokemonFromList"
  },

  initialize: function () {
    this.collection = new Pokedex.Collections.Pokemon();
    this.listenTo(this.collection, "sync", this.render)

  },

  addPokemonToList: function (pokemon) {
    var content =  JST["pokemonListItem"]({pokemon: pokemon});
    this.$el.append(content);
  },

  refreshPokemon: function (options) {
    console.log('refresh')
    this.collection.fetch({
      success: function () {
        if (options.callback) {
          options.callback();
        };
        this.listenTo(this.collection, "add", this.render)
      }.bind(this)
    });
  },

  render: function () {
    this.$el.empty();
    this.collection.each( this.addPokemonToList.bind(this) )
    return this;
  },

  selectPokemonFromList: function (event) {
    var $target = $(event.target);

    var pokeId = $target.data('id');
    var pokemon = this.collection.get(pokeId);

    Backbone.history.navigate("pokemon/" + pokeId, {trigger: true})
  }
});

Pokedex.Views.PokemonDetail = Backbone.View.extend({
  events: {
    "click .toy-list-item" : "selectToyFromList"
  },

  initialize: function () {
    this.listenTo(this.model.toys(), "remove", this.render)
  },

  refreshPokemon: function (callback) {
    this.model.fetch({
      success: function () {
        this.render();
        if (callback) {
          callback();
        }
      }.bind(this)

    })
  },

  render: function () {
    this.$el.empty()
    var content =  JST["pokemonDetail"]({pokemon: this.model});
    this.$el.append(content);

    var toys = this.model.toys()
    toys.each((function(toy) {
      var toyContent = JST["toyListItem"]({toy: toy})
      this.$el.find(".toys").append(toyContent);
    }).bind(this));

    return this;
  },

  selectToyFromList: function (event) {
    var $target = $(event.target);

    var toyId = $target.data('id');
    var pokeId = $target.data('pokemon-id');

    Backbone.history.navigate("pokemon/" + pokeId + "/toys/" + toyId, {trigger: true});
  }
});

Pokedex.Views.ToyDetail = Backbone.View.extend({
  events: {
    "change .toy-owner" : "reassignToy"
  },

  initialize: function (options) {
    this.pokes = options.pokes;
  },

  render: function () {
    console.log(this.model, this.pokes)
    var content = JST["toyDetail"]({toy: this.model, pokes: this.pokes});
    this.$el.append(content);
    return this;
  },

  reassignToy: function (event) {
    var $currentTarget = $(event.currentTarget);

    var pokemon = this.pokes.get($currentTarget.data("pokemon-id"));
    var toy = pokemon.toys().get($currentTarget.data("toy-id"));

    toy.set("pokemon_id", $currentTarget.val());
    toy.save({}, {
      success: (function () {
        pokemon.toys().remove(toy);
        this.$el.empty();
      }).bind(this)
    });
  }
});


Pokedex.Views.pokeForm = Backbone.View.extend({
  events: {
    "submit .new-pokemon" : "savePokemon"
  },

  initialize: function (collection) {
    this.newPokemon = new Pokedex.Models.Pokemon();
    this.collection = collection;
  },

  render: function () {
    var content = JST["pokemonForm"]();
    this.$el.append(content);
    return this;
  },

  savePokemon: function (event) {
    event.preventDefault();
    var data = $(event.target).serializeJSON()["pokemon"];
    this.collection.create(data, {
      success: function (pokemon) {
        Backbone.history.navigate("pokemon/" + pokemon.id, {trigger: true})
      }
    })


  }
});

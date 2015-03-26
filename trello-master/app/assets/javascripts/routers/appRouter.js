TrelloClone.Routers.AppRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.boards = new TrelloClone.Collections.Boards
    this.boards.fetch()
  },

  routes: {
    "": 'boardsIndex',
    "boards/new": "newBoard",
    "boards/:id": "showBoard",
  },

  boardsIndex: function () {
    var boardsIndexView =
      new TrelloClone.Views.BoardsIndex({collection: this.boards})
    this._swapView(boardsIndexView);
  },

  newBoard: function () {
    var $modal = $('<div class="modalDialog active"></div>')
    this.$rootEl.prepend($modal)

    var newBoard =
      new TrelloClone.Views.newBoardView({
        model: new TrelloClone.Models.Board,
        collection: this.boards
      })

      $modal.html(newBoard.render().$el);
  },

  showBoard: function (id) {
    var board = this.boards.getOrFetch(id);
    var showBoardView = new TrelloClone.Views.ShowView({model: board})

    this._swapView(showBoardView)
  },

  _swapView: function (view) {
    if (this.currentView) {
      this.currentView.remove();
    };

    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  }

})

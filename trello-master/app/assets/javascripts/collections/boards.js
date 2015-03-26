TrelloClone.Collections.Boards = Backbone.Collection.extend({
  model: TrelloClone.Models.Board,
// add a cmparator to sort for newest
  url: "api/boards",

  getOrFetch: function (id) {
    var board = this.get(id);

    if (!board) {
      board = new this.model({id: id});
    };

    board.fetch({
      success: function () {
        this.add(board, {merge: true});
      }.bind(this)
    });

    return board;
  }
})

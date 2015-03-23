// var Board = require("./board");

// var readline = require("readline");
// var reader = readline.createInterface( {
//   input: process.stdin,
//   output: process.stdout,
// });

var Game = function (reader, board) {
  this.reader = reader;
  this.board = board;
};

Game.prototype.run = function (completionCallback) {
  var b = this.board;
  var game = this;
  console.log("Welcome to Tic Tac Toe!");
  b.display();
  this.prompt( function (pos) {
    b.placeMark(pos);
    if (b.isWon() || b.draw()) {
      b.display()
      completionCallback();
    }
    else {
      game.run(completionCallback);
    }
  })
};

Game.prototype.prompt = function (callback) {
  this.reader.question((this.board.turn + ", make a move! (0-8)"), function (movePos) {
    var pos = parseInt(movePos);
    callback(pos);
  })
};

Game.prototype.endGame = function () {
  if (this.board.isWon()) {
    console.log(this.board.winner() + " wins!");
  }
  else {
    console.log("Tie game!");
  }
  this.reader.close()
};

module.exports = Game

var Board = function () {
  this.grid = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
  this.turn = "X";
};

Board.prototype.switchTurn = function () {
  this.turn = (this.turn === "X") ? "O" : "X";
};

Board.prototype.checkMark = function (pos) {
  return (this.grid[pos]);
};

Board.prototype.validMove = function (pos) {
  return (this.checkMark(pos) === " ");
};

Board.prototype.placeMark = function (pos) {
  if (this.validMove(pos)) {
    this.grid[pos] = this.turn;
    this.switchTurn();
  }
  else {
    console.log ("Invalid move")
  }
};

Board.prototype.display = function () {
  var g = this.grid;
  for (var i = 0; i < 3; i++) {
    console.log(g[i*3] + "|" + g[i*3+1] + "|" + g[i*3+2]);
    if (i < 2) {
      console.log("-----");
    }
  }
};

Board.prototype.winner = function () {
  var combo
  var grid = this.grid;
  var winner = false;
  for (var i = 0; i < Board.WINNING_COMBOS.length; i++){
    combo = Board.WINNING_COMBOS[i]
    if (grid[combo[0]] === " ") {
      continue;
    };

    if (grid[combo[0]] === grid[combo[1]] &&
      grid[combo[1]] === grid[combo[2]]) {
        winner = grid[combo[2]];
      }
  }
  return winner;
};

Board.prototype.isWon = function () {
  return (!!this.winner());
};

Board.prototype.draw = function () {
  return (this.isFull() && !this.isWon());
};

Board.prototype.isFull = function () {
  var full = true
  for (var i = 0; i < this.grid.length; i++) {
    if (this.grid[i] === " ") {
      full = false;
    }
  }
  return full;
};

Board.WINNING_COMBOS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
];

// b = new Board
// console.log(b.display());

module.exports = Board

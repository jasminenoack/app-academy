var Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  var grid = []
  for ( var i = 0; i < 8; i++) {
    var row = []
    row[7] = undefined
    grid.push(row)
  }
  return grid
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
  this.grid[3][4] = new Piece("black")
  this.grid[4][3] = new Piece("black")
  this.grid[3][3] = new Piece("white")
  this.grid[4][4] = new Piece("white")
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */

Board.prototype.getPiece = function (pos) {
  if (this.isValidPos(pos)) {
    return this.grid[pos[0]][pos[1]]
  } else {
    throw (new Error("Not valid pos!"))
  }
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  if (this.validMoves(color).length > 0) {
    return true
  } else {
    return false
  }
};

/**
 * Checks if every position on the Board is occupied.
 */
Board.prototype.isFull = function () {
  // console.log(this.grid)
  for(var i = 0; i < 8; i++) {
    for(var j = 0; j < 8; j++) {
      if (!this.isOccupied([i, j])) {
        return false
      }
    }
  }
  return true
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (!this.isOccupied(pos)) {
    return false
  }
  return this.getPiece(pos).color === color
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  if (this.getPiece(pos)) {
    return true
  } else {
    return false
  }
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  if (this.isFull()) {
    return true
  } else {
    return false
  }
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  if (
    pos[0] < 0 ||
    pos[0] > 7 ||
    pos[1] < 0 ||
    pos[1] > 7
  ) { return false}
  return true
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {
  var newPos = [pos[0] + dir[0], pos[1] + dir[1]];
  // console.log(newPos)

  if (!board.isValidPos(newPos))
  {
    return null
  } else if(
      board.isOccupied(newPos) &&
      board.getPiece(newPos).oppColor() === color
    ) {

    piecesToFlip.push(board.getPiece(newPos));
    var furtherPos = _positionsToFlip (board, newPos, color, dir, piecesToFlip);

    if(Array.isArray(furtherPos)) {
      return piecesToFlip
    } else {
      return null
    }
  } else if (
    board.isOccupied(newPos) &&
    board.getPiece(newPos).color === color
    ) {
      return piecesToFlip
  } else {
    return null;
  }
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  var piecesToFlip = this.captures(pos, color)

  if (piecesToFlip.length > 0) {
    this.grid[pos[0]][pos[1]] = new Piece(color)
    for (var i = 0; i < piecesToFlip.length; i++) {
      piecesToFlip[i].flip()
    }
  } else {
    throw (new Error("Invalid Move"))
  }
};

Board.prototype.captures = function (pos, color) {
  var piecesToFlip = [];
  var newFlips;
  for (var i = 0; i < Board.DIRS.length; i++) {
    newFlips = _positionsToFlip (this, pos, color, Board.DIRS[i], [])
    if (newFlips){
      piecesToFlip = piecesToFlip.concat(newFlips)
    }
  }
  return piecesToFlip
}

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  printString = " 01234567\n"
  for(var i = 0; i < 8; i++) {
    printString += i
    for (var j = 0; j < 8; j++){
      console.log [i, j]
      printString += this.grid[i][j] || "-"
    }
    printString += "\n"
  }
  console.log(printString)
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (
    !this.isOccupied(pos) &&
    this.captures(pos, color).length > 0
  ) {
    return true
  }
  return false
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  var piecePos = []
  var moves = []
  var option

  for(var i = 0; i < 8; i++) {
    for(var j = 0; j < 8; j++) {
      if ((i === 3 || i === 4) && (j === 3 || j === 4)) {
      }
      if (this.isOccupied([i, j]) && this.getPiece([i, j]).color === color) {
        piecePos.push([i, j])
      }
    }
  }

  for (var i = 0; i < piecePos.length; i++) {
    for (var j = 0; j < Board.DIRS.length; j++ ) {
      option = this.firstEmpty(piecePos[i], Board.DIRS[j], color)
      if (option) {
        moves.push(option)
      }
    }
  }
  return moves.sort()
};

// function _positionsToFlip (board, pos, color, dir, piecesToFlip)

Board.prototype.firstEmpty = function (pos, dir, color) {
  var canMove = false
  var newPos = [pos[0] + dir[0], pos[1] + dir[1]];

  while (
    this.isValidPos(newPos) &&
    this.isOccupied(newPos) &&
    this.getPiece(newPos).oppColor() === color
  ) {
    canMove = true
    newPos = [newPos[0] + dir[0], newPos[1] + dir[1]];
  }

  if ( canMove && this.isValidPos(newPos) && !this.isOccupied(newPos)) {
    return newPos
  }
  return false
}

module.exports = Board;

// b = new Board
// b.placePiece([2, 3], "black")

var readline = require('readline');
var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


var Hanoi = function(){
  this.stacks = [[3,2,1],[],[]];
};

Hanoi.prototype.isWon = function() {
  if (this.stacks[0].length === 0 &&
    (this.stacks[1].length === 0 || this.stacks[2].length === 0)) {
    return true;
  }
  return false;
};

Hanoi.prototype.isValidMove = function(startTowerIdx, endTowerIdx) {
  var start = this.stacks[startTowerIdx];
  var end = this.stacks[endTowerIdx];

  if (start.length === 0) {
    return false;
  }

  if (end.length === 0) {
    return true;
  }
  else if (end[end.length - 1] > start[start.length - 1]) {
    return true;
  }
  else {
    return false;
  }
};

Hanoi.prototype.move = function(startTowerIdx, endTowerIdx) {
  var start = this.stacks[startTowerIdx];
  var end = this.stacks[endTowerIdx];

  if (this.isValidMove(startTowerIdx, endTowerIdx)) {
    end.push(start.pop());
    return true;
  }
  return false;
};

Hanoi.prototype.print = function () {
  console.log(JSON.stringify(this.stacks));
};

Hanoi.prototype.promptMove = function (callback) {
  this.print();
  reader.question("Where would you like to move from?", function (startTowerIdx) {
    reader.question("Where would you like to move to?", function (endTowerIdx) {
     var start = parseInt(startTowerIdx);
     var end = parseInt(endTowerIdx);

      callback(start, end);
    });
  });
};

Hanoi.prototype.run = function (completionCallback) {
  var hanoi = this;
  hanoi.promptMove(function (start, end) {
    moved = hanoi.move(start, end)
    if (!moved) {
      console.log("Invalid move!");
    }
    if ( !hanoi.isWon() ) {
      hanoi.run(completionCallback);
    }
    else {
      completionCallback();
    }
  });
};


hanoi = new Hanoi();
hanoi.run(function() {
  console.log("Congrats! You've won!");
  reader.close();
});

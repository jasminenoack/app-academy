var TTT = require("./");
var readline = require('readline');
var reader = readline.createInterface( {
  input: process.stdin,
  output: process.stdout
});
var g = new TTT.Game(reader, new TTT.Board);


g.run(g.endGame.bind(g));

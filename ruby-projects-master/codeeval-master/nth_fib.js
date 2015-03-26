var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line != "") {
        sequence=[0,1];
        place = parseInt(line);
        for (i=sequence.length-1; i<place; i++) {
          var numberOf = sequence.length
          sequence[numberOf]=sequence[numberOf-1]+sequence[numberOf-2]
        }
        console.log(sequence[place])
    }
});

var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line != "") {
      line = line.split(' ')
      for (var i=0; i<line.length; i++){
        line[i]=parseInt(line[i])
      }
      var results=[]
      for (i=1; i<=line[2]; i++){
        if (i%line[0]==0 && i%line[1]==0){
          results[results.length]="FB"
        }
        else if (i%line[0]==0){
          results[results.length]="F"
        }
        else if (i%line[1]==0){
          results[results.length]="B"
        }
        else {
          results[results.length]=i
        }
      }

      console.log(results.join(' '))
    }
});
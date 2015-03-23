function Clock () {
}

Clock.TICK = 5000;

Clock.prototype.printTime = function () {
  // Format the time in HH:MM:SS

  console.log(this.hours + ":" + this.minutes + ":" + this.seconds)
};

Clock.prototype.run = function () {
  // 1. Set the currentTime.
  this.date = new Date();
  this.seconds = this.date.getSeconds();
  this.minutes = this.date.getMinutes();
  this.hours = this.date.getHours();
  // 2. Call printTime.
  this.printTime();
  // 3. Schedule the tick interval.
  setInterval(clock._tick.bind(clock), Clock.TICK);
};

Clock.prototype._tick = function () {
  // 1. Increment the currentTime.
  this.seconds += 5;
  if (this.seconds > 59) {
    this.seconds -= 60;
    this.minutes += 1;
    if (this.minutes > 59){
      this.minutes -= 60;
      this.hours += 1;
    }
  }
  // 2. Call printTime.
  this.printTime();
};

/*var clock = new Clock();
clock.run();*/

var readline = require('readline');
var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {

  function increment (answer) {
    var num = parseInt(answer);
    sum += num;
    console.log(sum);
    addNumbers(sum, numsLeft - 1, completionCallback)
  }


  if (numsLeft > 0) {
    reader.question("What is the next number?", increment)
  } else {
    completionCallback(sum)
  }

}


function completionCallback(sum) {
  return sum
}

// addNumbers(0, 3, function (sum) {
//   console.log("Total Sum: " + sum);
// });




function askIfGreaterThan(el1, el2, callback) {

  reader.question("Is "+el1+" greater than "+el2+"?", function (answer) /* yes or no */ {
    if (answer === "yes") {
      callback(true);
    }
    else {
      callback(false);
    }
  })
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i+1], function(isGreaterThan) {
      if (isGreaterThan) {
        var temp = arr[i];
        arr[i] = arr[i+1];
        arr[i+1] = temp;
        madeAnySwaps = true;
      }

      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    })
  }
  else {
    outerBubbleSortLoop(madeAnySwaps);
  }
}

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop)
    }
    else {
      sortCompletionCallback(arr)
    }
  }

  outerBubbleSortLoop(true)
}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});



































//

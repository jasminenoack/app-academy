'use strict'

// my uniq
// arr[arr.length] = value
var arr = ["lydia", "jasmine", "donald", "lydia"];

Array.prototype.uniq = function() {
  var newArr = [];
  for (var i = 0; i < this.length; i++ ) {
    var unique = true
    for (var j = 0; j < newArr.length; j++) {
      if( this[i] === newArr[j] ) {
        unique = false
      };
    };
    if (unique) {
      newArr[newArr.length] = this[i];
    };
  };
  return newArr
};

// console.log(["lydia", "jasmine", "donald", "lydia"].uniq());


// console.log(uniq(arr))
// two sum


var arr = [1,2,5,-4,4,-2,-1]

Array.prototype.twoSum = function() {
  var newArr = []
  for (var i = 0; i < this.length - 1; i ++) {
    for (var j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        newArr.push([i,j])
      }
    }
  }
  return newArr
};
// console.log([1,2,5,-4,4,-2,-1].twoSum())

// console.log(twoSum(arr))

var rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ];

  Array.prototype.myTranspose = function(){
  var newArray = []

  for ( i = 0; i < this.length; i++) {
    newArray.push([]);
  }

  for ( var i = 0; i < this.length; i++) {
    var rowLength = this[i].length;
    var row = this[i];
    for ( var j = 0; j < row.length; j++) {
      newArray[j].push(row[j])
    };
  };
  return newArray
};

// console.log([
  //   [0, 1, 2],
  //   [3, 4, 5],
  //   [6, 7, 8]
  // ].myTranspose())

// console.log(myTranspose(rows))

// my_each
arr = [1,2,3,4,5]

var addTwo = function(num) {
  console.log(num + 2)
}

Array.prototype.myEach = function(fun) {
  for (var i = 0; i < this.length; i++ ) {
    fun(this[i]);
  };
  return this
};

// myEach(arr, addTwo)
// mymap

var addTwo = function(num) {
  return num + 2
}

Array.prototype.myMap = function(fun) {
  newArr = []
  var addToArray = function(val) {
    newArr.push(fun(val));
  }
  var result = this.myEach( addToArray);
  return newArr;
}

// console.log(myMap(arr, addTwo))



var fun = function(accum, element) {
  return accum + element
}
arr = [0,1,2,3,4,5]
//myinject

// var myEach = function(arr, fun) {
//   for (var i = 0; i < arr.length; i++ ) {
//     fun(arr[i]);
//   };
//   return arr
// };

Array.prototype.myInject = function( fun) {
  var accum = undefined;
  var doIteratively = function(val) {
    if (!accum && accum !== 0){
      accum = val;
    }
    else {
      accum = fun(accum, val);
    }
  };
  this.myEach(doIteratively);
  return accum;
}

// console.log(myInject(arr, fun))





//BUBBLE SORT

var arr = [1,700,6,345,89];

Array.prototype.bubble = function(arr) {
  "use strict";
  var c;
  var sorted = false;
  while (!sorted) {
    sorted = true;
    for (var i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i + 1]) {
        sorted = false;
        c = this[i];
        this[i] = this[i + 1];
        this[i + 1] = c;
      }
    }
  }
  return this
}

// console.log(bubble(arr))

// substrings

var string = "hell"

String.prototype.substrings = function() {
  arr = ['']
  for (var i = 0; i <= this.length; i++) {
    for (var j = i + 1; j <= this.length; j++) {
        arr.push(this.substring(i,j))
      }
  }
  return arr
};

// console.log(substrings(string))

//RANGE

var range = function(start, end) {
  if (start < end) {
    var arr = [start];
    var nums = range(start + 1, end)
    arr = arr.concat(nums);
  }
  else {
    console.log("else")
    return [end]
  }
  return arr;
}

// console.log(range(1,5))

// # recursion 1
// exp(b, 0) = 1
// exp(b, n) = b * exp(b, n - 1)
//
// # recursion 2
// exp(b, 0) = 1
// exp(b, 1) = b
// exp(b, n) = exp(b, n / 2) ** 2             [for even n]
// exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]


var exp1 = function(num, exp) {
  if (exp === 0) {
    return 1
  }
  else {
    var total = num * exp1(num, exp - 1)
  }
  return total;
}

// console.log(exp1(3,4))

var exp2 = function(num, exp) {
  if (exp === 0) {
    return 1
  }
  else if (exp % 2 === 0) {
    var call = exp2(num, exp / 2)
    var total = call * call
  }
  else {
    var call = exp2(num, (exp - 1) / 2)
    var total = num * call * call
  }
  return total
}

// console.log(exp2(3,4))

//DEEP DUP

var dup = function(arr) {
  var newArr = []
  arr.forEach(function (el){
    if (!Array.isArray(el)) {
      var duped = el
    }
    else {
      var duped = dup(el)
    }
    newArr.push(duped)
  })
  return newArr
}

// console.log(dup([1,2,3,[4,5,[6,7]]]))

//FIBONACCI

var fibs = function(n) {
  if (n === 1) {
    return [0]
  }
  else if (n === 2) {
    return [0,1]
  }
  else if (n <= 0) {
    return []
  }
  else {
    var fibNums = fibs(n-1)
    var len = fibNums.length
    fibNums[len] = fibNums[len - 1] + fibNums[len - 2]
  }
  return fibNums
}

// console.log(fibs(0))


Array.prototype.binary = function(target) {
  var midIndex = Math.floor(this.length / 2);
  if (this.length === 0) {
    return null;
  }
  else if (this[midIndex] === target) {
    return midIndex;
  }
  else if (this[midIndex] > target) {
    var newArray = this.slice(0,midIndex);
    // console.log(this.slice(0,midIndex))
    return newArray.binary(target);
  }
  else {
    var newArray = this.slice( midIndex + 1, this.length );
    // console.log(arr.slice(midIndex + 1, arr.length))
    return midIndex + 1 + newArray.binary(target);
  }

}

// console.log(binary([], 1));
// console.log(binary([1, 2, 3], 1));
// console.log(binary([2, 3, 4, 5], 3));
// console.log(binary([2, 4, 6, 8, 10], 6));
// console.log(binary([1, 3, 4, 5, 9], 5));
// console.log(binary([1, 2, 3, 4, 5, 6], 6));
// console.log(binary([1, 2, 3, 4, 5, 6], 0));
// console.log(binary([1, 2, 3, 4, 5, 7], 6));
// console.log(binary([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17], 15))



//MAKE CHANGE

var makeChange = function(val, arr) {
  if (val === 0) { return [] }
  var coin = arr.shift();
  var coins = [];
  var numCoin = Math.floor(val / coin);
  for (var i = 0; i < numCoin; i ++) {
    coins.push(coin);
  };
  val -= coin * numCoin;
  var smallCoins = makeChange(val, arr);
  return coins.concat(smallCoins)
}

// console.log(makeChange(14, [10, 7, 1]))

var makeChange2 = function(val, arr) {
  if (val === 0) { return [] }
  var coin = arr[0];
  var coins = [];
  if (val > coin) {
    coins.push(coin);
    val -= coin;
  }
  else {
    coins.shift
  }
  var smallCoins = makeChange(val, arr);
  return coins.concat(smallCoins)
}

// console.log(makeChange2(34, [10, 7, 1]))

// var makeChange = function(val, arr) {
//   if (val === 0) { return [] }
//   var coins = [];
//   var smallCoins = [];
//   var coinSets = [];
//   console.log ("val",val);
//
//   arr.forEach(function (el){
//     newArr = dup(arr)
//     // console.log("el: " + el)
//     var coin = el
//
//     if (val >= coin) {
//       coins.push(coin);
//       var newVal = val - coin;
//     }
//     else {
//       // console.log("Else")
//       newArr.shift()
//     var newVal = val
//     }
//     // console.log(newVal, arr)
//     console.log("input", newVal, newArr)
//     smallCoins = makeChange(newVal, newArr);
//     console.log("vars", smallCoins, coins)
//     coins.concat(smallCoins)
//     // console.log ("smallcoin: ", smallCoins)
//     coinSets.push(smallCoins)
//   })
//   console.log("sets", coinSets)
//   while (coinSets.length > 1) {
//     if (coinSets[0].length < coinSets[1].length && coinSets[0].length !== 0) {
//       coinSets.splice(1,1);
//     }
//     else {
//       coinSets.shift()
//     }
//   }
//   return coinSets[0]
//
// //  var smallCoins = makeChange(val - coin, arr);
// }


var makeChange = function(val, arr) {
  // console.log ("start", val, arr)
  if (val === 0) { return [] }
  var smallCoins = []
  var coinSets = [];

  // console.log ("val", val)

  // console.log("before loop")
  arr.forEach(function (el, i){
    var coins = [];
    var newVal = val
    // console.log(el)
    var coin = el;
    var newArr = dup(arr)
    if (val >= coin) {
      // console.log ("if")
      coins.push(coin);
      newVal = val - coin;
      smallCoins = makeChange(newVal, newArr.slice(i,newArr.length));
      coins = coins.concat(smallCoins)
      coinSets.push(coins)
      console.log(coinSets)
    }
    else {

    }
  })
  var minArray = coinSets[0]
  for(var i = 0; i < coinSets.length; i++) {
    if (minArray.length > coinSets[i].length) {
      minArray = coinSets[i];
    }
  }
  // smallCoins = coins.concat(makeChange(newVal, newArr));
  // for (var )
  // console.log(smallCoins)
  // return smallCoins
  return minArray
}


// console.log(makeChange(14, [10, 7, 1]))







var makeChange = function(target, coins) {
  if (target === 0) { return [] }
  var bestCoins = null;

  coins.forEach(function (coin, i){
    if (coin > target) {
      return
    };
    var remainder = target - coin;
    var currentCoins = [coin];
    var remainderCoins = makeChange(remainder, coins.slice(i));
    currentCoins = currentCoins.concat(remainderCoins);
    if (!bestCoins || currentCoins.length < bestCoins.length) {
      bestCoins = currentCoins
    }
  });
  console.log(bestCoins)
  return bestCoins;
}

// console.log(makeChange(56, [10, 7, 1]))

// merge sort
"use strict"
var mergeHelper = function(left, right) {
  var new_array = []
  while ( left.length != 0 && right.length != 0 ) {
    if (left[0] < right[0]) {
      new_array.push(left.shift())
    } else {
    new_array.push(right.shift())
    }
  }
  new_array = new_array.concat(left).concat(right)
  return(new_array)
}

Array.prototype.mergeSort = function() {
  if (this.length === 1) {return this}
  var middleIndex = Math.floor(this.length / 2)
  var arrLeft = this.slice(0,middleIndex)
  var arrRight = this.slice(middleIndex)

  arrLeft = arrLeft.mergeSort()
  arrRight = arrRight.mergeSort()

  mergedArray = mergeHelper(arrLeft, arrRight)
  return mergedArray
};

// console.log(mergeSort([1,3,4,7,2,3,1]))
// console.log(mergeHelper([1],[2]))

//subsets


Array.prototype.subsets = function() {
  if (this.length === 0) { return [[]] }

  var currentSets = this.slice(1).subsets()
  var setsLength = currentSets.length

  for (var i = 0; i < setsLength; i++) {
    currentSets.push(currentSets[i].concat(this[0]))
  }

  return currentSets
}

console.log (subsets([1,2,3]))

// Prototypes

function Cat(name, owner) {
  this.name = name;
  this.owner = owner
}

var sennacy = new Cat("sennacy", "jonathan")

Cat.prototype.cuteStatement = function() {
  return ( this.owner + " loves " + this.name)
}
Cat.prototype.meow = function() {
  return "meow"
}

// Students and courses

// Student#course_load should return a hash of departments to # of credits the student is taking in that department.


function Student(fName, lName) {
  this.fName = fName;
  this.lName = lName;
  this.courses = []
}

Student.prototype.name = function() {
  return (this.fName + " " + lName)
}

Student.prototype.enroll = function(course) {
  alreadyTaken = false

  this.courses.forEach(function(el) {
    if (el.courseName === course.courseName) { alreadyTaken = true }
  })

  if (alreadyTaken) { return }
  this.courses.push(course);
  course.students.push(this)
}

Student.prototype.courses = function() {
  this.courses
}

Student.prototype.course_load = function(){
  creditsPer = {}
  this.courses.forEach( function (el){
    if (creditsPer[el.department]) {
      creditsPer[el.department] += el.credits
    }
    else {
      creditsPer[el.department] = el.credits
    }
  })
  return creditsPer
}

function Course(courseName, department, credits) {
  this.courseName = courseName;
  this.department = department;
  this.credits = credits;
  this.students = []
}

Course.prototype.students = function() {
  this.students
}

Course.prototype.add_student = function (student) {
  student.enroll(this)
}

bill = new Student("bill", "ned")
ned = new Student("ned", "ned")
algebra = new Course("algebra", "math", 3)
algebra2 = new Course("algebra2", "math", 3)
art= new Course("art", "art", 3)











































//

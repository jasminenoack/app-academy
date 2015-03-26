function prime(num) {
  for (i=2; i<=num/2; i++) {
    if (num%i==0) {
      return false
    }
  }
  return true
}

function sum (array) {
  total=0
  for (i=0; i<array.length; i++){
    total+=array[i]
  }
  return total
}



var primes=[]
var num=2
while (primes.length<1000) {
  if (prime(num)) {
    primes[primes.length]=num
  };

  num++;
}

console.log(primes.length)
console.log(sum(primes))


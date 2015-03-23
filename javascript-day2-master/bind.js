Function.prototype.myBind = function(context) {
  fn = this
  return function () {
    fn.apply(context)
  };
}

var cat = {
  name: "sennacy"
}

var hello = function () {
  console.log(this.name)
}

// cat.hello()
hello.myBind(cat)()

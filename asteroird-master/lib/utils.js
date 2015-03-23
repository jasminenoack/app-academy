// Utility code, especially vector math stuff.
;(function() {
  if (window.Asteroids === undefined) {
    window.Asteroids = {};
  };

  Asteroids.Util = function () {

  };

  Asteroids.Util.VECTOR = 4

  Asteroids.Util.inherits = function (child, parent) {
    function Surrogate () {};
    Surrogate.prototype = parent.prototype;
    child.prototype = new Surrogate;
  };

  Asteroids.Util.randomVec = function (length) {
    var length = typeof length !== 'undefined' ? length :
      Math.random() * Asteroids.Util.VECTOR;

    var x = Math.random() * length;
    var y = Math.sqrt((length * length) - (x * x));

    x *= Math.random() < .5 ? 1 : -1
    y *= Math.random() < .5 ? 1 : -1

    return [x, y];
  };


})();

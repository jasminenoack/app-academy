// Spacerock. It inherits from MovingObject
;(function() {
  if (window.Asteroids === undefined) {
    window.Asteroids = {};
  };

  Asteroids.Asteroid = function (pos, game, length) {
    Asteroids.MovingObject.call(this,
                                pos,
                                Asteroids.Util.randomVec(length),
                                Asteroids.Asteroid.RADIUS,
                                Asteroids.Asteroid.COLOR,
                                game
    );

    this.name = "asteroid";
  };

  Asteroids.Util.inherits(Asteroids.Asteroid, Asteroids.MovingObject);

  Asteroids.Asteroid.COLOR = "red";
  Asteroids.Asteroid.RADIUS = 10;

  Asteroids.Asteroid.prototype.isCollidedWith = function (otherObject) {
    if (otherObject.name === "asteroid") {
      var xDistance = Math.abs(this.pos[0] - otherObject.pos[0]);
      var yDistance = Math.abs(this.pos[1] - otherObject.pos[1]);
      var minDistance = (this.radius + otherObject.radius - 5);

      if (xDistance < minDistance && yDistance < minDistance) {
        this.vel = Asteroids.Util.randomVec()
        otherObject.vel = Asteroids.Util.randomVec()
      };
      return false;
    } else {
      return Asteroids.MovingObject.prototype.isCollidedWith.call(this, otherObject)
    };
  };

})();

// Kill spacerocks with this. Also a MovingObject subclass.
;(function() {
  if (window.Asteroids === undefined) {
    window.Asteroids = {};
  };

  Asteroids.Bullet = function (pos, vel, game) {
    Asteroids.MovingObject.call(this,
                                pos,
                                vel,
                                Asteroids.Bullet.RADIUS,
                                Asteroids.Bullet.COLOR,
                                game
    );
    this.name = "bullet";
  };

  Asteroids.Bullet.RADIUS = 5
  Asteroids.Bullet.COLOR = "green"

  Asteroids.Util.inherits(Asteroids.Bullet, Asteroids.MovingObject);

  Asteroids.Bullet.prototype.isCollidedWith = function (otherObject) {

    var xDistance = Math.abs(this.pos[0] - otherObject.pos[0]);
    var yDistance = Math.abs(this.pos[1] - otherObject.pos[1]);
    var minDistance = (this.radius + otherObject.radius) - 5;

    if (xDistance < minDistance && yDistance < minDistance) {
      if (otherObject.name === "asteroid") {
        // console.log ( "bullet collide")
        this.game.remove(this);
        this.game.remove(otherObject);
      } else {
        // console.log ( "bullet collide")
        // this.game.remove(this);
      }
    }
    return false
  };

})();

// This is you! Another MovingObject subclass.
;(function() {
  if (window.Asteroids === undefined) {
    window.Asteroids = {};
  };

  Asteroids.Ship = function (game) {
    Asteroids.MovingObject.call(this,
                                [Asteroids.Game.DIM_X/2, Asteroids.Game.DIM_Y/2],
                                [0,0],
                                Asteroids.Ship.RADIUS,
                                Asteroids.Ship.COLOR,
                                game
    );

    this.name = "ship";
  };

  Asteroids.Ship.COLOR = "blue";
  Asteroids.Ship.RADIUS = 2;


  Asteroids.Util.inherits(Asteroids.Ship, Asteroids.MovingObject);

  Asteroids.Ship.prototype.relocate = function () {
    this.alive = true;

    this.radius += 2;
    // if (this.radius > 300) {
    //   this.radius = 2;
    // };

    // this.pos = [Asteroids.Game.DIM_X/2, Asteroids.Game.DIM_Y/2];
  };

  Asteroids.Ship.prototype.power = function (impulse){
    var vel = this.vel
    this.vel = [vel[0] + impulse[0], vel[1] + impulse[1]];

    if (this.vel[0] > 8) {
      this.vel[0] = 8;
    } else if (this.vel[0] < -8) {
      this.vel[0] = -8;
    };

    if (this.vel[1] > 8) {
      this.vel[1] = 8;
    } else if (this.vel[1] < -8) {
      this.vel[1] = -8;
    };
  };

  Asteroids.Ship.prototype.fireBullet = function () {
    var bullet = new Asteroids.Bullet(this.pos, this.vel, this.game);
    this.game.bullets.push(bullet);
  };

})();

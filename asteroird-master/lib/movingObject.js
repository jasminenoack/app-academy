// Base class for anything that moves.
// Most important methods are #move, #draw(ctx), #isCollidedWith(otherMovingObject).

;(function() {
  if (window.Asteroids === undefined) {
    window.Asteroids = {};
  };


  Asteroids.MovingObject = function (pos, vel, radius, color, game) {
    this.pos = pos;
    this.vel = vel;
    this.radius = radius;
    this.color = color;
    this.game = game;
    this.alive = true;
  };

  Asteroids.MovingObject.prototype.draw = function (ctx) {
    if (this.alive) {
      ctx.fillStyle = this.color;
      ctx.beginPath();
      ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
      ctx.fill();
    };
  };

  Asteroids.MovingObject.prototype.move = function () {
    this.pos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];
    this.game.wrap(this.pos);
  };

  Asteroids.MovingObject.prototype.isCollidedWith = function (otherObject) {
    var xDistance = Math.abs(this.pos[0] - otherObject.pos[0]);
    var yDistance = Math.abs(this.pos[1] - otherObject.pos[1]);
    var minDistance = (this.radius + otherObject.radius) - 5;

    if (xDistance < minDistance && yDistance < minDistance) {
      return true;
    };

    return false;
  };






})();

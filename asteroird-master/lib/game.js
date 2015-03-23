// Holds collections of the asteroids, bullets, and your ship.
// #step method calls #move on all the objects, and #checkCollisions checks for colliding objects.
// #draw(ctx) draws the game.
// Keeps track of dimensions of the space; wraps objects around when they drift off the screen.
;(function() {
  if (window.Asteroids === undefined) {
    window.Asteroids = {};
  };

  Asteroids.Game = function () {
    this.asteroids = [];
    this.ship = new Asteroids.Ship(this);
    this.bullets = [];
    this.asteroids = this.addAsteroids();
  };

  Asteroids.Game.DIM_X = 800;
  Asteroids.Game.DIM_Y = 800;
  Asteroids.Game.NUM_ASTEROIDS = 80;

  Asteroids.Game.prototype.randomPosition = function () {
    var x = Math.random() * Asteroids.Game.DIM_X;
    var y = Math.random() * Asteroids.Game.DIM_Y;
    return [x, y];
  };

  Asteroids.Game.prototype.allObjects = function () {
    return this.bullets.concat([this.ship]).concat(this.asteroids);
  };

  Asteroids.Game.prototype.addAsteroids = function () {
    var asteroids = []
    for(var i = 0; i < Asteroids.Game.NUM_ASTEROIDS; i++) {
      asteroids.push (this.createAsteroid());
    };

    return asteroids;
  };

// fix
  Asteroids.Game.prototype.createAsteroid = function () {
    var overlap = true;
    var asteroid;

    while (overlap) {
      overlap = false;
      asteroid = new Asteroids.Asteroid (this.randomPosition(), this);

      // for(var i = 0; i < this.asteroids.length; i++) {
      //   if (Asteroids.MovingObject.prototype.isCollidedWith.call(asteroid, this.asteroids[i])){
      //     overlap = true;
      //   };
      // };
    };
    return asteroid;
  };

  Asteroids.Game.prototype.draw = function (ctx) {
    console.log("draw")
    var allObjects = this.allObjects()

    ctx.clearRect(0,0,Asteroids.Game.DIM_X,Asteroids.Game.DIM_Y);

    for (var i = 0; i < allObjects.length; i++) {
      allObjects[i].draw(ctx);
    }
  };

  Asteroids.Game.prototype.wrap = function (pos) {
    if (pos[0] > Asteroids.Game.DIM_X ) {
      pos[0] -= Asteroids.Game.DIM_X;
    } else if (pos[0] < .001) {
        pos[0] += Asteroids.Game.DIM_X;
    };

    if (pos[1] > Asteroids.Game.DIM_X ) {
      pos[1] -= Asteroids.Game.DIM_X;
    } else if (pos[1] < .001) {
        pos[1] += Asteroids.Game.DIM_X;
    };
  };

  Asteroids.Game.prototype.moveObjects = function () {
    var allObjects = this.allObjects()

    for (var i = 0; i < allObjects.length; i++) {
      if (!allObjects[i].alive) {
        continue;
      };

      allObjects[i].move();
    };
  };

  Asteroids.Game.prototype.checkCollisions = function () {
    var allObjects = this.allObjects()

    for (var i = 0; i < allObjects.length - 1; i++) {
      if (!allObjects[i].alive) {
        continue;
      };

      for (var j = i + 1; j < allObjects.length; j++) {
        if (!allObjects[j].alive) {
          continue;
        };

        if (allObjects[i].isCollidedWith(allObjects[j])) {
          this.remove(allObjects[i]);
          this.remove(allObjects[j]);

          this.ship.relocate();
        };
      };
    };
  };

  Asteroids.Game.prototype.step = function () {
    this.checkCollisions()
    this.moveObjects();
  };

  Asteroids.Game.prototype.remove = function (object) {
    object.alive = false
  };



})();

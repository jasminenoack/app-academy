// Stores a Game instance.
// Stores a canvas context to draw the game into.
// Installs key listeners to move the ship and fire bullets.
// Installs a timer to call Game#step.
;(function() {
  if (window.Asteroids === undefined) {
    window.Asteroids = {};
  };

  Asteroids.GameView = function (ctx) {
    this.game = new Asteroids.Game;
    this.ctx = ctx;
  };

  Asteroids.GameView.prototype.start = function () {
    var game = this.game
    var ctx = this.ctx
    var gameView = this
    gameView.bindKeyHandlers()

    var step = function () {
      game.step();
      game.draw(ctx);
    };

    setInterval(step, 20);
  };

  Asteroids.GameView.prototype.bindKeyHandlers = function () {
    var ship = this.game.ship
    console.log (ship)
    key('up', function(){ ship.power([0, -5]) });
    key('down', function(){ ship.power([0, 5])});
    key('right', function(){ ship.power([5, 0]) });
    key('left', function(){ ship.power([-5, 0]) });
    key('space', function(){ ship.fireBullet() });
  };

})();

(function () {
  $.Carousel = function ($el) {
    this.$el = $el;
    this.$items = this.$el.find("li")

    this.activeIdx = 0;


    this.$el.find(".slide-left").on("click", function () {
      this.slideLeft();
    }.bind(this));
    this.$el.find(".slide-right").on("click", function () {
      this.slideRight();
    }.bind(this));

    this.resetActiveItem();
    this.transitioning = false;
  };

  $.Carousel.prototype.slide = function (dir, classDir, outDir) {
    if (this.transitioning) {
      return;
    };
    this.transitioning = true;

    var carouselLength = this.$items.length;
    var $oldActiveItem = this.$activeItem;

    // javascript is terrible so we have to do this ridiculous work around to make the modulo operator work appropriately.
    this.activeIdx = (this.activeIdx + dir + carouselLength) % carouselLength;
    this.resetActiveItem();

    this.$activeItem.addClass("active " + classDir);

    setTimeout( function () {
      $oldActiveItem.addClass(outDir);
      this.$activeItem.removeClass(classDir);

      this.$activeItem.one("transitionend", function (event) {
        $oldActiveItem.removeClass();
        this.transitioning = false;
      }.bind(this));

    }.bind(this));
  };

  $.Carousel.prototype.resetActiveItem = function () {
    this.$activeItem = this.$items.eq(this.activeIdx);
  };

  $.Carousel.prototype.slideLeft = function () {
    this.slide(-1, "left", "right");
  };

  $.Carousel.prototype.slideRight = function () {
    this.slide(1, "right", "left");
  };


})()

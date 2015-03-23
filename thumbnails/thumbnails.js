;(function () {

$.Thumbnails = function (el) {
  this.$el = $(el);
  this.$activeImg = this.$el.find(".bigimages .active");
  this.bindClick();
  this.bindMouse();
  this.thumbnailIdx = 0;
  this.$images   = this.$el.find(".thumbnails li");
  this.thumbnailBindClick();
  this.fillThumbnails();
};

$.Thumbnails.prototype.activate = function ($selectedImg, setActive) {
  this.$el.find(".bigimages li").removeClass("active");
  if (setActive) {
    this.$activeImg = $selectedImg;
  }

  $selectedImg.addClass("active");
};

$.Thumbnails.prototype.bindClick = function () {
  var thumbnails = this;

  this.$el.find(".thumbnails").on("click", "li", function (event) {
    var $selectedImg = thumbnails.findSelectedImg($(this))

    thumbnails.activate($selectedImg, true);
  });
};

$.Thumbnails.prototype.bindMouse = function () {
  var thumbnails = this;
  console.log(this.$el.find(".thumbnails"))

  this.$el.find(".thumbnails").on("mouseover", "li", function (event) {
    console.log("mouseover")
    var $selectedImg = thumbnails.findSelectedImg($(this))

    thumbnails.activate($selectedImg, false);
  });

  this.$el.find(".thumbnails").on("mouseleave", "li",
      this.resetActiveImg.bind(this));
};

$.Thumbnails.prototype.findSelectedImg = function ($li) {
  var activeIdx = $li.index();
  return this.$el.find(".bigimages li").eq(activeIdx);
};

$.Thumbnails.prototype.resetActiveImg = function () {
  console.log("reset")
  this.activate(this.$activeImg, false);
};

$.Thumbnails.prototype.fillThumbnails = function () {
  var i;
  this.$images.removeClass("active foo");

  for (i = 0; i < 4; i++) {
    this.$images.eq(i + this.thumbnailIdx).addClass("active");
  }
};

$.Thumbnails.prototype.thumbnailBindClick = function () {
  var $buttons = this.$el.find(".thumbnail-nav button");
  var that = this;

  $buttons.on("click", function (event) {
    console.log($(this).index());
    if ( $(this).index() === 0 ) {
      that.moveThumbnails(-1);
    } else {
      that.moveThumbnails(1);
    };
  });
}

$.Thumbnails.prototype.moveThumbnails = function (dir) {
  if ( (dir === -1 && this.thumbnailIdx === 0) ||
    (dir === 1 && this.thumbnailIdx === this.$images.length - 4)) {
      return;
    };

  this.$images.removeClass();
  this.thumbnailIdx += dir;

  this.fillThumbnails();
};

$.fn.Thumbnails = function () {
  return this.each(function () {
    new $.Thumbnails(this);
  });
};
})();

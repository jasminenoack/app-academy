$.FollowToggle = function (el, options) {
  this.$el = $(el);
  this.userID = this.$el.data("user-id") || options.userId;
  this.followState = this.$el.data("initial-follow-state") || options.followState;
  this.render();

  this.$el.on("click", this.handleClick.bind(this));
};

$.FollowToggle.prototype.render = function () {
  if( this.followState === "following" || this.followState === "unfollowing" ){
    this.$el.prop("disabled", true);
  } else {
    this.$el.prop("disabled", false);
    this.$el.text(this.followState === "followed" ? "Unfollow!" : "Follow!");
  }
};

$.FollowToggle.prototype.handleClick = function (event) {
  var button = this;

  var oppositeState = (button.followState === "followed") ?
    "unfollowed" :
    "followed";

  button.followState = (button.followState === "followed") ?
    "unfollowing" :
    "following";
  button.render();

  event.preventDefault();


  $.ajax({
    url: ("/users/" + button.userID + "/follow"),
    type: (button.followState === "unfollowing") ? "delete" : "post",
    data: {"user_id": button.userID},
    dataType: "json",
    success: function(){
      button.followState = oppositeState;
      button.render();
      button.$el.data("initial-follow-state", oppositeState);

    },
    error: function(event){
      console.log(event.error());
    }
  });

}

$.fn.followToggle = function (options) {
  return this.each(function () {
    new $.FollowToggle(this, options);

  });
};

$(function () {
  $("button.follow-toggle").followToggle();
});

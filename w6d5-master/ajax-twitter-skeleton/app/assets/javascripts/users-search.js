$.UsersSearch = function (el) {
  this.$el = $(el);
  this.$ul = this.$el.find(".users");
  this.$el.on("input", "input", this.handleInput.bind(this));
};

$.UsersSearch.prototype.getUsers = function(query){
  var form = this;

  $.ajax({
    url: ("/users/search"),
    type: "get",
    data: {"query": query},
    dataType: "json",
    success: function(matchedUsers){
      form.renderResults(matchedUsers);
    },
    error: function(){
      console.log(event.error());
    }
  });

};

$.UsersSearch.prototype.renderResults = function (matchedUsers) {
  var $ul = this.$ul;
  $ul.text("")

  matchedUsers.forEach(function(user){
    var $li = $("<li></li>");
    $li.html('<a href="/users/' + user.id + '">'+ user.username + '</a>');

    var $button = $('<button class="follow-toggle"></button>');
    var followed = user.followed ? "followed" : "unfollowed";

    $button.followToggle({userId: user.id, followState: followed});
    $li.append($button);

    $ul.append($li);
  });
};

$.UsersSearch.prototype.handleInput = function (event) {
  event.preventDefault();
  this.getUsers(this.$el.find("input").val());
}

$.fn.UsersSearch = function () {
  return this.each(function () {
    new $.UsersSearch(this);

  });
};

$(function () {
  $("#user-search").UsersSearch();
});

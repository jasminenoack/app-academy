$.TweetCompose = function (el) {
  this.$el = $(el);
  this.$mentionedUsers = this.$el.find(".mentioned-users");
  this.$el.on("submit", this.handleInput.bind(this));
  this.$el.on("input", "textarea", this.countChars.bind(this));
  this.$el.on("click", ".add-mentioned-user", this.addMentionedUser.bind(this));
  this.$el.on("click", ".remove-mentioned-user", this.removeMentionedUser);
  this.$tweets = $(".tweets");
};

$.TweetCompose.prototype.addMentionedUser = function (event){
  var select = this.$mentionedUsers.find("script").html();
  this.$mentionedUsers.append(select);
};

$.TweetCompose.prototype.removeMentionedUser = function (event){
  $(this).parent().remove();
};

$.TweetCompose.prototype.countChars = function (event) {
  var currentLength = $(event.currentTarget).val().length;

  this.$el.find(".chars-left").text((140 - currentLength) + " characters left");
};

$.TweetCompose.prototype.handleInput = function (event) {
  event.preventDefault();

  var $tweets = this.$tweets;
  var formInput = this.$el.serialize();
  var form = this;

  this.$el.find(":input").prop("disabled", true);

  $.ajax({
    url: ("/tweets"),
    type: "post",
    data: formInput,
    dataType: "json",
    success: function(tweet){
      // var $li = $('<li>' + tweet.content + ' -- ' +
      //     '<a href="/users/' + tweet.user.id + '">' +
      //     tweet.user.username + '</a>' + ' -- ' +
      //     new Date (tweet.created_at ) + '</li>');
      // $tweets.prepend($li);
      form.$tweets.trigger("insert-tweet", tweet)

      form.$el.find("textarea").val("");
      form.$el.find("select").val("");
      form.$el.find(":input").prop("disabled", false);
      form.$mentionedUsers.find("label").remove();
    },
    error: function(){
      console.log(event.error());
      form.$el.find(":input").prop("disabled", false);
    }
  });
}

$.fn.TweetCompose = function () {
  return this.each(function () {
    new $.TweetCompose(this);

  });
};

$(function () {
  $(".tweet-compose").TweetCompose();
});

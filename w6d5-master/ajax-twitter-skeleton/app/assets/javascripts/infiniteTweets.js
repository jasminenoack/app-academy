$.InfiniteTweets = function (el) {
  this.$el = $(el);
  this.$ul = this.$el.find(".tweets");
  this.fetchTweets();
  this.maxCreatedAt = null;
  this.$button = this.$el.find(".fetch-more");
  var that = this

  this.$ul.on("insert-tweet", function (event, tweet) {
    console.log(arguments)
    that.insertTweets([tweet])
  });

  this.$button.on("click", this.fetchTweets.bind(this, this.maxCreatedAt));
};

$.InfiniteTweets.prototype.fetchTweets = function (maxCreatedAt){
  var $feed = this;

  $.ajax({
    url: "/feed",
    type: "get",
    data: {max_created_at: $feed.maxCreatedAt},
    dataType: "json",
    success: function(tweets){
      $feed.insertTweets(tweets);
      if (tweets.length < 20) {
        console.log($feed.$button)
        $feed.$button.prop("disabled", true).text("No more tweets :(")
      }
    },
    error: function(){
      console.log(event.error());
    }
  })
};

$.InfiniteTweets.prototype.insertTweets = function (tweets){
  var $ul = this.$ul;
  console.log(tweets.length)

  if (!tweets.length) {
    return
  }
  console.log(tweets)
  var $template = this.$el.find("script").html()
  var template = _.template($template)

  if (tweets.length === 1 && tweets[0].created_at > this.maxCreatedAt) {
    this.$ul.prepend(template({tweets: tweets}))
  } else {
    this.$ul.append(template({tweets: tweets}))
  }


  // console.log(template);

  // tweets.forEach( function (tweet) {
  //   var $li = $('<li>' + tweet.content + ' -- ' +
  //       '<a href="/users/' + tweet.user.id + '">' +
  //       tweet.user.username + '</a>' + ' -- ' +
  //       new Date (tweet.created_at ) + '</li>');
  //  $ul.append($li);
  // })

  this.maxCreatedAt = tweets[tweets.length-1].created_at;
};

$.InfiniteTweets.prototype.countChars = function (event) {
};

$.InfiniteTweets.prototype.handleInput = function (event) {
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
      var $li = $('<li>' + tweet.content + ' -- ' +
          '<a href="/users/' + tweet.user.id + '">' +
          tweet.user.username + '</a>' + ' -- ' +
          new Date (tweet.created_at ) + '</li>');
      $tweets.prepend($li);
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

$.fn.InfiniteTweets = function () {
  return this.each(function () {
    new $.InfiniteTweets(this);

  });
};

$(function () {
  $(".infinite-tweets").InfiniteTweets();
});

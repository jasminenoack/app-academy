window.Journal = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
};

$(document).ready(function(){
  var router = new Journal.Routers.Posts({$el: $(".content")});
  Backbone.history.start()
});

window.NewsReader = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new NewsReader.Routers.AppRouter({
      $rootEl: $('.container')
    });
    Backbone.history.start();
    // alert('Hello from Backbone!');
  }
};

$(document).ready(function(){
  NewsReader.initialize();
});

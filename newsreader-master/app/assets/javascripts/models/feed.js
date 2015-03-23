NewsReader.Models.Feed = Backbone.Model.extend({
  urlRoot: "/api/feeds",

  entries: function () {
    if (!this._entries) {
      this._entries = new NewsReader.Collections.Entries([],{feed: this});
    }
    return this._entries
  },

  parse: function (payload) {
    if (payload.latest_entries) {
      var entries = this.entries();
      entries.set(payload.latest_entries);
      delete payload.latest_entries;
    }
    return payload;
  }
})

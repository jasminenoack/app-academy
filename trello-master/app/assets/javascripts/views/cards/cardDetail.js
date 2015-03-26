// TrelloClone.Views.CardDetail = Backbone.CompositeView.extend({
//   initialize: function () {
//     this.listenTo(this.model, "sync change", this.render)
//   },
//
//   events: {
//     "click .delete-card": "deleteCard",
//     "dblclick h2": "editCard",
//     "dblclick p": "editCard",
//     'submit form': 'submitCard',
//     'mouseleave': 'removeElement'
//   },
//
//   formTemplate: JST['cards/cardForm'],
//
//   template: JST['cards/cardDetail'],
//
//   render: function () {
//     this.$el.html(this.template({card: this.model}))
//     return this
//   },
//
//   deleteCard: function () {
//     event.preventDefault();
//     this.model.destroy();
//   },
//
//   editCard: function () {
//     console.log ("edit")
//     this.$el.html(this.formTemplate({card: this.model}))
//   },
//
//   submitCard: function (event) {
//     event.preventDefault()
//     this.model.set($(event.currentTarget).serializeJSON())
//
//     this.model.save({}, {
//       success: function () {
//       }.bind(this)
//     })
//   },
//
//   removeElement: function () {
//     this.$el.empty()
//     this.remove()
//   }
// })

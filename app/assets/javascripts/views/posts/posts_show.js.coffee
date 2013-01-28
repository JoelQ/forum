class Forum.Views.PostsShow extends Backbone.View

  template: JST['posts/show']

  render: ->
    this.$el.html @template(@model.toJSON())
    this

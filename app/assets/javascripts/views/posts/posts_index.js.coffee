class Forum.Views.PostsIndex extends Backbone.View

  template: JST['posts/index']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    this.$el.html @template()
    @collection.each @renderPost
    this

  renderPost: (post) =>
    view = new Forum.Views.PostsShow(model: post)
    this.$el.append view.render().el

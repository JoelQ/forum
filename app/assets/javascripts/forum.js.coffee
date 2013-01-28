window.Forum =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    collection = new Forum.Collections.Posts(Forum.pollInterval)
    view = new Forum.Views.PostsIndex(collection: collection)
    $('#posts').html(view.render().el)

$(document).ready ->
  Forum.initialize()

class Forum.Collections.Posts extends Backbone.Collection

  model: Forum.Models.Post
  url: '/api/posts'

  initialize: (fetchFrequency) ->
    setInterval =>
      @fetch()
    , fetchFrequency

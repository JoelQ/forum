describe 'PostsCollection', ->
  it 'fetches from the posts api', ->
    collection = new Forum.Collections.Posts(5000)
    expect(collection.url).toEqual('/api/posts')

  it 'fetches posts every specified time interval', ->
    jasmine.Clock.useMock()
    collection = new Forum.Collections.Posts(500)
    spyOn(collection, 'fetch')
    jasmine.Clock.tick(400)
    expect(collection.fetch).not.toHaveBeenCalled()
    jasmine.Clock.tick(501)
    expect(collection.fetch).toHaveBeenCalled()
    jasmine.Clock.tick(501)
    expect(collection.fetch).toHaveBeenCalled()

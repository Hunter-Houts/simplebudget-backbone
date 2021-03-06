class Simplebudget.Views.SearchIndex extends Backbone.View
  template: HandlebarsTemplates['posts/search']

  events:
    'click #searchBtn' : 'search'

  initialize: ->
    # @search = $("#searchForm")
    # @search.on('submit',@search, this)
    @collection = new Simplebudget.Collections.Search()
    @collection.on('sync change', @render, this)
    @collection.fetch()

  render: ->
    $(@el).html(@template(posts: @collection.toJSON()))
    this

  addPost: (post) ->
    view = new Simplebudget.Views.Post(model: post)
    $("#posts").append(view.render().el)

  search: (event) ->
    console.log "EVENT FIRED"
    event.preventDefault()
    search = $("#search").val()
    search2 = $("#search").val()
    if search.save({search: search, search: search2})
      window.location.href = '/posts'





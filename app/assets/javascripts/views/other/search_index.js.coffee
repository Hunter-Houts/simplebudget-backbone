class Simplebudget.Views.SearchIndex extends Backbone.View
  template: HandlebarsTemplates['posts/index']

  events:
    'submit #searchForm' : 'search'

  initialize: ->
    @search = $("#searchForm")
    @search.on('submit',@search, this)
    @router = new Simplebudget.Routers.Home()
    @collection = new Simplebudget.Collections.Search()
    @collection.on('sync change', @render, this)
    @collection.on('add', @render, this)
    @collection.fetch()

  render: ->
    $(@el).html(@template(posts: @collection.toJSON()))
    this

  addPost: (post) ->
    view = new Simplebudget.Views.Post(model: post)
    $("#posts").append(view.render().el)

  search: (event) ->
    event.preventDefault()
    search = $("#search").val()
    search2 = $("#search").val()
    if search.save({search: search, search: search2})
      window.location.href = '/posts'





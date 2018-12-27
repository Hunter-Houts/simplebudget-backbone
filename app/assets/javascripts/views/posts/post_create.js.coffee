class Simplebudget.Views.CreatePost extends Backbone.View
  template: HandlebarsTemplates['posts/create']

  events:
    'submit #createPost': 'createPost'


  initialize: ->
    @router = new Simplebudget.Routers.Home()
    @collection = @router.collection
    @post = new Simplebudget.Models.Post()
    @model = new Simplebudget.Models.Session()
    @model.on('sync change', @render, this)
    @model.fetch()

  render: ->
    $(@el).html(@template(post: @post))
    this

  createPost: (event) ->
    event.preventDefault()
    title = $('#title').val()
    body = $('#body').val()
    # user_id = $("#user_id").text()
    if @post.save({title: title, body: body}, wait: true, error: @handleError)
      @collection.add(@post)
      window.location.href = '/posts'
    else
      window.location.href = '/'
  handleError: (entry, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages




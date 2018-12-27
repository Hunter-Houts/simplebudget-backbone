class Simplebudget.Views.EditPost extends Backbone.View
  template: HandlebarsTemplates['posts/edit']

  events:
    'submit #editPost': 'editPost'


  initialize: ->
    @model = new Simplebudget.Models.Post({id: this.id})
    @model.on('sync change', @render, this)
    @model.fetch()

  render: ->
    $(@el).html(@template(post: @model.toJSON()))
    this

  editPost: (event) ->
    event.preventDefault()
    title = $('#title').val()
    body = $('#body').val()
    if @model.save({title: title, body: body}, wait: true, error: @handleError)
      window.location.href = '/posts/' + @model.id
    else
      window.location.href = '/posts'
  handleError: (entry, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages

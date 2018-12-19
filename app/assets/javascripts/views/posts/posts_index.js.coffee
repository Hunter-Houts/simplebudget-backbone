class Simplebudget.Views.PostIndex extends Backbone.View
  template: HandlebarsTemplates['posts/index']

  initialize: ->
    @collection.on('sync change', @render, this)
    @collection.on('add', @render, this)

  render: ->
    $(@el).html(@template(posts: @collection.toJSON()))
    this

  addPost: (post) ->
    view = new Simplebudget.Views.Post(model: post)
    $("#posts").append(view.render().el)


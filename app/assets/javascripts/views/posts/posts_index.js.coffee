class Simplebudget.Views.PostIndex extends Backbone.View
  template: HandlebarsTemplates['posts/index']

  initialize: ->
    @collection.on('sync change', @render, this)
    @collection.on('add', @render, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@add)
    this

  add: (post) ->
    view = new Simplebudget.Views.Post(model: post)
    $("#container-main").append(view.render().el)


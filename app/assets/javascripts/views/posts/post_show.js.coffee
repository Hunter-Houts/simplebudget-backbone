class Simplebudget.Views.PostShow extends Backbone.View
  template: HandlebarsTemplates['posts/show']

  # initialize: ->
  #   @collection.on('sync change', @render, this)

  render: ->
    $(@el).html(@template())
    this

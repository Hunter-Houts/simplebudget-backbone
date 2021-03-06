class Simplebudget.Views.Home extends Backbone.View
  template: HandlebarsTemplates['homepage/home'],
  limit: 3

  initialize: ->
    @collection = new Simplebudget.Collections.HomeReviews()
    @collection.on('sync change', @render, this)
    @collection.fetch()

  render: ->
    $(@el).html(@template(reviews: @collection.toJSON()))
    this

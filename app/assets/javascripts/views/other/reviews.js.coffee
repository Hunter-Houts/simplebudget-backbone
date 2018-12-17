class Simplebudget.Views.ReviewIndex extends Backbone.View
  template: HandlebarsTemplates['other/reviews']

  initialize: ->
    @collection = new Simplebudget.Collections.Reviews()
    @collection.on('sync change', @render, this)
    @collection.fetch()

  render: ->
    $(@el).html(@template(reviews: @collection.toJSON()))
    this


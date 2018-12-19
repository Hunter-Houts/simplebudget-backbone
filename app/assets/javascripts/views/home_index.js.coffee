class Simplebudget.Views.Home extends Backbone.View
  template: HandlebarsTemplates['homepage/home'],
  limit: 3

  initialize: ->
    @collection = new Simplebudget.Collections.HomeReviews()
    @collection.on('sync change', @render, this)
    @collection.fetch().done ->
      @last3 = _.last(@collection.models, 3)

    # @models = _.last(@collection.models, 3)
    # console.log @models
    # find way to limit fetch to 3

  render: ->
    $(@el).html(@template(reviews: @collection.toJSON()))
    this

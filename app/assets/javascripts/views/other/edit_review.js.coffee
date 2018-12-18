class Simplebudget.Views.ReviewEdit extends Backbone.View
  template: HandlebarsTemplates['other/reviewEdit']
  # url: 'posts/:id'
  events:
    'input #rating': 'change'

  initialize: ->
    @model = new Simplebudget.Models.Review({id: this.id})
    @model.on('sync change', @render, this)
    @model.fetch()

  render: ->
    $(@el).html(@template(Review: @model.toJSON()))
    this

  change: ->
    slideCol = $("#rating").val()
    $("#f").html(slideCol)

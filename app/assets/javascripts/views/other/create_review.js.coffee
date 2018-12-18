class Simplebudget.Views.CreateReview extends Backbone.View
  template: HandlebarsTemplates['other/createReview']

  events:
    'input #rating': 'change'

  render: ->
    $(@el).html(@template())
    this
  change: ->
    slideCol = $("#rating").val()
    $("#f").html(slideCol)



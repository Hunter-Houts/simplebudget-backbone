class Simplebudget.Views.CreateReview extends Backbone.View
  template: HandlebarsTemplates['other/createReview']

  events:
    'input #rating': 'change'
    'submit #new_review': 'createReview'
  render: ->
    $(@el).html(@template())
    this
  change: ->
    slideCol = $("#rating").val()
    $("#f").html(slideCol)
  createReview: (event) ->
    event.preventDefault()
    rating = rating: parseInt($('#rating').val())
    body = body: $('#body').val()
    @view_create_review.create rating, body
      wait: true


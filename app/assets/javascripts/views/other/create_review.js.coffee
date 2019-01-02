class Simplebudget.Views.CreateReview extends Backbone.View
  template: HandlebarsTemplates['other/createReview']

  events:
    'input #rating': 'change'
    'submit #newReview': 'createReview'

  initialize: ->
    @router = new Simplebudget.Routers.Home()
    @review = new Simplebudget.Models.Review()
    @model = new Simplebudget.Models.Session()
    @model.on('sync change', @render, this)
    @model.fetch()

  render: ->
    $(@el).html(@template(user: @model.toJSON(), review: @review))
    this
  change: ->
    slideCol = $("#rating").val()
    $("#f").html(slideCol)

  createReview: (event) ->
    event.preventDefault()
    rating = $('#rating').val()
    body = $('#body').val()
    if @review.save({rating: rating, body: body}, wait: true, error: @handleError)
      window.location.href = '/reviews'
    else
      window.location.href = '/'
  handleError: (entry, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages



class Simplebudget.Views.ReviewEdit extends Backbone.View
  template: HandlebarsTemplates['other/reviewEdit']
  # url: 'posts/:id'
  events:
    'input #rating': 'change'
    'submit #editReview': 'editReview'

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

  editReview: (event) ->
    event.preventDefault()
    rating = $('#rating').val()
    body = $('#body').val()
    # user_id = $("#user_id").text()
    if @model.save({rating: rating, body: body}, wait: true, error: @handleError)
      window.location.href = '/reviews'
    else
      window.location.href = '/'
  handleError: (entry, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages

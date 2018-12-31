class Simplebudget.Collections.HomeReviews extends Backbone.Collection
  url: '/reviews'
  parse: (response) ->
    return response.slice(-3)
  model: Simplebudget.Models.Review

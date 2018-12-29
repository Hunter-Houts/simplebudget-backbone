class Simplebudget.Collections.Comments extends Backbone.Collection
  initialize: (models, options) ->
    this.id = options.id
  url: ->
    '/comments/' + this.id

  model: Simplebudget.Models.Comment

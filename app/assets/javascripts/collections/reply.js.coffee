class Simplebudget.Collections.Replies extends Backbone.Collection
  initialize: (models, options) ->
    this.id = options.id
  url: ->
    '/comments/' + this.id + '/replies'

  model: Simplebudget.Models.Comment

class Simplebudget.Models.Post extends Backbone.Model
  url: ->
    if this.id
      '/posts/' + this.id
    else
      '/posts/'


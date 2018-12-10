window.Simplebudget =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Simplebudget.Routers.Home()
    Backbone.history.start()

$(document).ready ->
  Simplebudget.initialize()

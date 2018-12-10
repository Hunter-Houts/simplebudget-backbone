class Simplebudget.Routers.Home extends Backbone.Router
  routes:
    '': 'index'
    '/login': 'login'
  events:
    'click #login': 'login'

  index: ->
    view = new Simplebudget.Views.Home()
    $("#container-main").html(view.render().el)

  login: ->
    view = new Simplebudget.Views.UsersIndex()
    $("#container-main").html(view.render().el)

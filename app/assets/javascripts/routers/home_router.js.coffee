class Simplebudget.Routers.Home extends Backbone.Router
  routes:
    '': 'index'
    'login': 'login'
    'signup': 'signup'
    'profile': 'profile'
    'faq': 'faq'
  events:
    'submit #new_signup': 'createUser'

  index: ->
    view = new Simplebudget.Views.Home()
    $("footer").removeClass("fixed-bottom")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("#container-main").html(view.render().el)

  login: ->
    view = new Simplebudget.Views.UsersIndex()
    $("footer").addClass("fixed-bottom")
    $("body, html").addClass("login")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("#container-main").html(view.render().el)

  signup: ->
    view_signup = new Simplebudget.Views.UsersSignup()
    $("footer").addClass("fixed-bottom")
    $("body, html").addClass("signup")
    $("body, html").removeClass("login")
    $("body, html, footer").removeClass("faq")
    $("#container-main").html(view_signup.render().el)

  createUser: (event) ->
    event.preventDefault()
    username = username: $('#username').val()
    email = email: $('#email').val()
    password = password: $('#password').val()
    phonenumber = phonenumnber: $('#phonenumber').val()
    @view_signup.create username, email, password, phonenumber
      wait: true
      error: @handleError

  handleError: (entry, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages
  profile: ->
    view = new Simplebudget.Views.Profile()
    $("footer").addClass("fixed-bottom")
    $("body, html").addClass("profile")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("#container-main").html(view.render().el)

  faq: ->
    view = new Simplebudget.Views.FAQ()
    $("footer").addClass("fixed-bottom")
    $("body, html, footer").addClass("faq")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("#container-main").html(view.render().el)


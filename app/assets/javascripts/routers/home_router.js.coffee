class Simplebudget.Routers.Home extends Backbone.Router
  routes:
    '': 'index'
    'login': 'login'
    'signup': 'signup'
    'profile': 'profile'
    'faq': 'faq'
    'supincome': 'supincome'
    'about-team': 'aboutteam'
    'posts' : 'postIndex'
    'posts/:id': 'showPost'
  events:
    'submit #new_signup': 'createUser'

  initialize: ->
    @collection = new Simplebudget.Collections.Posts()
    @collection.fetch()

  index: ->
    view = new Simplebudget.Views.Home()
    $("footer").removeClass("fixed-bottom")
    $("body, footer").removeClass("postShow")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("body, footer").removeClass("postIndex")
    $("#container-main").html(view.render().el)

  login: ->
    view = new Simplebudget.Views.UsersIndex()
    $("footer").addClass("fixed-bottom")
    $("body, html").addClass("login")
    $("body, footer").removeClass("postShow")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("body, footer").removeClass("postIndex")
    $("#container-main").html(view.render().el)

  signup: ->
    view_signup = new Simplebudget.Views.UsersSignup()
    $("footer").addClass("fixed-bottom")
    $("body, html").addClass("signup")
    $("body, footer").removeClass("postShow")
    $("body, html").removeClass("login")
    $("body, html, footer").removeClass("faq")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("body, footer").removeClass("postIndex")
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
    $("body, footer").removeClass("postShow")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("body, footer").removeClass("postIndex")
    $("#container-main").html(view.render().el)

  faq: ->
    view = new Simplebudget.Views.FAQ()
    $("footer").addClass("fixed-bottom")
    $("body, html, footer").addClass("faq")
    $("body, footer").removeClass("postShow")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("body, footer").removeClass("postIndex")
    $("#container-main").html(view.render().el)

  supincome: ->
    view = new Simplebudget.Views.SupIncome()
    $("footer").addClass("fixed-bottom")
    $("body, html, footer").addClass("supincome")
    $("body, footer").removeClass("postShow")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("faq")
    $("body, html, footer").removeClass("team")
    $("body, footer").removeClass("postIndex")
    $("#container-main").html(view.render().el)

  aboutteam: ->
    view = new Simplebudget.Views.Team()
    $("footer").addClass("fixed-bottom")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, footer").removeClass("postShow")
    $("body, html, footer").removeClass("faq")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, footer").removeClass("postIndex")
    $("body, html, footer").addClass("team")
    $("#container-main").html(view.render().el)

  postIndex: ->
    view = new Simplebudget.Views.PostIndex(collection: @collection)
    $("footer").addClass("fixed-bottom")
    $("body, footer").addClass("postIndex")
    $("body, footer").removeClass("postShow")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("#container-main").html(view.render().el)

  showPost: ->
    view = new Simplebudget.Views.PostShow()
    $("footer").addClass("fixed-bottom")
    $("body, footer").addClass("postShow")
    $("body, footer").removeClass("postIndex")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("#container-main").html(view.render().el)





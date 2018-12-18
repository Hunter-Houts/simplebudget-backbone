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
    'reviews' : 'reviews'
    'reviews/create': 'createReviewPage'
    'reviews/:id' : 'editReviewPage'
  events:
    'submit #new_signup': 'createUser'
    'submit #newReview': 'createReview'

  initialize: ->
    @collection = new Simplebudget.Collections.Posts()
    @collection.fetch()

  index: ->
    view = new Simplebudget.Views.Home()
    $("footer").removeClass("fixed-bottom")
    $("body, html, footer").removeClass("reviewIndex")
    $("body, footer").removeClass("postShow")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("body, footer").removeClass("postIndex")
    $("body").removeClass("editReview")
    $("#container-main").html(view.render().el)

  login: ->
    view = new Simplebudget.Views.UsersIndex()
    $("footer").addClass("fixed-bottom")
    $("body, html").addClass("login")
    $("body, html, footer").removeClass("reviewIndex")
    $("body, footer").removeClass("postShow")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("body, footer").removeClass("postIndex")
    $("body").removeClass("editReview")
    $("#container-main").html(view.render().el)

  signup: ->
    view_signup = new Simplebudget.Views.UsersSignup()
    $("footer").addClass("fixed-bottom")
    $("body, html").addClass("signup")
    $("body, html, footer").removeClass("reviewIndex")
    $("body, footer").removeClass("postShow")
    $("body, html").removeClass("login")
    $("body, html, footer").removeClass("faq")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("body, footer").removeClass("postIndex")
    $("body").removeClass("editReview")
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
    $("body, html, footer").removeClass("reviewIndex")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("body, footer").removeClass("postIndex")
    $("body").removeClass("editReview")
    $("#container-main").html(view.render().el)

  faq: ->
    view = new Simplebudget.Views.FAQ()
    $("footer").addClass("fixed-bottom")
    $("body, html, footer").addClass("faq")
    $("body, footer").removeClass("postShow")
    $("body, html, footer").removeClass("reviewIndex")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("body, footer").removeClass("postIndex")
    $("body").removeClass("editReview")
    $("#container-main").html(view.render().el)

  supincome: ->
    view = new Simplebudget.Views.SupIncome()
    $("footer").addClass("fixed-bottom")
    $("body, html, footer").addClass("supincome")
    $("body, html, footer").removeClass("reviewIndex")
    $("body, footer").removeClass("postShow")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("faq")
    $("body, html, footer").removeClass("team")
    $("body, footer").removeClass("postIndex")
    $("body").removeClass("editReview")
    $("#container-main").html(view.render().el)

  aboutteam: ->
    view = new Simplebudget.Views.Team()
    $("footer").addClass("fixed-bottom")
    $("body, html, footer").removeClass("reviewIndex")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, footer").removeClass("postShow")
    $("body, html, footer").removeClass("faq")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, footer").removeClass("postIndex")
    $("body, html, footer").addClass("team")
    $("body").removeClass("editReview")
    $("#container-main").html(view.render().el)

  postIndex: ->
    view = new Simplebudget.Views.PostIndex(collection: @collection)
    $("footer").addClass("fixed-bottom")
    $("body, footer").addClass("postIndex")
    $("body, html, footer").removeClass("reviewIndex")
    $("body, footer").removeClass("postShow")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("body").removeClass("editReview")
    $("#container-main").html(view.render().el)

  showPost: (id) ->
    view = new Simplebudget.Views.PostShow({id: "#{id}"})
    $("footer").addClass("fixed-bottom")
    $("body, footer").addClass("postShow")
    $("body, html, footer").removeClass("reviewIndex")
    $("body, footer").removeClass("postIndex")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("body").removeClass("editReview")
    $("#container-main").html(view.render().el)

  reviews: ->
    view = new Simplebudget.Views.ReviewIndex()
    $("footer").addClass("fixed-bottom")
    $("body, html, footer").addClass("reviewIndex")
    $("body, footer").removeClass("postShow")
    $("body, footer").removeClass("postIndex")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("body").removeClass("editReview")
    $("#container-main").html(view.render().el)

  createReviewPage: ->
    view_create_review = new Simplebudget.Views.CreateReview()
    $("footer").addClass("fixed-bottom")
    $("body").addClass("createReview")
    $("body, html, footer").removeClass("reviewIndex")
    $("body, footer").removeClass("postShow")
    $("body, footer").removeClass("postIndex")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("body").removeClass("editReview")
    $("#container-main").html(view_create_review.render().el)

  createReview: (event) ->
    event.preventDefault()
    rating = rating: parseInt($('#rating').val())
    body = body: $('#body').val()
    @view_create_review.create rating, body
      wait: true

  editReviewPage: (id) ->
    view = new Simplebudget.Views.ReviewEdit({id: "#{id}"})
    $("footer").addClass("fixed-bottom")
    $("body").addClass("editReview")
    $("body, footer").removeClass("postShow")
    $("body, html, footer").removeClass("reviewIndex")
    $("body, footer").removeClass("postIndex")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("#container-main").html(view.render().el)










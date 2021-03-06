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
    'posts/create': 'createPostPage'
    'posts/:id': 'showPost'
    'posts/:id/edit': 'editPost'
    'reviews' : 'reviews'
    'reviews/create': 'createReviewPage'
    'reviews/:id' : 'editReviewPage'
    'account-setup': 'createAccount'
    'bills': 'createAccount'
    'users/:id': 'editProfilePage'
    'piechart' : 'piechart'
    'search' : 'search'
    '*path' : 'notFound'



  initialize: ->
    @collection = new Simplebudget.Collections.Posts()
    @collection.fetch()

  index: ->
    view = new Simplebudget.Views.Home()
    $("#createPost").hide()
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
    $("body").removeClass("createPost")
    $("body").removeClass("createAccount")
    $("body").removeClass("editUser")
    $("#container-main").html(view.render().el)

  login: ->
    view = new Simplebudget.Views.UsersIndex()
    $("#createPost").hide()
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
    $("body").removeClass("createPost")
    $("body").removeClass("createAccount")
    $("body").removeClass("editUser")
    $("#container-main").html(view.render().el)

  signup: ->
    view_signup = new Simplebudget.Views.UsersSignup(user: new Simplebudget.Models.User())
    $("#createPost").hide()
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
    $("body").removeClass("createPost")
    $("body").removeClass("createAccount")
    $("body").removeClass("editUser")
    $("#container-main").html(view_signup.render().el)

  profile: ->
    view = new Simplebudget.Views.Profile()
    $("#createPost").hide()
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
    $("body").removeClass("createPost")
    $("body").removeClass("createAccount")
    $("body").removeClass("editUser")
    $("#container-main").html(view.render().el)
    setTimeout ( ->
        view.drawChart()
        ), 50

  faq: ->
    view = new Simplebudget.Views.FAQ()
    $("#createPost").hide()
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
    $("body").removeClass("createPost")
    $("body").removeClass("createAccount")
    $("body").removeClass("editUser")
    $("#container-main").html(view.render().el)

  supincome: ->
    view = new Simplebudget.Views.SupIncome()
    $("#createPost").hide()
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
    $("body").removeClass("createPost")
    $("body").removeClass("createAccount")
    $("body").removeClass("editUser")
    $("#container-main").html(view.render().el)

  aboutteam: ->
    view = new Simplebudget.Views.Team()
    $("#createPost").hide()
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
    $("body").removeClass("createPost")
    $("body").removeClass("createAccount")
    $("body").removeClass("editUser")
    $("#container-main").html(view.render().el)

  postIndex: ->
    view = new Simplebudget.Views.PostIndex(collection: @collection)
    $("#createPost").show()
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
    $("body").removeClass("createPost")
    $("body").removeClass("createAccount")
    $("body").removeClass("editUser")
    $("#container-main").html(view.render().el)

  showPost: (id) ->
    view = new Simplebudget.Views.PostShow({id: "#{id}"})
    $("#createPost").show()
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
    $("body").removeClass("createPost")
    $("body").removeClass("createAccount")
    $("body").removeClass("editUser")
    $("#container-main").html(view.render().el)

  editPost: (id) ->
    view = new Simplebudget.Views.EditPost({id: "#{id}"})
    $("#createPost").show()
    $("footer").addClass("fixed-bottom")
    $("body, footer").removeClass("postShow")
    $("body").addClass("editPost")
    $("body, html, footer").removeClass("reviewIndex")
    $("body, footer").removeClass("postIndex")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("body, html").removeClass("profile")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("body").removeClass("editReview")
    $("body").removeClass("createPost")
    $("body").removeClass("createAccount")
    $("body").removeClass("editUser")
    $("#container-main").html(view.render().el)

  reviews: ->
    view = new Simplebudget.Views.ReviewIndex()
    $("#createPost").hide()
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
    $("body").removeClass("createPost")
    $("body").removeClass("createAccount")
    $("body").removeClass("editUser")
    $("#container-main").html(view.render().el)

  createReviewPage: ->
    view_create_review = new Simplebudget.Views.CreateReview(review: new Simplebudget.Models.Review())
    $("#createPost").hide()
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
    $("body").removeClass("createPost")
    $("body").removeClass("createAccount")
    $("body").removeClass("editUser")
    $("#container-main").html(view_create_review.render().el)

  editReviewPage: (id) ->
    view = new Simplebudget.Views.ReviewEdit({id: "#{id}"})
    $("#createPost").hide()
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
    $("body").removeClass("createPost")
    $("body").removeClass("createAccount")
    $("body").removeClass("editUser")
    $("#container-main").html(view.render().el)

  createPostPage: ->
    view_create_post = new Simplebudget.Views.CreatePost(post: new Simplebudget.Models.Post())
    $("#createPost").show()
    $("footer").addClass("fixed-bottom")
    $("body").addClass("createPost")
    $("body").removeClass("createReview")
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
    $("body").removeClass("createAccount")
    $("body").removeClass("editUser")
    $("#container-main").html(view_create_post.render().el)

  createAccount: ->
    view = new Simplebudget.Views.AccountSetup()
    $("#createPost").hide()
    $("footer").addClass("fixed-bottom")
    $("body").addClass("createAccount")
    $("body").removeClass("createPost")
    $("body").removeClass("createReview")
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
    $("body").removeClass("editUser")
    $("#container-main").html(view.render().el)

  editProfilePage: (id) ->
    view = new Simplebudget.Views.UserEdit({id: "#{id}"})
    $("#createPost").hide()
    $("footer").addClass("fixed-bottom")
    $("body").addClass("editUser")
    $("body").removeClass("createAccount")
    $("body").removeClass("createPost")
    $("body").removeClass("createReview")
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
    $("#container-main").html(view.render().el)

  notFound: (path) ->
    alert("Invalid Path: " + path)
    window.location.href = '/'

  piechart: ->
    view = new Simplebudget.Views.PieChart()
    $("#createPost").hide()
    $("footer").addClass("fixed-bottom")
    $("body, html").removeClass("profile")
    $("body, footer").removeClass("postShow")
    $("body, html, footer").removeClass("reviewIndex")
    $("body, html").removeClass("login")
    $("body, html").removeClass("signup")
    $("body, html, footer").removeClass("faq")
    $("body, html, footer").removeClass("supincome")
    $("body, html, footer").removeClass("team")
    $("body, footer").removeClass("postIndex")
    $("body").removeClass("editReview")
    $("body").removeClass("createPost")
    $("body").removeClass("createAccount")
    $("body").removeClass("editUser")
    $("#container-main").html(view.render().el)
    setTimeout ( ->
        view.drawChart()
        ), 50

  search: ->
    view = new Simplebudget.Views.SearchIndex()
    $("#createPost").show()
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
    $("body").removeClass("createPost")
    $("body").removeClass("createAccount")
    $("body").removeClass("editUser")
    $("#container-main").html(view.render().el)













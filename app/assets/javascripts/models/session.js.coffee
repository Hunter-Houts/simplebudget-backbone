class Simplebudget.Models.Session extends Backbone.Model
  urlRoot: '/sessions'

  sessionToken: -> @get('session_token')
  isLoggedIn: -> @sessionToken()?

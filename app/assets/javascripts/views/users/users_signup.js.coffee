class Simplebudget.Views.UsersSignup extends Backbone.View
  template: HandlebarsTemplates['users/signup']

  events:
    'submit #new_signup': 'createUser'

  initialize: ->
    @router = new Simplebudget.Routers.Home()
    @user = new Simplebudget.Models.User()

  render: ->
    $(@el).html(@template(user: @user))
    this

  createUser: (event) ->
    event.preventDefault()
    username = $('#username').val()
    email = $('#email').val()
    password = $('#password').val()
    phonenumber = $('#phonenumber').val()
    @user.save({username: username, email: email, password: password, phonenumber: phonenumber}, wait: true, error: @handleError, success: @router.navigate('/login', {trigger: true}))
      # @router.navigate('/profile', {trigger: true})
    # else
      # @router.navigate('', {trigger: true})

  handleError: (entry, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages

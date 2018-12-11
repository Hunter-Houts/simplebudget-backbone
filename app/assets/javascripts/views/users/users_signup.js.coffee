class Simplebudget.Views.UsersSignup extends Backbone.View
  template: HandlebarsTemplates['users/signup']

  render: ->
    $(@el).html(@template())
    this

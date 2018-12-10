class Simplebudget.Views.UsersIndex extends Backbone.View
  template: HandlebarsTemplates['users/login']

  render: ->
    $(@el).html(@template())
    this


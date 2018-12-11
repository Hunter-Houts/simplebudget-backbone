class Simplebudget.Views.Profile extends Backbone.view
  template: HandlebarsTemplates['users/profile']


  render: ->
    $(@el).html(@template())
    this

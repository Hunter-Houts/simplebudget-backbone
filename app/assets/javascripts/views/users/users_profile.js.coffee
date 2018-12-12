class Simplebudget.Views.Profile extends Backbone.View
  template: HandlebarsTemplates['users/profile']

  render: ->
    $(@el).html(@template())
    this

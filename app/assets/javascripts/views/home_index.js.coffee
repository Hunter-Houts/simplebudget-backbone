class Simplebudget.Views.Home extends Backbone.View
  template: HandlebarsTemplates['homepage/home']

  render: ->
    $(@el).html(@template())
    this

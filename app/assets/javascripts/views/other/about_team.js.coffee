class Simplebudget.Views.Team extends Backbone.View
  template: HandlebarsTemplates['other/about-team']

  render: ->
    $(@el).html(@template())
    this

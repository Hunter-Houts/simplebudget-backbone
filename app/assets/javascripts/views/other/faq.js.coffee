class Simplebudget.Views.FAQ extends Backbone.View
  template: HandlebarsTemplates['other/faq']

  render: ->
    $(@el).html(@template())
    this

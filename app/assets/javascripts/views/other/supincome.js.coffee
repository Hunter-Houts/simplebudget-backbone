class Simplebudget.Views.SupIncome extends Backbone.View
  template: HandlebarsTemplates['other/supincome']

  render: ->
    $(@el).html(@template())
    this

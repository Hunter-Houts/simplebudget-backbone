class Simplebudget.Views.Post extends Backbone.View
  template: HandlebarsTemplates['posts/index']

  render: ->
    $(@el).html(@template(post: @model))
    this

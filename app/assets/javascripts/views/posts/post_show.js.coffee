class Simplebudget.Views.PostShow extends Backbone.View
  template: HandlebarsTemplates['posts/show']
  # url: 'posts/:id'

  initialize: ->
    @model = new Simplebudget.Models.Post({id: this.id})
    @model.on('sync change', @render, this)
    @model.fetch()

  render: ->
    $(@el).html(@template(post: @model.toJSON()))
    this

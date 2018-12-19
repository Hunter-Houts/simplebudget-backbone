class Simplebudget.Views.PostShow extends Backbone.View
  template: HandlebarsTemplates['posts/show']
  # url: 'posts/:id'

  initialize: ->
    @session = new Simplebudget.Models.Session()
    @session.on('sync change', @render, this)
    @model = new Simplebudget.Models.Post({id: this.id})
    @model.on('sync change', @render, this)
    @model.fetch()
    @session.fetch()

  render: ->
    $(@el).html(@template(post: @model.toJSON(), current_user: @session.toJSON()))
    this

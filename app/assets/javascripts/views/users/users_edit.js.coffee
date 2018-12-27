class Simplebudget.Views.UserEdit extends Backbone.View
  template: HandlebarsTemplates['users/edit']



  initialize: ->
    @model = new Simplebudget.Models.User({id: this.id})
    @model.on('sync change', @render, this)
    @model.fetch()

  render: ->
    $(@el).html(@template(user: @model.toJSON()))
    this

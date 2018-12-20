class Simplebudget.Views.Profile extends Backbone.View
  template: HandlebarsTemplates['users/profile']



  initialize: ->
    @session = new Simplebudget.Models.Session()
    @session.on('sync change', @render, this)
    @session.fetch()



  render: ->
    # @account = new Simplebudget.Models.Account({id: @session.id})
    @model = new Simplebudget.Models.User({id: @session.id})
    @model.fetch()
    $(@el).html(@template(user: @model.toJSON()))
    this

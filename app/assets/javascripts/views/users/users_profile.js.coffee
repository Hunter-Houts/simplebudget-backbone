class Simplebudget.Views.Profile extends Backbone.View
  template: HandlebarsTemplates['users/profile']



  initialize: ->
    @session = new Simplebudget.Models.Session()
    @session.on('sync change', @render, this)
    @session.fetch()
    @model = new Simplebudget.Models.User()
    @model.on('sync change', @render, this)
    @model.fetch()
    @collection = new Simplebudget.Collections.Bills()
    # @collection.on('sync change', @render, this)
    @collection.fetch().done => @render



  render: ->
    # @account = new Simplebudget.Models.Account({id: @session.id})
    # @collection.each (bill)-> @billtotal += Number(bill.get('amount'))
    # console.log @billTotal
    $(@el).html(@template(user: @model.toJSON(), billTotal: @collection.billTotal()))
    this

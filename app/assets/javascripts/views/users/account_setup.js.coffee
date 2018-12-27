class Simplebudget.Views.AccountSetup extends Backbone.View
  template: HandlebarsTemplates['users/createAccount']

  events:
    'submit #createAccountForm': 'createAccount'
    'click #exampleRadios1': 'check1'
    'click #exampleRadios2': 'check2'
    'click #exampleRadios3': 'check3'
    'submit #addBill': 'addBill'

  initialize: ->
    @router = new Simplebudget.Routers.Home()
    @session = new Simplebudget.Models.Session()
    @session.on('sync change', @render, this)
    @session.fetch()
    @model = new Simplebudget.Models.User()
    @model.on('sync change', @render, this)
    @model.fetch()
    @account = new Simplebudget.Models.Account()
    @account.on('sync change', @render, this)
    @account.fetch()
    @collection = new Simplebudget.Collections.Bills()
    @bill = new Simplebudget.Models.Bill()
    # @collection.on('sync change', @render, this)
    @collection.fetch().done => @render

  render: ->
    $(@el).html(@template(user: @model.toJSON(), bills: @collection.toJSON(), account: @account, bill: @bill))
    this

  createAccount: (event) ->
    event.preventDefault()
    monthlyIncome = $('#monthlyincome').val()
    option1 = $('input[name=exampleRadios1]')
    option2 = $('input[name=exampleRadios2]')
    option3 = $('input[name=exampleRadios3]')
    if option1.is(':checked')
      if @account.save({income: monthlyIncome * 4, option: option1.val()}, wait: true, error: @handleError)
        window.location.href = '/profile'
    else if option2.is(':checked')
      if @account.save({income: monthlyIncome * 2, option: option2.val()}, wait: true, error: @handleError)
        window.location.href = '/profile'
    else if option3.is(':checked')
      if @account.save({income: monthlyIncome, option: option3.val()}, wait: true, error: @handleError)
        window.location.href = '/profile'

  handleError: (entry, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages
  check1: ->
    $("#exampleRadios1").attr('checked','checked')
    $("#exampleRadios2").removeAttr('checked')
    $("#exampleRadios3").removeAttr('checked')
  check2: ->
    $("#exampleRadios2").attr("checked","checked")
    $("#exampleRadios3").removeAttr('checked')
    $("#exampleRadios1").removeAttr('checked')
  check3: ->
    $("#exampleRadios3").attr("checked","checked")
    $("#exampleRadios2").removeAttr('checked')
    $("#exampleRadios1").removeAttr('checked')

  addBill: (event) ->
    event.preventDefault()
    name = $('#billname').val()
    amount = $('#billamount').val()
    if @bill.save({name: name, amount: amount}, wait: true, error: @handleError)
      @collection.add(@bill)
      window.location.href = '/account-setup'





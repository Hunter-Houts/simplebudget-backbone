class Simplebudget.Views.Profile extends Backbone.View
  template: HandlebarsTemplates['users/profile']

  events:
    'OnRender': 'createChart'



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

  createChart: ->
    moneyAfterBills = document.getElementById("moneyAfterBills")
    moneyAfterBillsNumber = parseFloat(moneyAfterBills.innerText.substring(1,moneyAfterBills.innerText.length-1))
    spendAmount = document.getElementById("spendAmount")
    amount = (moneyAfterBillsNumber/28)
    spendAmount.innerText = "You can spend $" + amount.toFixed(2) + " per day."
    billTotal = document.getElementById("billTotal")
    billNames = Array.from(document.getElementsByClassName("billName"))
    billAmounts = Array.from(document.getElementsByClassName("billAmount"))
    monthlyIncome = parseFloat(document.getElementById("monthlyIncome").innerText.substring(1,document.getElementById("monthlyIncome").innerText.length-1))
    dataArray = [['Monthly Income','Expenses'],['Left over after bills', moneyAfterBillsNumber],]
    billNames.each((element,index) ->
      dataArray.push([billNames[index].innerText.charAt(0).toUpperCase() + billNames[index].innerText.slice(1), Number(billAmounts[index].innerText)]))
    drawChart: ->
      data = google.visualization.arrayToDataTable(dataArray)
      options = width: $("#piechartsize").width() - $("#piechartsize").width()*.26, height: $("#piechartsize").height(), title: "Budget Broken Down", is3D: true
      chart = new google.visualization.PieChart(document.getElementById("piechart"))
      chart.draw(data,options)
      $(window).resize(() ->
        drawChart())
    google.charts.load("current",{'packages':['corechart']})
    google.charts.setOnLoadCallback(drawChart)

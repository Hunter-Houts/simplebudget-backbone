class Simplebudget.Views.PieChart extends Backbone.View
  template: HandlebarsTemplates['other/piechart']

  initialize: ->
    # _.bindAll(this, 'createChart')
    $(window).on('resize',@drawChart)
    @session = new Simplebudget.Models.Session()
    @session.on('sync change', @render, this)
    @session.fetch()
    @model = new Simplebudget.Models.User()
    @model.on('sync change', @render, this)
    @model.fetch()
    @collection = new Simplebudget.Collections.Bills()
    # @collection.on('sync change', @render, this)
    @collection.fetch().done => @render
    google.charts.load('current',{'packages':['corechart']})
    google.charts.setOnLoadCallback(@drawChart)



  render: ->
    $(@el).html(@template(user: @model.toJSON(), billTotal: @collection.billTotal()))
    this

  drawChart: ->
    moneyAfterBills = document.getElementById("moneyAfterBills")
    moneyAfterBillsNumber = parseFloat(moneyAfterBills.innerText.substring(1,moneyAfterBills.innerText.length-1))
    billNames = Array.from(document.getElementsByClassName("billName"))
    billAmounts = Array.from(document.getElementsByClassName("billAmount"))
    dataArray = [['Monthly Income','Expenses'],['Left over after bills', moneyAfterBillsNumber],]
    console.log dataArray
    billNames.forEach((element,index) ->
      dataArray.push([billNames[index].innerText.charAt(0).toUpperCase() + billNames[index].innerText.slice(1), Number(billAmounts[index].innerText)]))
    chart = new google.visualization.PieChart(document.getElementById('piechart'))
    data = google.visualization.arrayToDataTable(dataArray)
    options = width: $("#piechartsize").width() - $("#piechartsize").width()*.26, height: $("#piechartsize").height(), title: "Budget Broken Down", is3D: true
    chart.draw(data,options)

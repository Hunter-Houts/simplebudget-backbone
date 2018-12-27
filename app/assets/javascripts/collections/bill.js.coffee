class Simplebudget.Collections.Bills extends Backbone.Collection
  url: '/bills'

  model: Simplebudget.Models.Bill

  billTotal: 'billTotal'

  billTotal: ->
    sum = 0
    this.reduce((memo, value) -> sum += Number(value.get('amount')))
    return sum

class Simplebudget.Collections.Bills extends Backbone.Collection
  url: '/bills'

  model: Simplebudget.Models.Bill

  billTotal: 'billTotal'

  billTotal: ->
    this.reduce((memo, value) -> value.get('amount'))

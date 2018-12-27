window.Simplebudget =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Simplebudget.Routers.Home()
    Backbone.history.start({pushState: true})
# Handlebar helpers start
Handlebars.registerHelper 'ifEquals', (arg1, arg2, options) ->
  if arg1 == arg2 then options.fn(this) else options.inverse(this)
Handlebars.registerHelper 'notEquals', (arg1, arg2, options) ->
  if arg1 != arg2 then options.fn(this) else options.inverse(this)
Handlebars.registerHelper 'Greater', (v1, v2, options) ->
  if v1 > v2
    return options.fn(this)

  return options.inverse(this)
Handlebars.registerHelper 'toFixed', (val) ->
  return Number(val).toFixed(2)
Handlebars.registerHelper 'subtract', (v1, v2) ->
  return (Number(v1) - Number(v2)).toFixed(2)
Handlebars.registerHelper 'divide', (v1, num) ->
  return (Number(v1) / Number(num)).toFixed(2)

# Handlebar helpers end
$(document).ready ->
  Simplebudget.initialize()
  $(document).on('click', 'a:not([data-bypass])', (evt) ->
    href = {prop: $(this).prop("href"), attr: $(this).attr("href")}
    root = location.protocol + '//' + location.host + Backbone.history.options.root
    if href.prop && href.prop.slice(0, root.length) == root
      evt.preventDefault()
      Backbone.history.navigate(href.attr,true))

window.Simplebudget =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Simplebudget.Routers.Home()
    Backbone.history.start({pushState: true})

Handlebars.registerHelper 'ifEquals', (arg1, arg2, options) ->
  if arg1 == arg2 then options.fn(this) else options.inverse(this)
$(document).ready ->
  Simplebudget.initialize()
  $(document).on('click', 'a:not([data-bypass])', (evt) ->
    href = {prop: $(this).prop("href"), attr: $(this).attr("href")}
    root = location.protocol + '//' + location.host + Backbone.history.options.root
    if href.prop && href.prop.slice(0, root.length) == root
      evt.preventDefault()
      Backbone.history.navigate(href.attr,true))

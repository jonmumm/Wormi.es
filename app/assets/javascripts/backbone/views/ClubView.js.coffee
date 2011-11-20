Wormies.Views.ClubView = Backbone.View.extend
  initialize: ->
    @el.hide()
    if @model.get('volume')?
      @render()
    else
      @model.bind 'change', $.proxy @render, @

  template: JST["backbone/templates/club"]

  render: ->
    @el.html @template @model.toJSON()
    @el.show('fast')

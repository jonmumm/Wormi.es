Wormies.Views.ClubView = Backbone.View.extend
  initialize: ->
    if @model.get('volume')?
      @render()
    else
      @model.bind 'change', $.proxy @render, @

  template: JST["backbone/templates/club"]

  render: ->
    @el.html @template @model.toJSON()
    console.log @model.toJSON()

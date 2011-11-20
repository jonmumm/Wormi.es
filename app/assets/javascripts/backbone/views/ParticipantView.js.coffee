Wormies.Views.ParticipantView = Backbone.View.extend
  initialize: ->
    @model.bind 'change:id', $.proxy @onIdChange, @
    @model.bind 'change:state', $.proxy @onStateChange, @

    app.get('session').addEventListener 'streamPropertyChanged', $.proxy @onStreamPropertyChange, @

  template: JST["backbone/templates/participant"]

  events:
    "click .remove": "onRemoveClick"
    "click .tostage": "onToStageClick"
    "click .offstage": "offStageClick"

  onRemoveClick: ->
    $(document).trigger 'remove', @model

  onToStageClick: ->
    $(document).trigger 'toStage', @model

  offStageClick: ->
    $(document).trigger 'offStage', @model

  onIdChange: (model) ->
    @el.attr 'id', model.id

  onStateChange: (model, collection) ->
    @el.removeClass('publish')
    @el.addClass(model.get('state'))

  onKeyDown: (event) ->
    if event.keyCode is 16
      @model.get('publisher').publishAudio true

  onKeyUp: (event) ->
    if event.keyCode is 16
      @model.get('publisher').publishAudio false

  onStreamPropertyChange: (event) ->
    if event.stream.streamId is @model.id
      if event.changedProperty is "hasAudio"
        if event.newValue
          @el.addClass("hasAudio")
        else
          @el.removeClass("hasAudio")

  render: ->
    @el.html @template

    if @model.get('stream')
      subscriber = app.get('session').subscribe @model.get('stream'), "videoContainer"
      @model.set
        subscriber: subscriber
    else
      publisher = app.get('session').publish "videoContainer"
        publishAudio: false
      @model.set
        publisher: publisher

      @el.addClass 'me'

      $(document).bind 'keydown', $.proxy @onKeyDown, @
      $(document).bind 'keyup', $.proxy @onKeyUp, @
